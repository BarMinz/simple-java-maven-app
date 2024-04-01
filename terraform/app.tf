resource "aws_instance" "github_app" {
  instance_type          = "t3.micro"
  ami                    = "ami-010b74bc1a8b29122"
  vpc_security_group_ids = ["${aws_security_group.github_sg.id}"]
  key_name               = "github_app"
  availability_zone      = "eu-north-1b"
  private_ip             = "172.31.38.197"
  tags                   = {
	Name                 = "github_app"
  }
  user_data              = "${file("script.sh")}"
}