terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  # Configuration options
region = "ap-south-1"
}
resource "aws_instance" "demoec2" {
ami = "ami-0fdea1353c525c182"
instance_type = "t2.micro"
key_name = "amitkey"
vpc_security_group_ids = [aws_security_group.tomcatserversg.id]
tags = {
  "Name" = "tomcatservers"
}

}
resource "aws_security_group" "tomcatserversg" {
  name = "tomcatserversg"
  description = "Allow ssh http tomcat traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ssh port"
  }
    ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow http port"
  }
    ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow tomcat port"
  }
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ssh port"
  }
}

