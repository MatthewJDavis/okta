# Okta Terraform

Provision resources in Okta with Terraform.

[Okta Terraform Provider].

To authenticate with an API token

```bash
 export OKTA_API_TOKEN=""
```


If using a service app add the following to the provider and specify the [scopes] required.

```hcl
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  scopes = ["okta.apps.manage"]
  client_id = var.client_id
  private_key = "/path-to-key/private-key.pem"
}
```

Settings can also be configured in environment variables

```bash
 export OKTA_ORG_NAME=""
 export OKTA_BASE_URL="okta.com"
 export OKTA_API_CLIENT_ID=""
 export OKTA_API_PRIVATE_KEY="/home/.jwks/privatekeyfile.pem"
```

[Okta Terraform Provider]: https://registry.terraform.io/providers/okta/okta/latest/docs
[scopes]: https://developer.okta.com/docs/guides/implement-oauth-for-okta/scopes/