# Users for dev account.

In data/users.csv are some users for testing. In production, users would usually be sourced from an HR system or another directory but for testing purposes, this shows how users can be read in from the csv file in Terraform and the provisioned.

The variables ```email_domain``` and ```email_prefix``` should be updated as required. The email prefix is useful if testing with gmail, you can set it with a plus to create separate emails for your test users ```someemail+``` then ```@gmail``` will create ```someemail+michaelscott@gmail.com``` for a test user's email and login.

This uses an OAuth application and should have the ```okta.users.manage``` scopes granted.

```
 export OKTA_ORG_NAME=""
 export OKTA_BASE_URL="okta.com"
 export OKTA_API_CLIENT_ID=""
 export OKTA_API_PRIVATE_KEY="/home/.jwks/privatekeyfile.pem"
```