provider "aws" {
	region = ""
	access_key = ""
	secret_key = ""
}

resource "aws_vpc" "dev_vpc" {
	tags = {
		Name: "${var.env}-vpc"
	}
	cidr_block = var.vpc_cidr
}

module "dev-subnet" {
	source = "./modules/subnet"
	env = var.env
	zone = var.zone
	vpc_id = aws_vpc.dev_vpc.id
	subnet_cidr = var.subnet_cidr
	default_route_table_id = aws_vpc.dev_vpc.default_route_table_id
}

module "dev-instance" {
	source = "./modules/server"
	vpc_id = aws_vpc.dev_vpc.id
	env = var.env
	zone = var.zone
	personal_ip = var.personal_ip
	instance = var.instance
	subnet_id = module.dev-subnet.dev_subnet_output.id
	public_key = var.public_key
}