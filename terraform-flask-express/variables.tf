variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  # Amazon Linux 2 AMI (Mumbai region)
  default = "ami-087d1c9a513324697"
}

variable "instance_type" {
  # Use t3.micro for Free Tier
  default = "t3.micro"
}

variable "key_name" {
  description = "Your existing EC2 key pair name"
  default     = "ec2pair" # Change if your key pair name is different
}

