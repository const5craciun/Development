provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "terraform-test-bucket-5555"
}

resource "aws_ecr_repository" "app_repo" {
  name = "my-docker-app"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_security_group" "app_sg" {
  name = "docker-app-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  tags = {
    Name = "docker-app-server"
  }
}

resource "aws_iam_user" "developer" {
  name = "developer-user-bogdanel"

  tags = {
    role = "developer"
  }
}
