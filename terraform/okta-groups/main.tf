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
  scopes = ["okta.groups.manage", "okta.groups.read"]
}

resource "okta_group" "external_sales" {
  name        = "department-sales"
  description = "All Sales team members"
  skip_users  = true
}

resource "okta_group_rule" "external_sales" {
  name   = "department-sales"
  status = "ACTIVE"
  group_assignments = [
  resource.okta_group.external_sales.id]
  expression_type  = "urn:okta:expression:1.0"
  expression_value = "String.stringContains(user.department,'sales')"
}