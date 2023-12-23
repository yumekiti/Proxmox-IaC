provider "proxmox" {
  pm_api_url          = var.api_url
  pm_api_token_id     = var.pve_token_id
  pm_api_token_secret = var.pve_token_secret
}

variable "api_url" {
  description = "The URL of the Proxmox API"
  type        = string
  sensitive   = false
}
variable "pve_token_id" {
  description = "The ID of the Proxmox API token"
  type        = string
  sensitive   = true
}
variable "pve_token_secret" {
  description = "The secret of the Proxmox API token"
  type        = string
  sensitive   = true
}

variable "public_key_path" {
  type = string
}

variable "private_key_path" {
  type = string
}

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.13"
    }
  }
}
