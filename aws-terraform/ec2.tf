resource "aws_eip" "nn-eip-public" {
  instance = aws_instance.nn-ec2-public-01.id
  domain   = "vpc"
}

resource "aws_instance" "nn-ec2-public-01" {
  ami                         = var.ami
  instance_type               = "t3.medium"
  key_name                    = var.key_name
  user_data                   = file("./init.sh")
  subnet_id                   = aws_subnet.nn-vpc-01-subnet-public-01.id
  security_groups             = [aws_security_group.nn-sg-public.id]
  associate_public_ip_address = true

  tags = {
    Name = "nn-ec2-public-01"
  }

  root_block_device {
    volume_size = 32
  }

  provisioner "file" {
    source      = "./nn.pem"
    destination = "/home/ec2-user/.ssh/id_rsa"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./nn.pem")
      host        = self.public_ip
    }
  }
}

module "nn_private_instance_01" {
  ami             = var.ami
  source          = "./ec2_instance_module"
  key_name        = var.key_name
  instance_type   = "t3.medium"
  subnet_id       = aws_subnet.nn-vpc-01-subnet-private-01.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-01"
  }
}

module "nn_private_instance_02" {
  ami             = var.ami
  source          = "./ec2_instance_module"
  key_name        = var.key_name
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.nn-vpc-01-subnet-private-01.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-02"
  }
}

module "nn_private_instance_03" {
  ami             = var.ami
  source          = "./ec2_instance_module"
  key_name        = var.key_name
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.nn-vpc-01-subnet-private-02.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-03"
  }
}
