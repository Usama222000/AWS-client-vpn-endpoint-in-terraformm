VPN = {
  identifier = "xxxxxxx"
  description = "Client VPN example"
  client_cidr_block = "10.20.0.0/22"
  split_tunnel = true
  certificate_arn = "arn:aws:acm:us-east-2:xxxxxxxxx:certificate/296766bd-42ad-41ce-be39-2df284878c6e"
  authentication_type = "certificate-authentication"
  logs_enabled = false
  vpc_id = "vpc-063896432c1bdf477"
  tags = {}
}
SG = {
  name        = "xxxxxxx"
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = {
      from_port   = 0
      to_port     = 0
      protocol    = "All"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
      rule        = "all-traffic"
  }
  
}

