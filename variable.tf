

variable "instance_type" {
 description = "EC2 instance type"
 type        = string
 default     = "t2.micro"
}

variable "key_name" {
 description = "The name of the SSH key pair"
 type        = string
 default     = "ec2-key"
}


variable "region" {
  type        = string
  description = "AWS region"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}