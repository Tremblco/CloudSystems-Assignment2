variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "security_group_id" {
}

resource "aws_instance" "webserver" {
  count           = 4
  ami             = "ami-0f403e3180720dd7e"
  instance_type   = "t2.micro"
  key_name        = "codykey"
  security_groups = [var.security_group_id]
  subnet_id       = element(var.public_subnet_ids, count.index)
  user_data       = file("EC2/Userdata.sh")
}

output "instances" {
  value = aws_instance.webserver[*].id
}