#Le damos la public key directamente
resource "aws_key_pair" "key-test1" {
key_name = "test_1"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHGG23ufFPN5QSy44uw7vhF3YKVkGtirwXaFZuN7rwdBs9UAoMdpNBLuscOrfrbIIBNsH+9GAjpAqRnoV8mivoz7nhHRBBMVkFnMseSmD3Vr5lQrL0514iN0uhJ/UipEK7T1OlaJo5AE+Jo5D7Aj7tOBzyO7qE/KpPsDVdIfKh+ltZH0JYKapmljVVxoasZOyOTq7rDZqDJV7+jAbqJUGRJjP5w/bDWGQAEQBKS3KrxXhyoRrhHx6t9YdPs+KzLvdYeu+XuqUr+e/iSOgoVT+En1xPHoZA2kXYYWrntcQyQU8f27PKND69Csindlds8eZMIx8mRP4IH9Y8jeshT78lePtMaBUj78r1dJ+/ng9QqGxF/Jfk8ZmJCBqsS1VBjOKC8+nz9NJ5rmy1lWGqCFpLBq+y2bZTt86TOGkkIBOixEGwnammO95KgKysP8SknEZ/51t8+iQzo6EPx+iusLU+ij/dJWG6roXMZD9BF2LAcHTRJn+fhrRGwU5CS/k9aXGvI1kegSS10Jiy7iEWvxAl2TsJ6h5MvSxrVIrw+pp2EJqExC3wshfG3wNmIy501uaNqx0o7CfeQZak+u6UFfj9+eyXribfjNm67tZZw75kPh5gs6D6Vc3o3uaNARiXloHA3iWMoOa/BG1WDeWKJtEdCeOpIkl0tzIhfxff5LWjWQ=="
  
}

#Hacemos que lea el fichero de la clave pública
resource "aws_key_pair" "key-test2" {
    key_name = "test_2"
    public_key = "${file("test_key.pem.pub")}"
  
}