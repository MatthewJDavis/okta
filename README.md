# okta

Okta code samples and resources that can be used as a reference to get up and running.
Terraform infrastructure as code and scripts to interact with Okta. Testing on my dev account.

## Terraform directory

Here you'll find some basic example Okta resources that can be provisioned by Terraform.

These use OAuth application to authenticate with Okta and the setting should be configured in the current session environment variables. Can easily enough be changed to use an API token by removing the scopes and setting ```OKTA_API_TOKEN``` value in the environment instead of the private key and client_id.

```bash
export OKTA_API_CLIENT_ID="123456" # oauth app client id
export OKTA_API_PRIVATE_KEY="/home/private_key.pem" # full path to private RSA format key
export OKTA_BASE_URL="okta.com"
export OKTA_ORG_NAME="dev-123456" #  Org name minus the domain
```

### Makefile

Makefile in root directory for formatting and testing commands. Will format all Terraform files and the 'test' currently checks the Terraform is valid and formatted correctly. Can be expanded at a later date.

```bash
make format
make test
```

## Dev tenant set up

Work in progress to configure a dev tenant for testing.

## User data

Generated with [generatedata.com](https://generatedata.com/generator)
