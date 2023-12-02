variable "credentials" {
  type = string
  sensitive = true
  default = "../../secret/proxmox_credential.json"
}

locals {
  credentials = jsondecode(file(var.credentials))
}