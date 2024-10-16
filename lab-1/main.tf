provider "aws" {
  region = "eu-west-3"
  access_key =  "XXXX"
  secret_key =  "XXXXXXXX"
}


# Create a VPC
resource "aws_vpc" "dev-env-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev-env-subnet-1" {
  vpc_id     = aws_vpc.dev-env-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone =  "eu-west-3a"
}