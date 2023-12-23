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
    ip   = var.ipv4_address
    gw     = var.gateway_address
  }

  ssh_public_keys = <<-EOT
    ${file(var.public_key_path)}
  EOT

  provisioner "remote-exec" {
    inline = [
      "echo 'connect to ${split("/", var.ipv4_address)[0]}'"
    ]

    connection {
      type        = "ssh"
      host        = split("/", var.ipv4_address)[0]
      user        = "root"
      private_key = file(var.private_key_path)
    }
  }

  provisioner "local-exec" {
    command = <<-EOT
      ANSIBLE_HOST_KEY_CHECKING=False \
      ansible-playbook \
      -i ${split("/", var.ipv4_address)[0]}, \
      -u root \
      ./${var.hostname}/playbook.yml
    EOT
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

variable "ipv4_address" {
  description = "The IPv4 address of the container"
  type        = string
}

variable "gateway_address" {
  description = "The IPv4 gateway address of the container"
  type        = string
}

variable "public_key_path" {
  type = string
}

variable "private_key_path"{
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