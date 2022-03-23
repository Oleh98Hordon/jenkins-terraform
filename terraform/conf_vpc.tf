resource "aws_vpc" "my_VPC" {
  cidr_block = var.vpcCIDRblock
  tags = {
    Name = "${var.projectName}_vpc"
  }
}
#-----------------------------------------------------------
resource "aws_internet_gateway" "my_VPC_GW" {
  vpc_id = aws_vpc.my_VPC.id
  tags = {
    Name = "${var.projectName}_GW"
  }
}
#-----------------------------------------------------------
resource "aws_route_table" "my_VPC_route_table" {
  vpc_id = aws_vpc.my_VPC.id
  tags = {
    Name = "${var.projectName}_route_table"
  }
}
#-----------------------------------------------------------
resource "aws_route" "My_VPC_internet_access" {
  route_table_id         = aws_route_table.my_VPC_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.my_VPC_GW.id
}
#-----------------------------------------------------------
resource "aws_route_table_association" "My_VPC_association" {
  subnet_id      = module.ec2.instance_subnet.id
  route_table_id = aws_route_table.my_VPC_route_table.id
}
#-----------------------------------------------------------