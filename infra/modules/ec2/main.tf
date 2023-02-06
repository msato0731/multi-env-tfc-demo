data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_network_interface" "this" {
  subnet_id   = var.subnet_id
}

resource "aws_instance" "this" {
  ami           = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = var.instance_type
  network_interface {
    network_interface_id = aws_network_interface.this.id
    device_index         = 0
  }

  tags = {
    Name = var.instance_name
  }
}
