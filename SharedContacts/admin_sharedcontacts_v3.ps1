Import-Module ([System.IO.Path]::Combine((get-item $PSScriptRoot ).parent.FullName,"DiscoveryDocGenerator.psm1")) `
    -DisableNameChecking

$Json = New-DiscoveryDocument `
    -ApiName "admin"`
    -ApiVersion "sharedcontacts_v3"`
    -CanonicalName "sharedcontacts"`
    -Title "Admin Email Settings API"`
    -Description "Enables Google partners to programmatically manipulate most user-level Google Mail settings."`
    -DocLink "https://developers.google.com/admin-sdk/domain-shared-contacts/"`
    -BaseUrl "https://www.google.com/"`
    -BasePath "m8/feeds/contacts/"

Add-Scope -JsonObj $Json `
    -Scope "http://www.google.com/m8/feeds/contacts/" `
    -Description "Global scope for access to all domain shared contacts"

##SCHEMA - use the XML Attribute Name here
$SchemaName = "Email"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string address `
    -Description ""
Add-SchemaProperty $Json $SchemaName string displayName `
    -Description ""
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName bool primary `
    -Description ""

$SchemaName = "ExtendedProperty"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string name `
    -Description ""
Add-SchemaProperty $Json $SchemaName string value `
    -Description ""
Add-SchemaProperty $Json $SchemaName string realm `
    -Description ""
Add-SchemaProperty $Json $SchemaName string foreignElement `
    -Description ""


$SchemaName = "Im"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string address `
    -Description ""
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName string protocol `
    -Description ""
Add-SchemaProperty $Json $SchemaName bool primary `
    -Description ""

$SchemaName = "Name"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string givenName `
    -Description ""
Add-SchemaProperty $Json $SchemaName string additionalName `
    -Description ""
Add-SchemaProperty $Json $SchemaName string familyName `
    -Description ""
Add-SchemaProperty $Json $SchemaName string namePrefix `
    -Description ""
Add-SchemaProperty $Json $SchemaName string nameSuffix `
    -Description ""
Add-SchemaProperty $Json $SchemaName string fullName `
    -Description ""

$SchemaName = "Organization"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string orgDepartment `
    -Description ""
Add-SchemaProperty $Json $SchemaName string orgJobDescription `
    -Description ""
Add-SchemaProperty $Json $SchemaName string orgName `
    -Description ""
Add-SchemaProperty $Json $SchemaName string orgSymbol `
    -Description ""
Add-SchemaProperty $Json $SchemaName string orgTitle `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean primary `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName object where -ObjectRef Where `
    -Description ""


$SchemaName = "PhoneNumber"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName string uri `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean primary `
    -Description ""
Add-SchemaProperty $Json $SchemaName string text `
    -Description ""

$SchemaName = "StructuredPostalAddress"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName string mailClass `
    -Description ""
Add-SchemaProperty $Json $SchemaName string usage `
    -Description ""
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean primary `
    -Description ""
Add-SchemaProperty $Json $SchemaName string agent `
    -Description ""
Add-SchemaProperty $Json $SchemaName string housename `
    -Description ""
Add-SchemaProperty $Json $SchemaName string street `
    -Description ""
Add-SchemaProperty $Json $SchemaName string pobox `
    -Description ""
Add-SchemaProperty $Json $SchemaName string neighborhood `
    -Description ""
Add-SchemaProperty $Json $SchemaName string city `
    -Description ""
Add-SchemaProperty $Json $SchemaName string subregion `
    -Description ""
Add-SchemaProperty $Json $SchemaName string region `
    -Description ""
Add-SchemaProperty $Json $SchemaName string postcode `
    -Description ""
Add-SchemaProperty $Json $SchemaName string country `
    -Description ""
Add-SchemaProperty $Json $SchemaName string formattedAddress `
    -Description ""

$SchemaName = "EntryLink"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string href `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean readOnly `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName object entry -ObjectRef Contact `
    -Description ""

$SchemaName = "Where"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string rel `
    -Description ""
Add-SchemaProperty $Json $SchemaName string valueString `
    -Description ""
Add-SchemaProperty $Json $SchemaName object entryLink -ObjectRef EntryLink `
    -Description ""

$SchemaName = "Contact"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string content `
    -Description ""
Add-SchemaProperty $Json $SchemaName string category `
    -Description ""
Add-SchemaProperty $Json $SchemaName string title `
    -Description ""
Add-SchemaProperty $Json $SchemaName array email -ArrayObjRef Email `
    -Description ""
Add-SchemaProperty $Json $SchemaName array extendedProperty -ArrayObjRef ExtendedProperty `
    -Description ""
Add-SchemaProperty $Json $SchemaName bool deleted `
    -Description ""
Add-SchemaProperty $Json $SchemaName array im -ArrayObjRef Im `
    -Description ""
Add-SchemaProperty $Json $SchemaName object name -ObjectRef Name `
    -Description ""
Add-SchemaProperty $Json $SchemaName array organization -ArrayObjRef Organization `
    -Description ""
Add-SchemaProperty $Json $SchemaName array phoneNumber -ArrayObjRef PhoneNumber `
    -Description ""
Add-SchemaProperty $Json $SchemaName array structuredPostalAddress -ArrayObjRef StructuredPostalAddress `
    -Description ""
Add-SchemaProperty $Json $SchemaName object where -ObjectRef Where `
    -Description ""
Add-SchemaProperty $Json $SchemaName string id `
    -Description ""
Add-SchemaProperty $Json $SchemaName string updated `
    -Description ""
Add-SchemaProperty $Json $SchemaName array links -ArrayObjRef EntryLink `
    -Description ""

$SchemaName = "Contacts"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array contacts -ArrayObjRef Contact `
    -Description ""
Add-SchemaProperty $Json $SchemaName integer max-results `
    -Description ""
Add-SchemaProperty $Json $SchemaName integer start-index `
    -Description ""

$SchemaName = "Photo"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string image -Format byte `
    -Description ""

##METHODS
$MethodScopes = @("http://www.google.com/m8/feeds/contacts/")
$MethodPrefix = "sharedcontacts"

#CONTACTS
$MethodName = "contact"
$MethodType = "insert"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full" POST `
    -Scopes $MethodScopes `
    -Description "" -RequestObjRef Contact -ResponseObjRef Contact
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1

$MethodType = "list"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full" GET `
    -Scopes $MethodScopes `
    -Description "" -ResponseObjRef Contacts
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType integer max-results $false query
Add-MethodParam $Json $MethodName $MethodType integer start-index $false query
Add-MethodParam $Json $MethodName $MethodType string updated-min $false query
Add-MethodParam $Json $MethodName $MethodType string orderby $false query
Add-MethodParam $Json $MethodName $MethodType string showdeleted $false query
Add-MethodParam $Json $MethodName $MethodType string sortorder $false query

$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full/{id}" GET `
    -Scopes $MethodScopes `
    -Description "" -ResponseObjRef Contact
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string id $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full/{id}/{version}" PUT `
    -Scopes $MethodScopes `
    -Description "" -ResponseObjRef Contact -RequestObjRef Contact
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string id $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string version $true path -ParamOrder 3

$MethodType = "delete"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full/{id}/{version}" DELETE `
    -Scopes $MethodScopes `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string id $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string version $true path -ParamOrder 3

$MethodName = "photo"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full/{id}" GET `
    -Scopes $MethodScopes `
    -Description "" -ResponseObjRef Photo
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string id $true path -ParamOrder 2

<#$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/full/{id}" `
    PUT -Scopes $MethodScopes -ResponseObjRef Photo -RequestObjRef Photo `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string id $true path -ParamOrder 2#>

#FINAL
Export-DiscoveryDoc $Json "admin_sharedcontacts_v3.json" $PSScriptRoot -PyGen $True