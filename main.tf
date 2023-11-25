# Define the provider for the first AWS account
provider "aws" {
  region = "us-west-1"
}

# Create the VPC in the first AWS account
resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Tags for better organization and identification
  tags = {
    Name        = "my-vpc"
    Environment = "production"
  }
}

# Create public subnet 1 in the first AWS account
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  # Tags for better organization and identification
  tags = {
    Name        = "public-subnet-1"
    Environment = "production"
  }
}

# Create public subnet 2 in the first AWS account
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  # Tags for better organization and identification
  tags = {
    Name        = "public-subnet-2"
    Environment = "production"
  }
}

# Define the provider for the second AWS account
provider "aws" {
  alias  = "account2"
  region = "us-west-1"

  # Assume role for the second AWS account
  assume_role {
    role_arn = "" # role's arn (Old account)
  }
}

# Create the peering connection in the first AWS account
resource "aws_vpc_peering_connection" "peering" {
  provider = aws

  depends_on = [
    aws_vpc.vpc
  ]

  # Peering connection configuration
  peer_vpc_id   = "" # old account vpc
  vpc_id        = aws_vpc.vpc.id # new account
  auto_accept   = false
  peer_region   = "us-west-1" # old account
  peer_owner_id = "" # old account ID
}

# Create the peering connection accepter in the second AWS account
resource "aws_vpc_peering_connection_accepter" "accepter" {
  provider                        = aws.account2
  vpc_peering_connection_id       = aws_vpc_peering_connection.peering.id
  auto_accept                     = true
}
