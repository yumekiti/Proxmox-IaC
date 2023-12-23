# lxc-basic
module "lxc-basic" {
  hostname         = "lxc-basic"
  source           = "./lxc-basic/terraform"
  target_node      = "proxmox"
  ipv4_address     = "192.168.11.30/24"
  gateway_address  = "192.168.11.1"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}