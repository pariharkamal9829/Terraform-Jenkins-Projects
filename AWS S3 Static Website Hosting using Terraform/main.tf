provider "aws" {
  region  = "us-east-1"
}
resource "aws_s3_bucket" "bucket1" {
  bucket = "web-bucket-kamlesh"
}

