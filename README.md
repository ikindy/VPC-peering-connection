# Terraform AWS Multi-Account VPC Peering

This Terraform project sets up VPC peering between two AWS accounts. It creates a VPC with public subnets in the first account and establishes a peering connection with a VPC in the second account.

## Features

- **AWS Account 1:**
  - Creates a VPC with public subnets.
  - Configures DNS support and hostnames.
  - Tags resources for better organization.

- **AWS Account 2:**
  - Assumes a specified role for access.
  - Accepts the peering connection initiated by Account 1.

## Prerequisites

- AWS credentials with appropriate permissions.
- Terraform installed locally.

## Usage

1. Clone the repository.
2. Modify `main.tf` with your AWS account details.
3. Run `terraform init` and `terraform apply` to provision resources.

## Important Notes

- Ensure that necessary AWS roles and permissions are set up for cross-account access.

## Contributors

- Kindheart Ilegogie (@ikindy)


Feel free to contribute and improve this Terraform module!
