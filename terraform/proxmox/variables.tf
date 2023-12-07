variable "setting" {
  type = string
  default = "../../secret/proxmox_credential.json"
}

locals {
  setting = jsondecode(file(var.setting))
}