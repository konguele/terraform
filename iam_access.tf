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

resource "aws_iam_group_membership" "admin-users" {
    name = "admin-users"
    users = [ 
        "${aws_iam_user.Admin1.name}",
        "${aws_iam_user.Admin2.name}"
     ]
    group = "${aws_iam_group.administrators.name}"  
}