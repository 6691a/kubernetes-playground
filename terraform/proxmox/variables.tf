variable "setting" {
  type = string
  sensitive = true
  default = "../../secret/proxmox_credential.json"
}

locals {
  setting = jsondecode(file(var.setting))
}