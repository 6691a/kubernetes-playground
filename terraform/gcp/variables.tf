variable "credentials" {
  type = string
  default = "../../secret/gcp_credential.json"
  sensitive = true
}

variable "region" {
  type = string
  default = "asia-south1"
}

locals {
    credentials = file(var.credentials)
    project = jsondecode(local.credentials).project_id
}