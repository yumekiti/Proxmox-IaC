variable "hostname" {
  description = "The hostname of the container"
  type        = string
}

variable "target_node" {
  description = "The node to create the container on"
  type        = string
}

variable "bridge_name" {
  description = "The name of the bridge to attach the container to"
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

variable "private_key_path" {
  type = string
}