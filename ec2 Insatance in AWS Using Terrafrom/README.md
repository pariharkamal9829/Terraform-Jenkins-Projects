# Terraform AWS EC2 Instance Project

This project provides a Terraform script to create an AWS EC2 instance in the `us-east-1` region. It leverages Terraform to manage the infrastructure-as-code and uses the AWS CLI for any additional AWS-related setup.

## Prerequisites

Before starting, ensure you have the following installed on your system:

1. **Terraform**: Version `>= 1.2.0`
   - [Download Terraform](https://www.terraform.io/downloads.html)
2. **AWS CLI**: Version `2.x`
   - [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
3. **AWS Account**: An active AWS account.
4. **IAM Credentials**:
   - An AWS access key and secret access key with permissions to manage EC2 resources.

## Steps to Set Up

### 1. Clone or Create the Project Directory

```bash
mkdir terraform-aws-ec2
cd terraform-aws-ec2
```

### 2. Initialize Terraform

Run the following command to initialize Terraform in the project directory:

```bash
terraform init
```

This command downloads the necessary provider plugins and prepares the working directory.

### 3. Configure AWS CLI

Configure AWS CLI with your IAM credentials:

```bash
aws configure
```
You will be prompted to enter:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., `us-east-1`)
- Default output format (e.g., `json`)

### 4. Terraform Script

Use the provided Terraform script in a file named `main.tf`:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"

  tags = {
    Name = "instance1"
  }
}
```

### 5. Apply the Terraform Configuration

To create the EC2 instance, execute the following commands:

1. **Validate the Terraform configuration**:

   ```bash
   terraform validate
   ```

2. **Preview the changes**:

   ```bash
   terraform plan
   ```

3. **Apply the changes**:

   ```bash
   terraform apply
   ```
   - You will be prompted to confirm. Type `yes` to proceed.

### 6. Verify the EC2 Instance

Once the configuration is applied, verify the EC2 instance in the AWS Management Console:

1. Log in to your AWS account.
2. Navigate to the EC2 Dashboard.
3. Check for an instance with the tag `Name: instance1` in the `us-east-1` region.

### 7. Destroy the EC2 Instance (Optional)

To delete the resources created by Terraform, run:

```bash
terraform destroy
```

You will be prompted to confirm. Type `yes` to proceed.

## Additional Commands

- **Format Terraform Configuration**:

  ```bash
  terraform fmt
  ```
  Automatically formats your Terraform files to align with best practices.

- **List Terraform State Resources**:

  ```bash
  terraform state list
  ```
  Displays all resources managed by Terraform.

## Notes

- Ensure that your AWS credentials are properly configured and have the necessary permissions to create EC2 instances.
- The `ami-01816d07b1128cd2d` used in the script is a public AMI. Replace it with an appropriate AMI ID for your project if needed.
- Be cautious about AWS costs when creating resources. Monitor usage and delete resources when no longer needed.

## Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

---

Happy Terraforming!
