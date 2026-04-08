variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type_web" {
  description = "Instance type for web and bastion servers"
  type        = string
  default     = "t3.micro"
}

variable "instance_type_db" {
  description = "Instance type for database server"
  type        = string
  default     = "t3.small"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your current public IP address in CIDR format e.g 102.89.x.x/32"
  type        = string
}