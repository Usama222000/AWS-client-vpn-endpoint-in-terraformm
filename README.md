## Terraform AWS Client VPN Endpoint
This Terraform module deploys an AWS Client VPN Endpoint with associated security groups and network associations.

## Modules Overview

This Terraform module sets up an AWS Client VPN Endpoint within a specified VPC. It creates the necessary security groups, associates subnets for VPN access, and configures authentication options.

## Usage
+ Ensure you have the necessary AWS credentials and Terraform installed on your system.
+ Run the following commands in the directory containing your Terraform files:
```hcl
terraform init
terraform apply -var-file=config.tfvars
```
