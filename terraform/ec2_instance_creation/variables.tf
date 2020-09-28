# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on AWS region"
  default = {
    us-east-1 = "us-east-1a"
  }
}

# this is a keyName for key pairs
variable "aws_key_name" {
  description = "Key Pair Name used to provision to the box"
}

variable "inst_ami" {
  description = "Amazon Machine Image for the Instance"
}

variable "inst_type" {
  description = "type of instances to provision"
}

variable "vpc_public_sg_id" {
  description = "VPC public security group"
}

variable "vpc_public_sn_id" {
  description = "VPC public subnet"
}

variable "vpc_region" {
  description = "VPC region"
}

variable "public_ssh_key" {
  description = "Public SSH key value"
}