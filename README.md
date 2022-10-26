# terraform_vpc

**This repository contains VPC template where each VPC provisions the resources for networking such as:**
- VPC
- public and private subnets
- route tables and routes
- internet
- NAT gateway

**Plus bonus:**

EC2 instance within VPC


### With `vpc_v_1.2` we meet *count and element*
The `count` meta-argument accepts a whole number, and creates that many instances of the resource or module. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

`Element` is one of the Terraform Functions. Element retrieves a single element from a list.
Syntax: 
**element(list, index)**

```
resource "aws_subnet" "pub_sub" {
  count                   = length(var.cidr_pubs)
  cidr_block              = element(var.cidr_pubs, count.index)
  availability_zone       = element(var.azs, count.index)
```

### With `vpc_v_1.3` we meet *locals and conditions*
Using `locals` simplifies your Terraform configuration – since you can reference the local multiple times, you reduce duplication in your code. Locals can also help you write more readable configuration by using meaningful names rather than hard-coding values.

The syntax of a `conditional expression` first defines the condition, then the outcomes for true and false evaluations. In our case we want to define different CIDR blocks for different environments:
```
  cidr_block = var.env == "dev" ? var.vpc_cidr_dev : var.vpc_cidr_qa
```
