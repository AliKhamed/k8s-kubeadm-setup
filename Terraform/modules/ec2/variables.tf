variable "instance_name" {
  type    = string
}

variable "ami_id" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "key_name" {
  type    = string
}

variable "instance_count" {
  type    = number
}

variable "subnet_ids" {
  type    = list(string)
}
variable "sg_id" {
  type = string
}

