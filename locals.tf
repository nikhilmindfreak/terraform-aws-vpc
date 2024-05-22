locals {
  resource_name = "${var.project_name}-${var.environment}"
  az_names = slice(data.aws_availability_zones.available.names, 0, 2)   # as endindex is execulize we gave 0, 2 so onlu 0 and 1 will be taken
}