variable "name" {
  type = string
  default = "Unnamed server"
}
variable "vpc_security_group_id" {
  type    = string
  default = ""
}

variable "image" {
  type    = string
  default = ""
}

variable "volume_size" {
  type    = any
  default = 1
}