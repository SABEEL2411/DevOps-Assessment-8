provider "aws" {
  region = var.region
}

# --- Security Group ---
resource "aws_security_group" "app_sg" {
  name        = "flask-express-sg-v2"   # 👈 change name
  description = "Allow SSH, Flask, and Express"
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

# --- Flask Backend Instance ---
resource "aws_instance" "flask_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.name]
  user_data     = file("user_data_flask.sh")

  tags = {
    Name = "Flask-Backend"
  }
}

# --- Express Frontend Instance ---
resource "aws_instance" "express_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.name]
  user_data     = file("user_data_express.sh")

  tags = {
    Name = "Express-Frontend"
  }
}

# --- Outputs ---
output "flask_public_ip" {
  value = aws_instance.flask_server.public_ip
}

output "express_public_ip" {
  value = aws_instance.express_server.public_ip
}

