resource "aws_security_group" "sg_instance" {
  name        = "${var.env}-instance-sg"
  description = "SG for my main instance"
  vpc_id      = aws_vpc.main.id
}
resource "aws_security_group_rule" "ingress" {
  count             = length(var.ingress_ports)
  type              = "ingress"
  from_port         = element(var.ingress_ports, count.index)
  to_port           = element(var.ingress_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = [element(var.ingress_cidrs, count.index)]
  security_group_id = aws_security_group.sg_instance.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" //all protocols all ports
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}
