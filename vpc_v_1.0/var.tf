variable "env" {
  type        = string
  description = "This is var for Environment"
  default     = "dev"
}

variable "i_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "pubkey" {
  type        = string
  description = "for public key"
}

variable "public_ip" {
  type        = string
  description = "public ip of terraform session instance"
}
variable "cidr-pub-1" {
  type        = string
  description = "cidr for public subnet 1"
  default     = "10.0.1.0/24"
}
variable "cidr-pub-2" {
  type        = string
  description = "cidr for public subnet 2"
  default     = "10.0.2.0/24"
}
variable "cidr-pub-3" {
  type        = string
  description = "cidr for public subnet 3"
  default     = "10.0.3.0/24"

}
variable "cidr-priv-1" {
  type        = string
  description = "cidr for private subnet 1"
  default     = "10.0.11.0/24"
}
variable "cidr-priv-2" {
  type        = string
  description = "cidr for private subnet 2"
  default     = "10.0.12.0/24"
}
variable "cidr-priv-3" {
  type        = string
  description = "cidr for private subnet 3"
  default     = "10.0.13.0/24"
}
variable "az-1" {
  type    = string
  default = "us-east-1a"
}
variable "az-2" {
  type    = string
  default = "us-east-1b"
}
variable "az-3" {
  type    = string
  default = "us-east-1c"

}
