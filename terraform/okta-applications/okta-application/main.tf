terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = ">= 3.10.0"
    }
  }
}

# Configure the Okta Provider - API token set in env var.
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  scopes = ["okta.apps.manage"]
  client_id = var.client_id
  private_key = "/home/matt/private-key.pem"
}

resource "okta_app_oauth" "demo_app" {
  label = "Sample DotNet OIDC"
  type = "web"
  consent_method = "REQUIRED"
  login_uri = "https://localhost:5001/authorization-code/callback"
  post_logout_redirect_uris = ["https://localhost:5001/signout-callback-oidc"]
  redirect_uris = ["https://localhost:5001/signin-oidc"]
  omit_secret = false
  grant_types = ["authorization_code"]
  response_types = ["code"]
  groups = ["00g3yu4bj4Akjp4c25d6", "00g4688yfvdtKHYx05d6"]
}

resource "okta_app_oauth" "terraform" {
  # (resource arguments)
  label = "Terraform2"
  type = "service"
  consent_method = "REQUIRED"
  response_types = ["token"]
  grant_types = [ "client_credentials" ]
  token_endpoint_auth_method = "private_key_jwt"
  jwks {
      kty = "RSA"
      kid = "SIGNING_KEY"
      e   = "AQAB"
      n   = "oRxt9eP_btvbgo7VPedqoaknHIxaZYlDvhg6tw12aD4RBEh9Nnd3evMrJh3caQ4oWKnI0zTIL49N8ys_4qELC6B5gMppQBwwuMSLzFKpIDkKsUSKF8EiQuFPwTV-shYbcB7SzBpEgreQKoxW1ZkB7i-Bm0PbBBPYJpWcZleu-IOjws54SqOMOYxJiXec9YJuWTH7JiUFhHjL1Kk0MRh4hOrK-xwX-FS_peKw8jbxzWO2BWN2_AIqnc5NUSfcN1eyJKDA4asUH01oAiJEfaF0iTPIY-s2uRQyfInmssb8VeixDZKPBnkppcPRFVLrbe3shSlHINc13Mu51KXeCN1WJQ"
    }
}
