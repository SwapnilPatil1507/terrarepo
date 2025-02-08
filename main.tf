terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}
provider "aws" {
  region     = var.region
  access_key = var.access
  secret_key = var.secret
}
resource "aws_instance" "myec2" {

  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = "terrakey"
  tags = {
    Name = "myinstance"
  }
  depends_on = [aws_key_pair.tf-key-pair]
  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.public_ip} > ip.txt"
  }
  variable "region" {
    type = string
    default = "ap-south-1"
  }
  variable "access" { 
}
  variable "secret" { 
}
  variable "ami" {
    type = string
    default = "ami-00bb6a80f01f03502"
}
