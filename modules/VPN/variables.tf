variable "VPN" {}

variable "app_name" {
  description = "Name for the application service"
  type        = string
  default = "xxxxx"
}

variable "security_group_from_port" {
  description = "Name of the environment"
  type        = string
  default = "0"
}

variable "security_group_to_port" {
  description = "Name of the environment"
  type        = string
  default = "0"
}

variable "security_group_protocol" {
  description = "Name of the environment"
  type        = string
  default = "All"
}

variable "security_group_cidr_blocks" {
  description = "Name of the environment"
  type        = string
  default = "0.0.0.0/0"
}

variable "security_group_description" {
  description = "Name of the environment"
  type        = string
  default = "User-service ports"
}

