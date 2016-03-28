. ..\DiscoveryDocGenerator.ps1

$Json = New-DiscoveryDocument `
    -ApiName "admin"`
    -ApiVersion "adminsettings_v1"`
    -CanonicalName "adminsettings"`
    -Title "Admin Settings API"`
    -Description "Allows administrators of Google Apps domains to retrieve and change the settings of their domains."`
    -DocLink "https://developers.google.com/admin-sdk/reports/"`
    -BaseUrl "https://apps-apis.google.com/"`
    -BasePath "a/feeds/domain/2.0/"

Add-Scope -JsonObj $Json `
    -Scope "https://apps-apis.google.com/a/feeds/domain/" `
    -Description "Global scope for access to all domain settings"

##SCHEMA - use the XML Attribute Name here
$SchemaName = "DefaultLanguage"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string defaultLanguage `
    -Description ""

$SchemaName = "OrganizationName"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string organizationName `
    -Description ""

$SchemaName = "MaximumNumberOfUsers"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string maximumNumberOfUsers `
    -Description ""

$SchemaName = "CurrentNumberOfUsers"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string currentNumberOfUsers `
    -Description ""

$SchemaName = "Edition"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string edition `
    -Description ""

$SchemaName = "CustomerPin"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string customerPIN `
    -Description ""

$SchemaName = "CreationTime"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string creationTime `
    -Description ""

$SchemaName = "CountryCode"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string countryCode `
    -Description ""

$SchemaName = "AdminSecondaryEmail"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string adminSecondaryEmail `
    -Description ""

$SchemaName = "CustomLogo"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string logoImage -Format byte `
    -Description ""

$SchemaName = "MXVerificationStatus"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean verified `
    -Description ""
Add-SchemaProperty $Json $SchemaName string verifiedMethod `
    -Description ""

$SchemaName = "SsoSettings"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string samlSignonUri `
    -Description ""
Add-SchemaProperty $Json $SchemaName string samlLogoutUri `
    -Description ""
Add-SchemaProperty $Json $SchemaName string changePasswordUri `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean enableSSO `
    -Description ""
Add-SchemaProperty $Json $SchemaName string ssoWhitelist `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean useDomainSpecificIssuer `
    -Description ""

$SchemaName = "SsoSigningKey"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string signingKey `
    -Description ""

$SchemaName = "Gateway"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string smartHost `
    -Description ""
Add-SchemaProperty $Json $SchemaName string smtpMode `
    -Description ""

$SchemaName = "Routing"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string routeDestination `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean routeRewriteTo `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean routeEnabled `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean bounceNotification `
    -Description ""
Add-SchemaProperty $Json $SchemaName string accountHandling `
    -Description "" #allAccounts, provisionedAccounts, unknownAccounts

##METHODS
$MethodScopes = @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/")
$MethodPrefix = "adminsettings"

#GENERAL
$MethodName = "defaultLanguage"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/defaultLanguage" `
    GET -Scopes $MethodScopes -ResponseObjRef DefaultLanguage `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/defaultLanguage" `
    PUT -Scopes $MethodScopes -ResponseObjRef DefaultLanguage -RequestObjRef DefaultLanguage `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "organizationName"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/organizationName" `
    GET -Scopes $MethodScopes -ResponseObjRef OrganizationName `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/organizationName" `
    PUT -Scopes $MethodScopes -ResponseObjRef OrganizationName -RequestObjRef OrganizationName `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "maximumUsers"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/maximumNumberOfUsers" `
    GET -Scopes $MethodScopes -ResponseObjRef MaximumNumberOfUsers `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "currentUsers"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/general/currentNumberOfUsers" `
    GET -Scopes $MethodScopes -ResponseObjRef CurrentNumberOfUsers `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#ACCOUNT
$MethodName = "productVersion"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/edition" `
    GET -Scopes $MethodScopes -ResponseObjRef Edition `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "customerPin"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/customerPIN" `
    GET -Scopes $MethodScopes -ResponseObjRef CustomerPin `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "creationTime"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/creationTime" `
    GET -Scopes $MethodScopes -ResponseObjRef CreationTime `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "countryCode"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/countryCode" `
    GET -Scopes $MethodScopes -ResponseObjRef CountryCode `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "adminSecondaryEmail"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/adminSecondaryEmail" `
    GET -Scopes $MethodScopes -ResponseObjRef AdminSecondaryEmail `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/accountInformation/adminSecondaryEmail" `
    PUT -Scopes $MethodScopes -ResponseObjRef AdminSecondaryEmail -RequestObjRef AdminSecondaryEmail `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#APPEARANCE
$MethodName = "domainLogo"
$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/appearance/customLogo" `
    PUT -Scopes $MethodScopes -ResponseObjRef CustomLogo -RequestObjRef CustomLogo `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#VERIFICATION
$MethodName = "mxVerificationStatus"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/verification/mx" `
    GET -Scopes $MethodScopes -ResponseObjRef MXVerificationStatus `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/verification/mx" `
    PUT -Scopes $MethodScopes -ResponseObjRef MXVerificationStatus -RequestObjRef MXVerificationStatus `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#SINGLE SIGNON
$MethodName = "ssoSettings"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/sso/general" `
    GET -Scopes $MethodScopes -ResponseObjRef SsoSettings `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/sso/general" `
    PUT -Scopes $MethodScopes -ResponseObjRef SsoSettings -RequestObjRef SsoSettings `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "ssoSigningKey"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/sso/signingkey" `
    GET -Scopes $MethodScopes -ResponseObjRef SsoSigningKey `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/sso/signingkey" `
    PUT -Scopes $MethodScopes -ResponseObjRef SsoSigningKey -RequestObjRef SsoSigningKey `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#EMAIL
$MethodName = "emailGateway"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/email/gateway" `
    GET -Scopes $MethodScopes -ResponseObjRef Gateway `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/email/gateway" `
    PUT -Scopes $MethodScopes -ResponseObjRef Gateway -RequestObjRef Gateway `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

$MethodName = "emailRouting"
$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domainName}/emailrouting" `
    POST -Scopes $MethodScopes -ResponseObjRef Routing -RequestObjRef Routing `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domainName $true path -ParamOrder 1

#FINAL
Export-DiscoveryDoc $Json "admin_adminsettings_v1.json" (Split-Path -parent $PSCommandPath) -PyGen $True