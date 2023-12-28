module "lxc-basic" {
  hostname         = "lxc-basic"
  source           = "./lxc-basic/terraform"
  target_node      = "node1"
  bridge_name      = "vmbr1"
  ipv4_address     = "10.10.10.10/24"
  gateway_address  = "10.10.10.1"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}

module "jenkins" {
  hostname         = "jenkins"
  source           = "./jenkins/terraform"
  target_node      = "node1"
  bridge_name      = "vmbr1"
  ipv4_address     = "10.10.10.11/24"
  gateway_address  = "10.10.10.1"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}

module "tldraw" {
  hostname         = "tldraw"
  source           = "./tldraw/terraform"
  target_node      = "node1"
  bridge_name      = "vmbr1"
  ipv4_address     = "10.10.10.12/24"
  gateway_address  = "10.10.10.1"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}