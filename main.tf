# lxc-basic
module "lxc-basic" {
  source      = "./lxc-basic"
  target_node = "proxmox"
  hostname    = "lxc-basic"
}