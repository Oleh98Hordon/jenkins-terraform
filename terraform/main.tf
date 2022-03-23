module "ec2" {
  ami                    = data.aws_ami.ubuntu.image_id
  source                 = "git::https://gitlab.com/norrinradd212/terraform-modules.git//ec2"
  vpc_id                 = aws_vpc.my_VPC.id
  key_name               = var.key_name
  subnetCIDRblock        = var.subnetCIDRblock
  vpc_security_group_ids = [aws_security_group.my_SG_terr.id]
  user_data              = file("user_data.sh")
  projectName            = var.projectName
}

