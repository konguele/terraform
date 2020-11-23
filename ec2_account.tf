provider "aws" {
    region = "us-east-2"
    access_key = "value"
    secret_key = "value"
}

#resource "aws_instance" "test" {
#    ami = "ami-0520e698dd500b1d1"
#    instance_type = "t2.micro"
#}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    
}