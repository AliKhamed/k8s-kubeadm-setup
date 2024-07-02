variable "inbound_from_port" {
  type    = list(string)
}

variable "inbound_to_port" {
  type    = list(string)
}

variable "inbound_protocol" {
  type    = list(string)
}

variable "inbound_cidr" {
  type    = list(string)
}

variable "outbound_from_port" {
  type    = list(string)
}

variable "outbound_to_port" {
  type    = list(string)
}

variable "outbound_protocol" {
  type    = list(string)
}

variable "outbound_cidr" {
  type    = list(string)
}

variable "vpc_id" {
  type = string
}