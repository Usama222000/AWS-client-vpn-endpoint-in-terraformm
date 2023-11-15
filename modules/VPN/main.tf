locals {
  default_tags = {
    Environment = terraform.workspace
    Name        = "${var.VPN.identifier}-${terraform.workspace}"
  }
  tags = merge(local.default_tags, var.VPN.tags)
}
module "security-group" {
  source = "terraform-aws-modules/security-group/aws"
  
  name        = "${var.app_name}-SecurityGroup"
  description = "Security Group for ${var.app_name}"
  vpc_id      = var.VPN.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = var.security_group_from_port
      to_port     = var.security_group_to_port
      protocol    = var.security_group_protocol
      description = var.security_group_description
      cidr_blocks = var.security_group_cidr_blocks
    }
  ]
  tags = local.tags
}

resource "aws_ec2_client_vpn_endpoint" "vpn" {
  description = var.VPN.description
  client_cidr_block = var.VPN.client_cidr_block
  split_tunnel = var.VPN.split_tunnel
  server_certificate_arn = var.VPN.certificate_arn
  vpc_id                  = var.VPN.vpc_id
  security_group_ids      = [module.security-group.security_group_id]
  authentication_options {
    type = var.VPN.authentication_type
    root_certificate_chain_arn = var.VPN.certificate_arn
  }

  connection_log_options {
    enabled = var.VPN.logs_enabled
  }
  tags = local.tags

}
data "aws_subnets" "example" {  
   filter {
    name   = "vpc-id"
    values = [var.VPN.vpc_id]
  }
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}
output "subnet_ids" {
  value = data.aws_subnets.example
}

resource "aws_ec2_client_vpn_network_association" "vpn_subnets" {
  count = length(data.aws_subnets.example.ids[*])
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn.id
  subnet_id = data.aws_subnets.example.ids[count.index]

  lifecycle {
    ignore_changes = [subnet_id]
  }
}