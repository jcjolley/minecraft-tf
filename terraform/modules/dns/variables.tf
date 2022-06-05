variable "ip" {
  type        = string
  description = "The ip to bind the dns entry to"
}

variable "suffix" {
  type        = string
  description = "the suffix you're appending to everything"
}

variable "domain" {
  type        = string
  description = "the domain you want to use"

  validation {
    condition     = can(regex("\\.$", var.domain))
    error_message = "The domain must end with a period."
  }
}

variable "billing_group" {
  type        = string
  description = "The label you want to use to group costs for this server"
}
