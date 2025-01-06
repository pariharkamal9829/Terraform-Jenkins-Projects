# AWS VPC with Public and Private Subnets

This project demonstrates how to create a Virtual Private Cloud (VPC) on AWS with both public and private subnets using Terraform. The setup includes a NAT Gateway for private subnet internet access and routing tables for proper network communication.

---

## Project Overview

### Goal
To create a secure and customizable networking solution by setting up a VPC with the following components:
- Public and Private Subnets
- NAT Gateway
- Routing Tables

### AWS Services Used
- **VPC**
- **Subnets**
- **NAT Gateway**
- **Route Tables**

### Terraform Concepts
- **`aws_vpc`**: To create the VPC.
- **`aws_subnet`**: To create public and private subnets.
- **`aws_route_table`**: To define routing rules.
- Automate subnet and route table associations.

---

## Prerequisites

1. **AWS Account**: Required to provision resources.
2. **Terraform**: Installed on your local system. [Download Terraform](https://www.terraform.io/downloads.html)
3. **AWS CLI**: Installed and configured with credentials.
4. **IAM Role/Access**: Sufficient permissions to manage VPCs, subnets, NAT Gateways, and route tables.

---

## Folder Structure

```
aws-vpc-terraform/
|-- main.tf
|-- variables.tf
|-- outputs.tf
|-- README.md
```

---

## Terraform Script Details

### `main.tf`
The main Terraform file that provisions the VPC, subnets, NAT Gateway, and route tables.

### `variables.tf`
Defines variables for reusable configuration (e.g., region, CIDR blocks).

### `outputs.tf`
Defines outputs to display important information after resource creation.

---

## Steps to Use the Project

### Step 1: Clone or Download the Repository
```bash
git clone <repository-url>
cd aws-vpc-terraform
```

### Step 2: Initialize Terraform
Initialize the Terraform working directory to download provider plugins:
```bash
terraform init
```

### Step 3: Review and Modify Variables
Edit `variables.tf` to customize the region, CIDR blocks, and other settings as needed.

### Step 4: Plan the Deployment
Review the resources that Terraform will create:
```bash
terraform plan
```

### Step 5: Apply the Configuration
Deploy the resources to AWS:
```bash
terraform apply
```
Confirm the execution when prompted.

### Step 6: Verify the Setup
After successful deployment, verify the resources in the AWS Management Console.

### Step 7: Clean Up Resources
To delete all resources created by this project:
```bash
terraform destroy
```

---

## Outputs
- **VPC ID**
- **Public Subnet IDs**
- **Private Subnet IDs**
- **NAT Gateway ID**

---

## Additional Notes

- **Cost Management**: Ensure you monitor AWS costs as resources like NAT Gateways incur ongoing charges.
- **Security**: Implement appropriate security groups and NACLs for additional security.
- **Scalability**: This setup can be extended to include more subnets or integrate with other AWS services.

---

## Resources

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/index.html)
