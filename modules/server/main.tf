resource "aws_default_security_group" "dev_sg" {
	tags = {
		Name: "${var.env}-sg"
	}
	vpc_id = var.vpc_id
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

data "aws_ami" "dev_ami" {
	most_recent = true
	owners = ["amazon"]

	filter {
		name = "name"
		values = ["al*"]
	}
}

resource "aws_instance" "dev_instance" {
	ami = data.aws_ami.dev_ami.id
	availability_zone = var.zone
	instance_type = var.instance
	subnet_id = var.subnet_id
	vpc_security_group_ids = [aws_default_security_group.dev_sg.id]
	associate_public_ip_address = true
	key_name = "dev-key-pair"
	tags = {
		Name: "${var.env}-instance"
	}
}
