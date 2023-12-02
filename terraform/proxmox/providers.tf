terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

provider "proxmox" {
  pm_api_url = local.credentials.api_url
  pm_api_token_id = local.credentials.api_token_id
  pm_api_token_secret = local.credentials.api_token_secret
}

