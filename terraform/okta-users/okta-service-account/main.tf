terraform {
  required_providers {
    okta = {
      source = "okta/okta"
    version = "~> 3.42" }
  }
}

# org_name, base_url, client_id and private_key are all set in environment variables.
provider "okta" {
  scopes = ["okta.users.manage"]
}

resource "okta_user" "terraform_application" {
  login       = "svc_terraform@example.com"
  email       = "svc_terraform@example.com"
  first_name  = "Terraform"
  last_name   = "Application Automation"
  password    = var.password
  admin_roles = ["APP_ADMIN"]
}

resource "okta_user" "terraform_application_svc" {
  login       = "example+tokt@gmail.com"
  email       = "example+tokt@gmail.com"
  first_name  = "Terraform"
  last_name   = "Application Automation"
  password    = var.password
  admin_roles = ["APP_ADMIN"]
}
