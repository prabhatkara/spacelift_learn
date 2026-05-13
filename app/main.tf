variable "subnet_id" {
  type        = string
  description = "ID of the subnet from networking stack"
}
data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_vpc" "selected" {
  id = data.aws_subnet.selected.vpc_id
}

resource "aws_security_group" "app" {
  name        = "orbit-labs-app-sg"
  description = "Security group for Orbit Labs app"
  vpc_id      = data.aws_vpc.selected.id

  tags = {
    name    = "Orbit Labs App SG"
    project = "Orbit-labs"
  }
}