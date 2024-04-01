resource "aws_security_group" "github_sg" {
  name        = "github_sg"
  description = "Allow SSH for my ip, and http/s to all ips"

  dynamic "ingress" {
    for_each = [22,80,443]
    iterator = port

    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}