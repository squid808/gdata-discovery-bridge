. .\DiscoveryDocGenerator.ps1 

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


#SCHEMA - use the XML Attribute Name here
$SchemaName = "Delegate"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string address
Add-SchemaProperty $Json $SchemaName string delegate
Add-SchemaProperty $Json $SchemaName string delegationId
Add-SchemaProperty $Json $SchemaName string status

$SchemaName = "Delegates"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array delegates -ArrayObjRef Delegate

$SchemaName = "Filter"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string from
Add-SchemaProperty $Json $SchemaName string to
Add-SchemaProperty $Json $SchemaName string subject
Add-SchemaProperty $Json $SchemaName string hasTheWord
Add-SchemaProperty $Json $SchemaName string doesNotHaveTheWord
Add-SchemaProperty $Json $SchemaName boolean hasAttachment

Add-SchemaProperty $Json $SchemaName boolean shouldArchive
Add-SchemaProperty $Json $SchemaName boolean shouldMarkAsRead
Add-SchemaProperty $Json $SchemaName boolean shouldStar
Add-SchemaProperty $Json $SchemaName string label
Add-SchemaProperty $Json $SchemaName string forwardTo
Add-SchemaProperty $Json $SchemaName boolean shouldTrash
Add-SchemaProperty $Json $SchemaName boolean neverSpam

$SchemaName = "Forwarding"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable
Add-SchemaProperty $Json $SchemaName string forwardTo
Add-SchemaProperty $Json $SchemaName string action #KEEP, ARCHIVE, DELETE, MARK_READ

$SchemaName = "General"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName integer pageSize #25, 50, or 100
Add-SchemaProperty $Json $SchemaName boolean shortcuts
Add-SchemaProperty $Json $SchemaName boolean arrows
Add-SchemaProperty $Json $SchemaName boolean snippets
Add-SchemaProperty $Json $SchemaName boolean unicode

$SchemaName = "Imap"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable

$SchemaName = "Label"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string label
Add-SchemaProperty $Json $SchemaName string labelid
Add-SchemaProperty $Json $SchemaName string unreadCount -Format uint32
Add-SchemaProperty $Json $SchemaName string visibility

$SchemaName = "Labels"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array labels -ArrayObjRef Label

$SchemaName = "Language"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string language #LIST IS ON WEBSITE

$SchemaName = "Pop"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable
Add-SchemaProperty $Json $SchemaName string enableFor # ALL_MAIL or MAIL_FROM_NOW_ON
Add-SchemaProperty $Json $SchemaName string action #KEEP, ARCHIVE or DELETE

$SchemaName = "SendasAlias"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string name
Add-SchemaProperty $Json $SchemaName string address
Add-SchemaProperty $Json $SchemaName string replyTo
Add-SchemaProperty $Json $SchemaName boolean makeDefault

$SchemaName = "SendAsAliases"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName array sendasAliases -ArrayObjRef SendasAlias

$SchemaName = "Signature"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName string signature

$SchemaName = "VacationResponder"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean contactsOnly
Add-SchemaProperty $Json $SchemaName boolean domainOnly
Add-SchemaProperty $Json $SchemaName boolean enable
Add-SchemaProperty $Json $SchemaName string endDate -Format date
Add-SchemaProperty $Json $SchemaName string message
Add-SchemaProperty $Json $SchemaName string startDate -Format date
Add-SchemaProperty $Json $SchemaName string subject

$SchemaName = "WebClip"
Add-Schema $Json $SchemaName
Add-SchemaProperty $Json $SchemaName boolean enable


##METHODS
#DELEGATION
$MethodName = "delegation"
$MethodType = "delete"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/delegation/{delegateEmail}" DELETE `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/")
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string delegateEmail $true path -ParamOrder 3

$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/delegation" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Delegates
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/delegation" POST `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Delegate -RequestObjRef Delegate
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FILTERS
$MethodName = "filters"
$MethodType = "insert"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/filter" POST `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -RequestObjRef Filter -ResponseObjRef Filter
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FORWARDING
$MethodName = "forwarding"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/forwarding" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Forwarding
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/forwarding" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -RequestObjRef Forwarding -ResponseObjRef Forwarding
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#GENERAL
$MethodName = "general"
$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/general" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -RequestObjRef General -ResponseObjRef General
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#IMAP
$MethodName = "imap"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/imap" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Imap
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/imap" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Imap -RequestObjRef Imap
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#LABELS
$MethodName = "labels"
$MethodType = "delete"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/label/{labelName}" DELETE `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/")
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2
Add-MethodParam $Json $MethodName $MethodType string labelName $true path -ParamOrder 3

$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/label" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Labels
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/label" POST `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Label -RequestObjRef Label
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#LANGUAGE
$MethodName = "language"
$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/language" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Language -RequestObjRef Language
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#POP
$MethodName = "pop"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/pop" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Pop
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/pop" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Pop -RequestObjRef Pop
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#SIGNATURE
$MethodName = "signature"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/signature" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Signature
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/signature" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef Signature -RequestObjRef Signature
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#SENDAS ALIAS
$MethodName = "sendasAliases"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/sendas" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef SendAsAliases
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "insert"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/sendas" POST `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef SendasAlias -RequestObjRef SendasAlias
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#VACATION RESPONDER
$MethodName = "vacationResponder"
$MethodType = "get"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/vacation" GET `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef VacationResponder
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/vacation" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef VacationResponder -RequestObjRef VacationResponder
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#WEBCLIPS
$MethodName = "webClip"
$MethodType = "update"
Add-Method $Json $MethodName emailsettings $MethodType "{domain}/{userKey}/webclip" PUT `
    -Scopes @("https://apps-apis.google.com/a/feeds/emailsettings/2.0/") -ResponseObjRef WebClip -RequestObjRef WebClip
Add-MethodParam $Json $MethodName $MethodType string domain $true path -ParamOrder 1
Add-MethodParam $Json $MethodName $MethodType string userKey $true path -ParamOrder 2

#FINAL
$SourceFolder = Split-Path -parent $PSCommandPath
$DestFile = $SourceFolder + "\admin_emailsettings_v1.json"
Export-DiscoveryDoc $Json -ReductionFactor 16 | Out-File -FilePath $DestFile