# okta

Okta code samples and resources

Terraform infrastructure as code and scripts to interact with Okta. Testing on my dev account.

## Terraform directory

Here you'll find some basic example okta resources that can be provisioned by Terraform.

These use OAuth application to authenticate with Okta and the setting should be configured in the current session environment variables.

```bash
export OKTA_API_CLIENT_ID="123456" # oauth app client id
export OKTA_API_PRIVATE_KEY="/home/private_key.pem" # full path to private RSA format key
export OKTA_BASE_URL="okta.com"
export OKTA_ORG_NAME="dev-123456" #  Org name minus the domain
```

## Dev tenant set up

Work in progress to configure a dev tenant for testing.

## User data

Generated with [generatedata.com](https://generatedata.com/generator)
