## How to run

```bash
terraform plan -var-file ./proxmox.tfvars
terraform apply -var-file ./proxmox.tfvars

# モジュール単位で実行する場合
terraform [plan|apply|destroy] -var-file ./proxmox.tfvars -target=module.[モジュール名]
```

## Example

```bash
terraform plan -var-file ./proxmox.tfvars -target=module.lxc-basic
terraform apply -var-file ./proxmox.tfvars -target=module.lxc-basic

terraform destroy -var-file ./proxmox.tfvars -target=module.lxc-basic
```

## IP addresses Table

| Name | IP Address | Port | Description |
|------|------------|------| ----------- |
| [dnsmasq](./dnsmasq) | 10.10.10.2/24 | 53 | DHCP |
| [cloudflare](./cloudflare) | 10.10.10.3/24 | | Cloudflare Tunnel |
| [wireguard](./wireguard) | 10.10.10.4/24 | 51820 | Wireguard VPN |
| [gitea](./gitea) | 10.10.10.5/24 | 3000 | Gitea |
| [memos](./memos) | 10.10.10.6/24 | 5230 | SNS |
| [ecc-wiki](./ecc-wiki) | 10.10.10.7/24 | 80 | Wiki |
| [ecc-blog](./ecc-blog) | 10.10.10.8/24 | 80 | Blog |
| [infra-ops](./infra-ops) | 10.10.10.9/24 | | Terraform, Ansible |
| [lxc-basic](./lxc-basic) | 10.10.10.10/24 | | LXC Container |
| [jenkins](./jenkins) | 10.10.10.11/24 | 8080 | CI/CD |