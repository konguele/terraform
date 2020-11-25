resource "aws_security_group" "sg-2" {
    name = "sg_http"
    vpc_id = "${aws_vpc.main1.id}"
    description = "Permitir http"

#Acceso hacia adentro

    #Habilitar el puerto 80
    ingress =  {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

    #habilitar 443
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
      
    tags = {
        Name = "HTTP"
    }
  
}