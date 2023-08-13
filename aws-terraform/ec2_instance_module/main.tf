resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
  subnet_id     = var.subnet_id
  security_groups = var.security_groups

  tags = var.tags

  root_block_device {
    volume_size = 32
  }
}