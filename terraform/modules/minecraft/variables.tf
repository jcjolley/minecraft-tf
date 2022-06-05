variable "suffix" {
  type        = string
  description = "The suffix to append to every resource created by this module"
}

variable "domain" {
  type        = string
  description = "The domain name to make for this server"
}

variable "zone" {
  type        = string
  description = "the GCP zone to create resources in"
}

variable "project_id" {
  type        = string
  description = "the project id"
}

variable "billing_group" {
  type        = string
  description = "The label you want to use to group costs for this server"
}

variable "compute_instance_machine_type" {
  type = string
  description = "The compute instance machine type to use"
  default = "c2-standard-8"
}
