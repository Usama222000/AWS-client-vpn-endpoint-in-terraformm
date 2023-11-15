
variable "VPN" {
  type =object({
      identifier = string
      description = string
      client_cidr_block = string
      split_tunnel = bool
      certificate_arn = string
      authentication_type = string
      logs_enabled = bool
      vpc_id = string
      tags = map(string)
  })
}
variable "SG" {
  type = object({
    name        = string
    ingress_cidr_blocks      = list(string)
    ingress_rules            = list(string)
    ingress_with_cidr_blocks = object({
      from_port   = number
      to_port     = number
      protocol    = string
      description = string
      cidr_blocks = string
      rule        = string
    })
   
  })
}