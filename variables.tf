

### project variable, tags##
variable "project_name" {
    type = string
}

variable "environment" {    #tagging for user for easy access and readability
    type = string
    default = "dev"     # we gave default value we will be using only dev here in project
}

variable "common_tags" {
    type = map
  
}


### vpc varible
variable vpc_cidr {
     type = string
     default = "10.0.0.0/16"   # cidr , ip range
}

variable "enable_dns_hostnames" {     # dns hostn name has be true
    type = bool
    default = true
}

variable "vpc_tags" {    # vpc tags can be optional
  type = map
  default = {}
}

### IGW

variable "aws_internet_gateway_tags" {
    type = map
    default = {}     # we give empty deafult , user has to provide
}

## public subnet

variable "public_subnet_cidrs" {    # cidrs beacuse its plural , we have 2 subnets
    type = list
    validation {        ## here we gave validation and condition for the user to give only 2 cidrs
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "please provide 2 valid public subnet CIDR"
    }                        
  
}

variable "public_subnet_cidr_tags" {
    type = map
    default = {} 
}