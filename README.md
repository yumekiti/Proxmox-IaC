## How to run

```bash
terraform plan -var-file ./proxmox.tfvars
terraform apply -var-file ./proxmox.tfvars

# モジュール単位で実行する場合
terraform [plan|apply|destroy] -var-file ./proxmox.tfvars -target=module.[モジュール名]
```

## IP addresses Table

| Name | IP Address | Port | Description |
|------|------------|------|-------------|
| dnsmasq | 10.10.10.2/24 | 53 | Node1 DHCP |
| cloudflare | 10.10.10.3/24 | | Cloudflare |
| wireguard | 10.10.10.4/24 | 51820 | 学内VPN |
| gitea | 10.10.10.5/24 | 3000, 22 | Github |
| memos | 10.10.10.6/24 | 5230 | SNS |
| ecc-wiki | 10.10.10.7/24 | 80 | ECC Wiki |
| ecc-blog | 10.10.10.8/24 | 80 | ECC ブログ |
| infra-ops | 10.10.10.9/24 | | TerraformとAnsible |
| lxc-basic | 10.10.10.10/24 | | infar-opsのお試し |