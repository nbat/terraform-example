variable "region" {
  description = "Region"
  type        = string
}

variable "namespace" {
  description = "company"
  type        = string
}

variable "repo_name" {
  type        = string
  description = "The name of this repository. git remote get-url --push origin | awk -F'/' '{print $2}' | awk -F'.' '{print $1}'"
}