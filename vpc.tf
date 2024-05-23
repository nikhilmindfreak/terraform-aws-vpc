resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = var.enable_dns_hostnames

    tags = merge(    # we use merge function 
        var.common_tags,
        var.vpc_tags,
        {
            Name = local.resource_name    # we used local here 
        }
    )
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.common_tags,
        var.aws_internet_gateway_tags,
        {
            Name = local.resource_name    # we used local here 
        }
    )
    }
  
## public subnet
resource "aws_subnet" "database" {   # first name is public[0], second name is public[1]
  count = length(var.database_subnet_cidrs)
  availability_zone = local.az_names[count.index]     # it will loop first 0 then 1
  map_public_ip_on_launch = true                # default is false, we give true as it is public
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]  #here we take input form the user and works
 tags = merge(
        var.common_tags,
        var.database_subnet_cidr_tags,
        {
            Name = "${local.resource_name}-public-${local.az_names[count.index]}"    # we used local here    # this is intercolation, varibles and text together
        }
    )
}



## public subnet
resource "aws_subnet" "public" {   # first name is public[0], second name is public[1]
  count = length(var.public_subnet_cidrs)
  availability_zone = local.az_names[count.index]     # it will loop first 0 then 1
  map_public_ip_on_launch = true                # default is false, we give true as it is public
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]  #here we take input form the user and works
 tags = merge(
        var.common_tags,
        var.public_subnet_cidr_tags,
        {
            Name = "${local.resource_name}-public-${local.az_names[count.index]}"    # we used local here    # this is intercolation, varibles and text together
        }
    )
}

## private subnet
resource "aws_subnet" "private" { # first name is public[0], second name is public[1]
  count = length(var.private_subnet_cidrs)
  availability_zone = local.az_names[count.index]     # it will loop first 0 then 1
#   map_public_ip_on_launch = false                # default is false for private so we toggle for ref
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]  #here we take input form the user and works
 tags = merge(
        var.common_tags,
        var.private_subnet_cidr_tags,
        {
            Name = "${local.resource_name}-private-${local.az_names[count.index]}"    # we used local here 
        }
    )
}
