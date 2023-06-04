resource "aws_instance" "ec2-server" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.vpc_security_group_id]

  tags = {
    Name    = var.name
    Owner   = "Nazar"
    Project = "Study"
  }
}

module "elastic_ip" {
  source          = "../elastic_ip"
  ec2_instance_id = aws_instance.ec2-server.id
}

module "volume" {
  source            = "../volume"
  availability_zone = aws_instance.ec2-server.availability_zone
  size              = var.volume_size
}

module "volume_attachment" {
  source          = "../volume_attachment"
  ec2_instance_id = aws_instance.ec2-server.id
  volume_id       = module.volume.volume_id
}

