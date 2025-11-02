variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Name of your existing EC2 key pair"
  default     = "ec2pair"   # ✅ your actual key name
}

