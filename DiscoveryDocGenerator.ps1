try {
    [DocCreation.ResourceType] -eq $null | Out-Null
} catch {
    $MyEnums = @"
namespace DocCreation
{
    //[System.FlagsAttribute]
    public enum ResourceType
    { delete, get, insert, list, patch, update }

    public enum HttpMethod
    { GET, POST, PUT, DELETE, INSERT }

    public enum ParameterType
    { query, path }

    public enum SchemaPropType
    { @string, boolean, integer, array, @object, any }

    public enum SchemaPropFormat
    { @byte, date, datetime, @double, int32, int64, uint32 }

    public enum MethodPropType
    { @string, integer }

    public enum MethodPropFormat
    { int32, uint32 }
}
"@

    Add-Type -TypeDefinition $MyEnums -Language CSharpVersion3

    Remove-Variable MyEnums
}

function New-DiscoveryDocument{
Param(
    [Parameter(Mandatory=$true)]
    [string]$ApiName,
    
    [Parameter(Mandatory=$true)]
    [string]$ApiVersion,
    
    [Parameter(Mandatory=$true)]
    [string]$CanonicalName,

    [Parameter(Mandatory=$true)]
    [string]$Title,
    
    [Parameter(Mandatory=$true)]
    [string]$Description,

    [Parameter(Mandatory=$true)]
    [string]$DocLink,
    
    [Parameter(Mandatory=$true)]
    [string]$BaseUrl,
    
    [Parameter(Mandatory=$true)]
    [string]$BasePath
)
    if ($BaseUrl[-1] -ne "/") {$BaseUrl += "/"}
    if ($BasePath[0] -eq "/") {$BasePath = $BasePath.TrimStart("/")}
    if ($BasePath[-1] -ne "/") {$BasePath += "/"}

    $ParamsObj = [ordered]@{
        alt = [ordered]@{
            type = "string"
            description = "Data format for the response."
            default = "atom+xml"
            enum = @("atom+xml")
            enumDescriptions = @("Responses with Content-Type of application/xml")
            location = "query"
        }
        fields = [ordered]@{
            type = "string"
            description = "Selector specifying which fields to include in a partial response."
            location = "query"
        }
        key = [ordered]@{
            type = "string"
            description = "API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token."
            location = "query"
        }
        oauth_token = [ordered]@{
            type = "string"
            description = "Oauth 2.0 token for the current user."
            location = "query"
        }
        prettyPrint = [ordered]@{
            type = "boolean"
            description = "Returns response with indentations and line breaks."
            default = "true"
            location = "query"
        }
        quotaUser = [ordered]@{
            type = "string"
            description = "Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided."
            location = "query"
        }
        userIp = [ordered]@{
            type = "string"
            description = "IP address of the site where the request originates. Use this if you want to enforce per-user limits."
            location = "query"
        }
    }

    $JsonObj = [ordered]@{
        isGdata = $true.ToString().ToLower()
        kind = "discovery#restDescription"
        etag = ""
        discoveryVersion = "https://github.com/squid808/"
        id = $ApiName + ":" + $ApiVersion
        name = $ApiName
        canonicalName = $CanonicalName
        version = $ApiVersion
        revision = (Get-Date).ToString("yyyyMMdd")
        title = $Title
        description = $Description
        ownerDomain = "google.com"
        ownerName = "Google"
        packagePath = $ApiName
        icons = @{}
        documentationLink = $DocLink
        protocol = "rest"
        baseUrl = $BaseUrl + "/" + $BasePath
        basePath = "/" + $BasePath
        rootUrl = $BaseUrl
        servicePath = $BasePath
        batchPath = "batch"
        parameters = $ParamsObj
        auth = [ordered]@{
            oauth2 = [ordered]@{
                scopes = [ordered]@{}
            }
        }
        schemas = [ordered]@{}
        resources = [ordered]@{}
    }

    return (New-Object psobject -Property $JsonObj)
}

function Add-Scope {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$Scope,

    [Parameter(Mandatory=$true)]
    [string]$Description
)
    $JsonObj.auth.oauth2.scopes[$Scope] = [ordered]@{description = $Description}
}

function Add-Resource {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$Resource
)

    if ($JsonObj.resources.Contains($Resource)) {
        Write-Error "Resource already exists."
    } else {
        $JsonObj.resources[$Resource] = [ordered]@{
            methods = [ordered]@{}
        }
    }

}

function Add-Method {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,
    
    [Parameter(Mandatory=$true)]
    [string]$Resource,
    
    [Parameter(Mandatory=$true)]
    [string]$IdPrefix,

    [Parameter(Mandatory=$true)]
    [DocCreation.ResourceType]$MethodName,

    [Parameter(Mandatory=$true)]
    [string]$Path,
    
    [Parameter(Mandatory=$true)]
    [DocCreation.HttpMethod]$HttpMethod,
    
    [Parameter(Mandatory=$true)]
    [System.Collections.ICollection]$Scopes,


    [string]$Description="",
    [string]$RequestObjRef=$null,
    [string]$ResponseObjRef=$null
)

    [string]$MethodName = $MethodName.ToString()
    [string]$HttpMethod = $HttpMethod.ToString()

    if (-not $JsonObj.resources.Contains($Resource)) {
        $JsonObj.resources[$Resource] = [ordered]@{methods=[ordered]@{}}
    }

    $MethodObj = [ordered]@{
        id = "$IdPrefix.$Resource.$MethodName"
        path = $Path
        httpMethod = $HttpMethod
        description = $Description
    }

    if ($RequestObjRef) {$MethodObj.Add("request",@{"`$ref"=$RequestObjRef})}

    $MethodObj.Add("parameters", [ordered]@{})

    if ($ResponseObjRef) {$MethodObj.Add("response",@{"`$ref"=$ResponseObjRef})}

    $MethodObj.Add("scopes", $Scopes)

    $JsonObj.resources[$Resource].methods[$MethodName] = $MethodObj
}

function Add-MethodParam {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$Resource,

    [Parameter(Mandatory=$true)]
    [DocCreation.ResourceType]$Method,

    [Parameter(Mandatory=$true)]
    [DocCreation.MethodPropType]$Type,

    [Parameter(Mandatory=$true)]
    [string]$ParamName,    

    [Parameter(Mandatory=$true)]
    [bool]$IsRequired,

    [Parameter(Mandatory=$true)]
    [DocCreation.ParameterType]$Location,

    [int]$ParamOrder,
    [string]$Description = "",

    [Parameter(Mandatory=$false)]
    [DocCreation.MethodPropFormat]$Format,

    [Parameter(Mandatory=$false)]
    [Int]$Minimum,

    [Parameter(Mandatory=$false)]
    [Int]$Maximum

)

    [string]$Method = $Method.ToString()
    [string]$Location = $Location.ToString()

    if ($JsonObj.resources.Contains($Resource)) {

        if ($JsonObj.resources[$Resource].methods.Contains($Method)){

            $ParamObj = [ordered]@{
                type = $Type.ToString()
                description = $Description
                required = $IsRequired.ToString().ToLower()
            }

            if ($Format) {$ParamObj["format"] = $Format}
            if ($Minimum) {$ParamObj["minimum"] = $Minimum.ToString()}
            if ($Maximum) {$ParamObj["maximum"] = $Maximum.ToString()}

            $ParamObj["location"] = $Location

            $JsonObj.resources[$Resource].methods[$Method].parameters[$ParamName] = $ParamObj

            if ($paramOrder) {
                if (-not ($JsonObj.resources[$Resource].methods[$Method].Contains("parameterOrder"))){
                    $JsonObj.resources[$Resource].methods[$Method].Add("parameterOrder", (New-Object System.Collections.ArrayList))
                }

                $JsonObj.resources[$Resource].methods[$Method].parameterOrder.Insert($ParamOrder-1, $ParamName)
            }

        } else {
            Write-Error "Cannot find the Method on the Json Object Resource."
        }
    } else {
        Write-Error "Cannot find the Resource on the Json Object."
    }

}

function Add-Schema {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$Schema,

    [string]$Description = ""
)

    $SchemaObj = [ordered]@{
        id = $Schema
        type = "object"
        description = $Description
        properties = [ordered]@{}
    }

    if ($JsonObj.schemas.Contains($Schema)) {
        Write-Error "Schema already exists."
    } else {
        $JsonObj.schemas[$Schema] = $SchemaObj
    }
}

function Add-SchemaProperty {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$Schema,
    
    [Parameter(Mandatory=$true)]
    [DocCreation.SchemaPropType]$Type,

    [Parameter(Mandatory=$true)]
    [string]$Property,

    [string]$Description="",

    [DocCreation.SchemaPropFormat]$Format,

    [string]$ArrayObjRef
)

    [string]$Type = $Type.ToString()

    if ($Format -eq [DocCreation.SchemaPropFormat]::datetime){
        [string]$Format = "date-time"
    } elseif ($Format -ne $null) {
        [string]$Format = $Format.ToString();
    }

    if ($JsonObj.schemas.Contains($Schema)) {
        if ($JsonObj.schemas[$Schema].properties.Contains($Property)){
            Write-Error "Schema property already exists."
        } else {
            $PropertyObj = [ordered]@{
                type = $Type
                description = $Description
            }

            if ($Type -eq "array") {
                $PropertyObj["items"] = [ordered]@{
                    "`$ref" = $ArrayObjRef
                }
            }

            if ($Format) {$PropertyObj["format"] = $Format}

            $JsonObj.schemas[$Schema].properties[$Property] = $PropertyObj
        }
    } else {
        Write-Error "Schema doesn't exist."
    }
}

function Export-DiscoveryDoc {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [string]$FileName,

    [Parameter(Mandatory=$true)]
    [string]$CallingDir,

    [bool]$PyGen=$false
)

    $Json = Prepare-JsonOutput $JsonObj -ReductionFactor 16

    $DestFile = [System.IO.Path]::Combine($CallingDir, $FileName)
    $Json | Out-File -FilePath $DestFile -Encoding ascii

    if ($PyGen) {
        PushTo-PythonGenerator -inputPath $DestFile
    }
}

function Prepare-JsonOutput {
Param(
    [Parameter(Mandatory=$true)]
    [psobject]$JsonObj,

    [Parameter(Mandatory=$true)]
    [int]$ReductionFactor
)

    $J = $JsonObj | ConvertTo-Json -Depth 15

    $lines = ($JsonObj | ConvertTo-Json -Depth 15) -split '\r\n'

    for ($i = 0; $i -lt $lines.Length; $i ++){
    #foreach ($line in $Lines) {
        if ($lines[$i] -match '^ +') {
            $lines[$i] = ' ' * ($Matches[0].Length / $ReductionFactor) + $lines[$i].TrimStart()
        }
    }

    $J = ($Lines -join "`r`n") -replace '{( |\r\n)+}', '{}'

    return $J
}

function PushTo-PythonGenerator {
Param(
    [Parameter(Mandatory=$true)]
    [string]$inputPath
)

    if (Test-Path .\pygen.config){
        $configPath = ".\pygen.config"
    } else {
        $configPath = "..\pygen.config"
    }

    try {
        [xml]$config = get-content $configPath
    } catch {
        Write-Error "Must have a pygen.config file to continue."
    }

    $OriginalPyPath = $Env:PYTHONPATH

    if (-NOT [string]::IsNullOrWhiteSpace($config.config.pythonGeneratorPath)) {
        if (-not $Env:PYTHONPATH -eq $config.config.pythonGeneratorPath){
            $Env:PYTHONPATH = $config.config.pythonGeneratorPath.Replace('"','')
        }
    } else {
        Write-Error "The element pythonGeneratorPath must be filled out in pygen.config in order to continue."
    }

    try {
        if (-NOT [string]::IsNullOrWhiteSpace($config.config.scriptLocation)) {
            $script = $config.config.scriptLocation
        } else {
            Write-Error "The element scriptLocation must be filled out in pygen.config in order to continue."
        }

        $iArg = "--input=" + $inputPath

        if ([string]::IsNullOrWhiteSpace($config.config.language))
        {
            Write-Warning "Language not found in pygen.config, using a default of csharp."
            $lArg = "--language=csharp"
        } else {
            $lArg = "--language=" + $config.config.language
        }

        if ([string]::IsNullOrWhiteSpace($config.config.output_dir))
        {
            Write-Warning "Output directory not found in pygen.config, using script location."
            $oArg = "--output_dir=" + (Get-Location)
        } else {
            $oArg = "--output_dir=" + $config.config.output_dir
        }

        if (-not [string]::IsNullOrWhiteSpace($config.config.language_variant)){
            $lvArg = "--language_variant=" + $config.config.language_variant
        } else {
            $lvArg = "--language_variant=default"
        }

        try {
            python $script $iArg $lArg $oArg $lvArg
        } catch {
            write-error "Unable to launch the APIs Client Generator."
        }
    } finally {
        $Env:PYTHONPATH = $OriginalPyPath
    }
}