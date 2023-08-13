resource "aws_eip" "nn-eip-public" {
  instance = aws_instance.nn-ec2-public-01.id
  domain   = "vpc"
}

resource "aws_instance" "nn-ec2-public-01" {
  ami           = var.ami
  instance_type = "t3.medium"
  key_name      = var.key_name
  user_data     = file("init.sh")
  subnet_id     = aws_subnet.nn-vpc-01-subnet-public-01.id
  security_groups = [aws_security_group.nn-sg-public.id]

  tags = {
    Name = "nn-ec2-public-01"
  }

  root_block_device {
    volume_size = 32
  }
}

resource "aws_instance" "nn-ec2-private-01" {
  ami           = var.ami
  instance_type = "t3.medium"
  key_name      = var.key_name
  user_data     = file("init.sh")
  subnet_id     = aws_subnet.nn-vpc-01-subnet-private-01.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-01"
  }

  root_block_device {
    volume_size = 32
  }
}

resource "aws_instance" "nn-ec2-private-02" {
  ami           = var.ami
  instance_type = "t2.medium"
  key_name      = var.key_name
  user_data     = file("init.sh")
  subnet_id     = aws_subnet.nn-vpc-01-subnet-private-01.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-02"
  }

  root_block_device {
    volume_size = 32
  }
}

resource "aws_instance" "nn-ec2-private-03" {
  ami           = var.ami
  instance_type = "t2.medium"
  key_name      = var.key_name
  user_data     = file("init.sh")
  subnet_id     = aws_subnet.nn-vpc-01-subnet-private-02.id
  security_groups = [aws_security_group.nn-sg-private.id]

  tags = {
    Name = "nn-ec2-private-03"
  }

  root_block_device {
    volume_size = 32
  }
}
