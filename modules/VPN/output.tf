output "VPN" {
  value = {
    id = aws_ec2_client_vpn_endpoint.vpn.id
  }
}