resource "aws_vpc" "default_vpc" {
  cidr_block = "${var.vpc_cidr}"
}

#criando somente uma subnet para teste
resource "aws_subnet" "pub_subnet_1a" {
  vpc_id     = "${aws_vpc.default_vpc.id}"
  cidr_block = "${var.pub_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags {
    Name = "Subnet_Pub_1a"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default_vpc.id}"

  tags {
    Name = "Main"
  }
}


resource "aws_route_table" "pub_a" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "PubA"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.pub_subnet_1a.id}"
  route_table_id = "${aws_route_table.pub_a.id}"
}