
provider "aws" {
    region = "us-east-2"
}

#resource "aws_instance" "test" {
#    ami = "ami-0520e698dd500b1d1"
#    instance_type = "t2.micro"
#}

resource "aws_vpc" "main1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "Main VPC 1"
    }
    
}

resource "aws_subnet" "subnet1" {
    vpc_id = "${aws_vpc.main1.id}"
    cidr_block = "10.0.10.0/24"
    map_public_ip_on_launch = true
    aavailability_zone = "us-east-2a"

    tags = {
        Name = "Subnet 1 en us-east-2a"
    }  
}