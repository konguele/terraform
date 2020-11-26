#Creamos el grupo de IAM
resource "aws_iam_group" "administrators" {
    name = "Admins"     
}

#Definimos la politica
resource "aws_iam_policy_attachment" "admin-attach" {
    name = "admins-attach"
    groups = [ "${aws_iam_group.administrators.name}" ]
    
    #Para sacar la politica es mejor hacerlo desde AWS para conseguir el Policy ARN
    policy_arn = "arn:aws:iam::aws:policy/job-functions/SystemAdministrator"  
}


#Creamos los usuarios necesarios
resource "aws_iam_user" "Admin1" {
    name = "admin1"
  
}

resource "aws_iam_user" "Admin2" {
    name = "admin2"
  
}

#Añadimos al grupo administradores
resource "aws_iam_group_membership" "admin-users" {
    name = "admin-users"
    users = [ "${aws_iam_user.Admin1.name}", "${aws_iam_user.Admin2.name}" ]
    group = "${aws_iam_group.administrators.name}"  
}

#Creamos las access key
resource "aws_iam_access_key" "admin1-access" {
    user = "${aws_iam_user.Admin1.name}"  
}

resource "aws_iam_access_key" "admin2-access" {
    user = "${aws_iam_user.Admin2.name}"  
}

#Mostramos la access y la secret key
output "admin1_access_key" {
    value = "${aws_iam_access_key.admin1-access.id}"    
}

output "admin1_secret_key" {
    value = "${aws_iam_access_key.admin1-access.secret}"
}

output "admin2_access_key" {
    value = "${aws_iam_access_key.admin2-access.id}"    
}

#Si añadimos encrypted no te muestra la secret key
output "admin2_secret_key" {
    value = "${aws_iam_access_key.admin2-access.encrypted_secret}"
}