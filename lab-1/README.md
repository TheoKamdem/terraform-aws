# Documentation Terraform - Provisioning an AWS Infrastructure
# If you're getting started with AWS, use a free tier account for 12 months of limited access to services like EC2, S3, and RDS, but check usage limits to avoid charges.

This documentation explains what the provided Terraform code does and outlines the steps to provision AWS resources. The code creates a **Virtual Private Cloud (VPC)** and a **subnet** in the `eu-west-3` AWS region (Paris).

## Steps to Provision Resources

### 1. Install Terraform
Before you begin, ensure Terraform is installed on your machine. If not, download and install Terraform from the official site: [terraform.io](https://www.terraform.io/downloads.html).

### 2. Create the Terraform Configuration File
Create a file named `main.tf` and paste the following code into it:

```hcl
# AWS Provider Configuration
provider "aws" {
  region     = "eu-west-3"
  access_key = "XXX"      # Replace with your AWS access key, corresponding to an IAM user with Admin role
  secret_key = "XXXXX"     # Replace with your AWS secret key  corresponding to an IAM user with Admin role
}

# Create a VPC
resource "aws_vpc" "dev-env-vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a Subnet in the VPC
resource "aws_subnet" "dev-env-subnet-1" {
  vpc_id             = aws_vpc.dev-env-vpc.id
  cidr_block         = "10.0.10.0/24"
  availability_zone  = "eu-west-3a"
}
 ```


### 3. Initialize Terraform
Initializes the necessary plugins for communication with the providers and sets up the backend:
```hcl
terraform init
 ```

### 4. Plan the Execution 
#### Shows the execution plan and the changes that will be applied to your infrastructure. Displays the resources that will be added, removed, or modified

``` hcl
 terraform  plan
 ```
### 5.  Apply the Plan to Provision the Resource
 #### Applies the configurations you have declared in your different files, creates, deletes, or modifies the resources in your infrastructure:

 ``` hcl
 terraform apply
  ```
