resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "${var.env}_vpc"
  }
}
resource "aws_subnet" "pub-sub-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr-pub-2
  map_public_ip_on_launch = true //it makes it public subnet
  availability_zone       = var.az-1
  tags = {
    "Name" = "${var.env}-public-subnet-1"
  }
}
resource "aws_subnet" "pub-sub-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr-pub-2
  map_public_ip_on_launch = true
  availability_zone       = var.az-2
  tags = {
    "Name" = "${var.env}-public-subnet-2"
  }
}
resource "aws_subnet" "pub-sub-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr-pub-3
  map_public_ip_on_launch = true
  availability_zone       = var.az-3
  tags = {
    "Name" = "${var.env}-public-subnet-3"
  }
}
resource "aws_subnet" "priv-sub-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr-priv-1
  availability_zone = var.az-1
  tags = {
    "Name" = "${var.env}-private-subnet-1"
  }
}
resource "aws_subnet" "priv-sub-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr-priv-2
  availability_zone = var.az-2
  tags = {
    "Name" = "${var.env}-private-subnet-1"
  }
}
resource "aws_subnet" "priv-sub-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr-priv-3
  availability_zone = var.az-3
  tags = {
    "Name" = "${var.env}-private-subnet-3"
  }
}
