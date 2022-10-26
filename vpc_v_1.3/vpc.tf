resource "aws_vpc" "main" {
  cidr_block = var.env == "dev" ? var.vpc_cidr_dev : var.vpc_cidr_qa
  tags       = merge(local.common_tags, { Name = replace(local.name, "rtype", "vpc") })
}
resource "aws_subnet" "pub_sub" {
  count                   = length(var.env == "dev" ? var.cidr_pubs_dev : var.cidr_pubs_qa)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.env == "dev" ? var.cidr_pubs_dev : var.cidr_pubs_qa, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs_east, count.index)
  tags = {
    "Name" = "${var.env}-public-subnet-${count.index}"
  }
}
resource "aws_subnet" "priv_sub" {
  count             = length(var.env == "dev" ? var.cidr_privs_dev : var.cidr_privs_qa)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.env == "dev" ? var.cidr_privs_dev : var.cidr_privs_qa, count.index)
  availability_zone = element(var.azs_east, count.index)
  tags = {
    "Name" = "${var.env}-private-subnet-${count.index}"
  }
}
