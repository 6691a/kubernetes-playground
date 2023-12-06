terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = local.setting.api_url
  pm_api_token_id = local.setting.api_token_id
  pm_api_token_secret = local.setting.api_token_secret
}

