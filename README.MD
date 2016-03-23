# GData to New Client Bridge

This project serves as a way to take the old, out-dated GData APIs from Google that are still in service and allow them to work with the new client libraries.

This is achieved by generating a Discovery-Bridge .json file nearly identical to what is found in the [Google Discovery API](https://developers.google.com/discovery/) which can then be run through the [Google APIs Client Generator](https://github.com/google/apis-client-generator) (with some minor modifications).

Once the generator has created the appropriate client library, the code can be consume with only the need of a custom deserializer.

This project is available as-is, and is imagined primarily to serve as an additional piece to the [gShell project](https://github.com/squid808/gShell).

Example files, instructions and additional APIs forthcoming.

### Current APIs with Discovery-Bridge Docs Available
[(]admin_emailsettings_v1](https://developers.google.com/admin-sdk/email-settings/)
