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
    Name = "insatnce1"
  }
}
