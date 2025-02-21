variable "instance_type" {
  description = "value for Instance Type"
  default = "t2.micro"
}

variable "ami_id" {
  description = "value for ami id"
}

variable "key_name" {
  description = "value for the key name"
}

variable "sg-name" {
  description = "name of security group"
}

variable "vpc-cidr" {
  description = "value of cidr"
  default = "10.0.0.0/16"
}

variable "subnet_az" {
  description = "value for the availability zone of subnet"
}

variable "region" {
  default = "us-east-1"
}