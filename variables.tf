variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone within the region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "allowed_ip" {
  description = "Public IP allowed to SSH into the instance"
  type        = string
}
