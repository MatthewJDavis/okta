terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.42"
    }
  }
}

# org_name, base_url, client_id and private_key are all set in environment variables.
provider "okta" {
  scopes = ["okta.apps.manage", "okta.apps.read", "okta.policies.read"]
}

resource "okta_app_oauth" "demo_app" {
  label                     = "Sample DotNet OIDC"
  type                      = "web"
  consent_method            = "REQUIRED"
  login_uri                 = "https://localhost:5001/authorization-code/callback"
  post_logout_redirect_uris = ["https://localhost:5001/signout-callback-oidc"]
  redirect_uris             = ["https://localhost:5001/signin-oidc"]
  omit_secret               = true # if downloading to state- set to false and create logic to save somewhere secure.
  grant_types               = ["authorization_code"]
  response_types            = ["code"]
}
