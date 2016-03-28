. ..\DiscoveryDocGenerator.ps1

$Json = New-DiscoveryDocument `
    -ApiName "admin"`
    -ApiVersion "emailsettings_v1"`
    -CanonicalName "emailsettings"`
    -Title "Admin Email Settings API"`
    -Description "Enables Google partners to programmatically manipulate most user-level Google Mail settings."`
    -DocLink "https://developers.google.com/admin-sdk/reports/"`
    -BaseUrl "https://apps-apis.google.com/"`
    -BasePath "a/feeds/emailsettings/2.0/"

Add-Scope -JsonObj $Json `
    -Scope "https://apps-apis.google.com/a/feeds/emailsettings/2.0/" `
    -Description "Global scope for access to all email settings"


##SCHEMA - use the XML Attribute Name here
$SchemaName = "Delegate"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string address `
    -Description ""
Add-SchemaProperty $Json $SchemaName string delegate `
    -Description ""
Add-SchemaProperty $Json $SchemaName string delegationId `
    -Description ""
Add-SchemaProperty $Json $SchemaName string status `
    -Description ""

$SchemaName = "Delegates"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array delegates -ArrayObjRef Delegate `
    -Description ""

$SchemaName = "Filter"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string from `
    -Description ""
Add-SchemaProperty $Json $SchemaName string to `
    -Description ""
Add-SchemaProperty $Json $SchemaName string subject `
    -Description ""
Add-SchemaProperty $Json $SchemaName string hasTheWord `
    -Description ""
Add-SchemaProperty $Json $SchemaName string doesNotHaveTheWord `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean hasAttachment `
    -Description ""

Add-SchemaProperty $Json $SchemaName boolean shouldArchive `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean shouldMarkAsRead `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean shouldStar `
    -Description ""
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string forwardTo `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean shouldTrash `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean neverSpam `
    -Description ""

$SchemaName = "Forwarding"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable `
    -Description ""
Add-SchemaProperty $Json $SchemaName string forwardTo `
    -Description ""
Add-SchemaProperty $Json $SchemaName string action `
    -Description "" #KEEP, ARCHIVE, DELETE, MARK_READ

$SchemaName = "General"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName integer pageSize `
    -Description "" #25, 50, or 100
Add-SchemaProperty $Json $SchemaName boolean shortcuts `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean arrows `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean snippets `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean unicode `
    -Description ""

$SchemaName = "Imap"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable `
    -Description ""

$SchemaName = "Label"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string label `
    -Description ""
Add-SchemaProperty $Json $SchemaName string labelid `
    -Description ""
Add-SchemaProperty $Json $SchemaName string unreadCount -Format uint32 `
    -Description ""
Add-SchemaProperty $Json $SchemaName string visibility `
    -Description ""

$SchemaName = "Labels"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array labels -ArrayObjRef Label `
    -Description ""

$SchemaName = "Language"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string language `
    -Description "" #LIST IS ON WEBSITE

$SchemaName = "Pop"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable `
    -Description ""
Add-SchemaProperty $Json $SchemaName string enableFor `
    -Description "" # ALL_MAIL or MAIL_FROM_NOW_ON
Add-SchemaProperty $Json $SchemaName string action `
    -Description "" #KEEP, ARCHIVE or DELETE

$SchemaName = "SendasAlias"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string name `
    -Description ""
Add-SchemaProperty $Json $SchemaName string address `
    -Description ""
Add-SchemaProperty $Json $SchemaName string replyTo `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean makeDefault `
    -Description ""

$SchemaName = "SendAsAliases"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array sendasAliases -ArrayObjRef SendasAlias `
    -Description ""

$SchemaName = "Signature"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string signature `
    -Description ""

$SchemaName = "VacationResponder"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean contactsOnly `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean domainOnly `
    -Description ""
Add-SchemaProperty $Json $SchemaName boolean enable `
    -Description ""
Add-SchemaProperty $Json $SchemaName string endDate -Format date `
    -Description ""
Add-SchemaProperty $Json $SchemaName string message `
    -Description ""
Add-SchemaProperty $Json $SchemaName string startDate -Format date `
    -Description ""
Add-SchemaProperty $Json $SchemaName string subject `
    -Description ""

$SchemaName = "WebClip"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable `
    -Description ""


##METHODS
$MethodScopes = @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/")
$MethodPrefix = "emailsettings"

#DELEGATION
$MethodName = "delegation"
$MethodType = "delete"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/delegation/{delegateEmail}" DELETE `
    -Scopes $MethodScopes `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string delegateEmail $true path -ParamOrder 3

$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/delegation" GET `
    -Scopes $MethodScopes -ResponseObjRef Delegates `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/delegation" POST `
    -Scopes $MethodScopes -ResponseObjRef Delegate -RequestObjRef Delegate `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FILTERS
$MethodName = "filters"
$MethodType = "insert"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/filter" POST `
    -Scopes $MethodScopes -RequestObjRef Filter -ResponseObjRef Filter
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FORWARDING
$MethodName = "forwarding"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/forwarding" GET `
    -Scopes $MethodScopes -ResponseObjRef Forwarding `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/forwarding" PUT `
    -Scopes $MethodScopes -RequestObjRef Forwarding -ResponseObjRef Forwarding `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#GENERAL
$MethodName = "general"
$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/general" PUT `
    -Scopes $MethodScopes -RequestObjRef General -ResponseObjRef General `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#IMAP
$MethodName = "imap"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/imap" GET `
    -Scopes $MethodScopes -ResponseObjRef Imap `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/imap" PUT `
    -Scopes $MethodScopes -ResponseObjRef Imap -RequestObjRef Imap `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#LABELS
$MethodName = "labels"
$MethodType = "delete"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/label/{labelName}" DELETE `
    -Scopes $MethodScopes `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string labelName $true path -ParamOrder 3

$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/label" GET `
    -Scopes $MethodScopes -ResponseObjRef Labels `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/label" POST `
    -Scopes $MethodScopes -ResponseObjRef Label -RequestObjRef Label `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#LANGUAGE
$MethodName = "language"
$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/language" PUT `
    -Scopes $MethodScopes -ResponseObjRef Language -RequestObjRef Language `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#POP
$MethodName = "pop"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/pop" GET `
    -Scopes $MethodScopes -ResponseObjRef Pop `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/pop" PUT `
    -Scopes $MethodScopes -ResponseObjRef Pop -RequestObjRef Pop `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#SIGNATURE
$MethodName = "signature"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/signature" GET `
    -Scopes $MethodScopes -ResponseObjRef Signature `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/signature" PUT `
    -Scopes $MethodScopes -ResponseObjRef Signature -RequestObjRef Signature `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#SENDAS ALIAS
$MethodName = "sendasAliases"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/sendas" GET `
    -Scopes $MethodScopes -ResponseObjRef SendAsAliases
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/sendas" POST `
    -Scopes $MethodScopes -ResponseObjRef SendasAlias -RequestObjRef SendasAlias `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#VACATION RESPONDER
$MethodName = "vacationResponder"
$MethodType = "get"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/vacation" GET `
    -Scopes $MethodScopes -ResponseObjRef VacationResponder `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/vacation" PUT `
    -Scopes $MethodScopes -ResponseObjRef VacationResponder -RequestObjRef VacationResponder `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#WEBCLIPS
$MethodName = "webClip"
$MethodType = "update"
Add-Method $Json $MethodName $MethodPrefix $MethodType "{domain}/{userKey}/webclip" PUT `
    -Scopes $MethodScopes -ResponseObjRef WebClip -RequestObjRef WebClip `
    -Description ""
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FINAL
Export-DiscoveryDoc $Json "admin_emailsettings_v1.json" -PyGen $True