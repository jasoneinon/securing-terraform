resource "aws_instance" "Jenkins" {
  ami           = "ami-7c491f05"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.Jenkins.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.Jenkins.id}"
}
