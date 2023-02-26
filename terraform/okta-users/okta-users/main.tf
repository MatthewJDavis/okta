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
  scopes = ["okta.users.manage"]
}

locals {
  users = csvdecode(file("data/users.csv"))
}

resource "okta_user" "my_user" {
  for_each           = { for user in local.users : user.emp_id => user }
  first_name         = each.value.first_name
  last_name          = each.value.last_name
  login              = lower("${var.email_prefix}${each.value.first_name}${each.value.last_name}${var.email_domain}")
  email              = lower("${var.email_prefix}${each.value.first_name}${each.value.last_name}${var.email_domain}")
  department         = each.value.department
  honorific_prefix   = each.value.honorificPrefix
  title              = each.value.title
  user_type          = each.value.userType
  organization       = each.value.organization
  division           = each.value.division
  preferred_language = each.value.preferredLanguage
  country_code       = each.value.countryCode
  skip_roles         = true # admin roles managed separately.
}