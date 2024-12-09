variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  default = ""
}


variable "vpc_cidr_block" {
  type = string
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "vpc_name" {
  type = string
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}
