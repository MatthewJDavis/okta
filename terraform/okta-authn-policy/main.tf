# Only for OIE orgs.
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
  scopes = ["okta.policies.manage"]
}


resource "okta_app_signon_policy" "low_assurance" {
  name        = "Low assurance Sign-On Policy"
  description = "Authentication Policy for low assurance apps."
}

resource "okta_app_signon_policy_rule" "low_assurance" {
  policy_id   = okta_app_signon_policy.low_assurance.id
  name        = "Possession based phishing resistant."
  factor_mode = "1FA"
  constraints = [
    jsonencode(
      {
        possession = {
          deviceBound = "REQUIRED"
          phishingResistant = "REQUIRED"
        }
      }
    )
  ]
}