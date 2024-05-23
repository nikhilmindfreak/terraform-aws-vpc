

variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "public_subnet_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_subnet_cidrs" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
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

# ## public subnet

# variable "public_subnet_cidrs" {    # cidrs beacuse its plural , we have 2 subnets
#     type = list
#     validation {        ## here we gave validation and condition for the user to give only 2 cidrs
#       condition = length(var.public_subnet_cidrs) == 2
#       error_message = "please provide 2 valid public subnet CIDR"
#     }                        
  
# }

variable "public_subnet_cidr_tags" {
    type = map
    default = {} 
}


# ## private subnet

# variable "private_subnet_cidrs" {    # cidrs beacuse its plural , we have 2 subnets
#     type = list
#     validation {        ## here we gave validation and condition for the user to give only 2 cidrs
#       condition = length(var.private_subnet_cidrs) == 2
#       error_message = "please provide 2 valid private subnet CIDR"
#     }                        
  
# }


variable "private_subnet_cidr_tags" {
    type = map
    default = {} 
}




# ## data base subnet

# variable "database_subnet_cidrs" {    # cidrs beacuse its plural , we have 2 subnets
#     type = list
#     validation {        ## here we gave validation and condition for the user to give only 2 cidrs
#       condition = length(var.database_subnet_cidrs) == 2
#       error_message = "please provide 2 valid database subnet CIDR"
#     }                        
  
# }

variable "database_subnet_cidr_tags" {
    type = map
    default = {} 
}

