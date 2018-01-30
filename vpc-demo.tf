provider "aws" {
  region     = "${var.region}"
}

# Create VPC
resource "aws_vpc" "javahome_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenency}"
  tags {
    Name = "vpc-by-terraform"
    Department = "Training"
  }
}
# Create Subnet
resource "aws_subnet" "subnets" {
  count = "${length(var.subnets_cidr)}"
  map_public_ip_on_launch = true
  vpc_id     = "${aws_vpc.javahome_vpc.id}"
  cidr_block = "${element(var.subnets_cidr,count.index)}"
  tags {
    Name = "Subnet"
  }
}
