
variable "image" {
  default = "ami-0e58b083ed4c66b2b"
}

variable "hw" {
  default = "t2.micro"
}

variable "key" {
  default = "Anusha-key"
}

variable "name" {
  default = "dev-server"
}

resource "aws_instance" "s1" {
  ami = var.image
  instance_type = var.hw
  key_name = var.key
  tags = {
     env = lower("Test")
     Name = lower(var.name)
  }
}

output "server-public-ip" {
  value = aws_instance.s1.public_ip
}
