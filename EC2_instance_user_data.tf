resource "aws_instance" "server1" {
    ami = "ami-0520e698dd500b1d1"
    instance_type = "t2.micro"
    count = 1
    associate_public_ip_address = true
    subnet_id = "${aws_subnet.subnet1.id}"
    vpc_security_group_ids = [ "${aws_security_group.sg1.id}", "${aws_security_group.sg2.id}" ]
    private_ip = "10.0.10.10"
    key_name = "test1"
    user_data = "${file("userdata.sh")}"

    tags = {
      Name = "Server1"
      Owner = "terraform"
      Env = "dev"
    }

}

resource "aws_instance" "server2" {
    ami = "ami-0520e698dd500b1d1"
    instance_type = "t2.micro"
    count = 1
    associate_public_ip_address = true
    subnet_id = "${aws_subnet.subnet1.id}"
    vpc_security_group_ids = [ "${aws_security_group.sg1.id}", "${aws_security_group.sg2.id}" ]
    private_ip = "10.0.10.11"
    key_name = "${aws_key_pair.test2.id}"

    tags = {
      Name = "Server2"
      Owner = "terraform"
      Env = "dev"
    }

}