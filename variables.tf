variable "region" {
  description = "Region"
  type        = string
}

variable "namespace" {
  description = "company"
  type        = string
}

variable "environment" {
  description = "Service environment."
  type        = string
}

variable "platform" {
  description = "Service platform."
  type        = string
}

variable "service" {
  description = "Service name."
  type        = string
  default     = ""
}

variable "aws_account" {
  description = "Aws account id"
  type        = string
}

variable "aws_profile" {
  description = "Aws profile name"
  type        = string
}

variable "repo_name" {
  type        = string
  description = "The name of this repository. git remote get-url --push origin | awk -F'/' '{print $2}' | awk -F'.' '{print $1}'"
}

variable "vpc_id" {
  type = string
  description = "Main Vpc Id"
}

variable "public_subnets_ids" {
  type = list(string)
  description = "Ids of the public subnets"
}

variable "private_subnets_ids" {
  type = list(string)
  description = "Ids of the private subnets"
}
