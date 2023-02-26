variable "email_domain" {
  description = "Email domain of the business."
  type        = string
  default     = "@gmail.com"
}

variable "email_prefix" {
  description = "Email prefix if there is one. Used for + prefix for testing with Gmail. Can be removed."
  type        = string
  default     = "somegmailaddress+"
}