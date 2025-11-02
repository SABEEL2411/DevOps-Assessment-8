provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "app_sg" {
  name        = "flask-express-sg"
  description = "Allow SSH, Flask (5000), and Express (3000) traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = "ami-087d1c9a513324697"   # ✅ Amazon Linux 2 (ap-south-1)
  instance_type           = var.instance_type
  key_name                = var.key_name
  user_data               = file("user_data.sh")
  vpc_security_group_ids  = [aws_security_group.app_sg.id]

  tags = {
    Name = "flask-express-single"
  }
}

