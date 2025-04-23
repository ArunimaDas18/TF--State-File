resource "aws_instance" "test_instance" {

 instance_type          = var.instance_type
 key_name               = var.key_name
 monitoring             = true
 vpc_security_group_ids = [aws_security_group.web_server_sg.id]
 

 tags = {
   Name      = test_instance
   ManagedBy = "Terraform"
 }
}

resource "aws_security_group" "web_server_sg" {
 name        = "web-server-sg"
 description = "Security group for our web server"

 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"     # Use -1 to specify all protocols
   cidr_blocks = ["0.0.0.0/0"]
 }
}


backend "s3" {
   region = "ap-south-1"
   key    = "terraform.tfstate"
 }

