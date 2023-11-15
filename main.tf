
module "vpc_access" {
  source             = "./modules/VPN"
  VPN                = var.VPN
}

