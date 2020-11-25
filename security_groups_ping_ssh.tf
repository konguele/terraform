resource "aws_security_group" "sg-1" {
    name = "sg_ping_ssh"
    vpc_id = "${aws_vpc.main1.id}"
    description = "Permitir ping y ssh"

#Acceso hacia adentro

    #Habilitar el puerto ssh
    ingress =  {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

    #habilitar icmp
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

#Acceso hacia afuera

    egress = {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
      
    }
    tags = {
        Name = "Ping y SSH"
    }
  
}