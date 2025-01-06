# Disaster Recovery Solution: S3 Bucket Replication with Glacier  

This project demonstrates how to create a robust disaster recovery solution by automating S3 bucket replication between AWS regions and enabling lifecycle rules to transition data to Glacier for cost-effective long-term storage.

---

## Overview  

### **Goal**:  
- Implement a backup and disaster recovery strategy using Amazon S3 and Glacier.  

### **AWS Services**:  
- Amazon S3  
- Amazon S3 Glacier  

### **Terraform Concepts**:  
- Automate the creation of S3 buckets with versioning and lifecycle policies.  
- Configure cross-region replication rules using IAM roles and policies.  

### **Outcome**:  
- A cost-effective and secure disaster recovery solution with primary and secondary S3 buckets, automatic data replication, and transition to Glacier for long-term storage.  

---

## Architecture  

1. **Primary Bucket**: Located in the primary AWS region (`us-east-1`), it serves as the main storage bucket with versioning enabled.  
2. **Secondary Bucket**: Located in the secondary AWS region (`us-west-2`), it serves as a backup bucket for disaster recovery.  
3. **Lifecycle Rules**: Automatically transition objects in the primary bucket to Glacier after 30 days.  
4. **Replication Setup**: Ensures all objects are replicated to the secondary bucket with appropriate IAM roles and policies.  

---

## Prerequisites  

- Terraform installed on your local machine.  
- AWS CLI configured with proper credentials.  
- IAM user with permissions to create S3 buckets, IAM roles, and policies.  

---

## Steps to Deploy  

1. **Clone the Repository**  
   ```bash
   git clone <repository-url>
   cd disaster-recovery-solution
   ```  

2. **Initialize Terraform**  
   ```bash
   terraform init
   ```  

3. **Review and Apply Configuration**  
   ```bash
   terraform apply
   ```  
   Confirm the plan by typing `yes` when prompted.  

4. **Verify Resources**  
   - Log in to the AWS Management Console.  
   - Navigate to the S3 service and verify the creation of primary and secondary buckets.  
   - Check lifecycle rules and replication configuration.  

---

## File Structure  

```
.
├── main.tf       # Core Terraform script for infrastructure setup
├── variables.tf  # Variable definitions for Terraform
├── outputs.tf    # Outputs to display resource information after deployment
└── README.md     # Project documentation
```

---

## Key Features  

- **Versioning**: Ensures that all versions of an object are preserved in both primary and secondary buckets.  
- **Lifecycle Rules**: Automatically transitions data to Glacier for cost-effective long-term storage.  
- **Cross-Region Replication**: Provides disaster recovery by replicating objects to a secondary region.  

---

## Clean-Up  

To avoid unnecessary charges, destroy the infrastructure when no longer needed:  
```bash
terraform destroy
```  
Confirm the action by typing `yes` when prompted.  

---

## Resources  

- [Amazon S3 Documentation](https://docs.aws.amazon.com/s3/index.html)  
- [Terraform S3 Bucket Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)  
- [Terraform S3 Replication Configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration)  

Happy Automating!
