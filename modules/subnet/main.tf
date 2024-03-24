resource "aws_subnet" "dev_subnet" {
	tags = {
		Name: "${var.env}-subnet"
	}
	vpc_id = var.vpc_id
	cidr_block = var.subnet_cidr
	availability_zone = var.zone
}

resource "aws_internet_gateway" "dev_igw" {
	tags = {
		Name: "${var.env}-igw"
	}
	vpc_id = var.vpc_id
}

resource "aws_default_route_table" "dev_route_table" {
	tags = {
		Name: "${var.env}-route-table"
	}
	default_route_table_id = var.default_route_table_id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.dev_igw.id
	}
}