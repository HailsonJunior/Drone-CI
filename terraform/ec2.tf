data "aws_ami" "ubuntu" {
    name = "ubuntu"
    most_recent = true

 #   filter {
 #       name = "name"
 #       values = ["IaaSWeek-${var.hash_commit}"] 
 #   } 

    owners = [ "986332348173" ]
}

resource "aws_instance" "web" {
    ami = "data.aws_ami.ubuntu.id"
    instance_type = "t2.micro"
    subnet_id = "subnet-3a5ad31b"
    vpc_security_group_ids = [ "${aws_security_group.allow_http.id}" ]

    tags = {
      "Name" = "HelloWorld"
    }
}

output "ip_address" {
    value = "${aws_instance.web.public_ip}"  
}