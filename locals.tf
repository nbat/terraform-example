locals {
  tags = {
    Namespace   = var.namespace
    Platform    = var.platform
    Service     = var.service
    Environment = var.environment
    TERRAFORM   = true
  }
}
