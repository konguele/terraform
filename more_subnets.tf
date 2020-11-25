#Añadimos la región

provider "aws" {
    region = "us-east-2"
}

#resource "aws_instance" "test" {
#    ami = "ami-0520e698dd500b1d1"
#    instance_type = "t2.micro"
#}

#Creamos el VPC

resource "aws_vpc" "main1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "Main VPC 1"
    }
    
}

#Creamos la subnet 1

resource "aws_subnet" "subnet1" {
    vpc_id = "${aws_vpc.main1.id}"
    cidr_block = "10.0.10.0/24"
    map_public_ip_on_launch = true
    aavailability_zone = "us-east-2a"

    tags = {
        Name = "Subnet 1 en us-east-2a"
    }  
}

#Creamos la subnet 2

resource "aws_subnet" "subnet2" {
    vpc_id = "${aws_vpc.main1.id}"
    cidr_block = "10.0.20.0/24"
    map_public_ip_on_launch = true
    aavailability_zone = "us-east-2a"

    tags = {
        Name = "Subnet 2 en us-east-2b"
    }  
}

#Creamos la subnet 3

resource "aws_subnet" "subnet3" {
    vpc_id = "${aws_vpc.main1.id}"
    cidr_block = "10.0.30.0/24"
    map_public_ip_on_launch = true
    aavailability_zone = "us-east-2a"

    tags = {
        Name = "Subnet 3 en us-east-2c"
    }  
}

#Creamos el gateway

resource "aws_internet_gateway" "gw1" {
    vpc_id = "${aws_vpc.main1.id}"

    tags = {
      "Name" = "Gateway Main"
    }
  
}

#Creamos la route table

resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.main1.id}"
    route = {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
    }
  
}

#Asociar el gateway subnet1

resource "aws_route_table_association" "table_subnet1" {
    subnet_id = "aws_subnet.subnet1.id"
    route_table_id = "aws_route_table.r.id"
  
}

#Asociar el gateway subnet2

resource "aws_route_table_association" "table_subnet2" {
    subnet_id = "aws_subnet.subnet2.id"
    route_table_id = "aws_route_table.r.id"
  
}

#Asociar el gateway subnet3

resource "aws_route_table_association" "table_subnet3" {
    subnet_id = "aws_subnet.subnet3.id"
    route_table_id = "aws_route_table.r.id"
  
}