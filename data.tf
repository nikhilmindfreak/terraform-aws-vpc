
## data resource used to fetch data from the resource here we uneed aws region zones

data "aws_availability_zones" "available" {
    state = "available"
}