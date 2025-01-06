# Specify the provider
provider "aws" {
  region = "us-east-1" # Primary region
}

# Primary S3 bucket
resource "aws_s3_bucket" "primary_bucket" {
  bucket = "primary-disaster-recovery-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "MoveToGlacier"
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    noncurrent_version_transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Secondary S3 bucket in another region for disaster recovery
provider "aws" {
  alias  = "secondary"
  region = "us-west-2" # Disaster recovery region
}

resource "aws_s3_bucket" "secondary_bucket" {
  provider = aws.secondary
  bucket   = "secondary-disaster-recovery-bucket"
  acl      = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# IAM Role for replication
resource "aws_iam_role" "replication_role" {
  name = "s3-replication-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy for replication
resource "aws_iam_policy" "replication_policy" {
  name        = "s3-replication-policy"
  description = "Policy for S3 replication"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Resource": [
        "${aws_s3_bucket.primary_bucket.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": "${aws_s3_bucket.primary_bucket.arn}"
    }
  ]
}
EOF
}

# Attach policy to replication role
resource "aws_iam_role_policy_attachment" "replication_policy_attachment" {
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}

# # S3 bucket replication configuration
# resource "aws_s3_bucket_replication_configuration" "replication" {
#   bucket = aws_s3_bucket.primary_bucket.id

#   role = aws_iam_role.replication_role.arn

#   rules {
#     id     = "ReplicationRule"
#     status = "Enabled"

#     filter {
#       prefix = ""
#     }

#     destination {
#       bucket        = aws_s3_bucket.secondary_bucket.arn
#       storage_class = "STANDARD"
#     }
#   }
# }
