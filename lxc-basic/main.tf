resource "proxmox_lxc" "basic" {
  target_node = var.target_node
  hostname    = var.hostname
  cores       = 1
  memory      = 512
  swap        = 512
  ostemplate  = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  password    = var.hostname
  start       = true

  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

variable "hostname" {
  description = "The hostname of the container"
  type        = string
}

variable "target_node" {
  description = "The node to create the container on"
  type        = string
}

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.13"
    }
  }
}