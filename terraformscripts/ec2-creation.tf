provider "aws"{
  region = "ap-south-1"
}


resource "aws_instance" "AWSInstance"{
    ami = "ami-0e07dcaca348a0e68"
	instance_type = "t2.micro"
	key_name = "amitkey"
	tags = {
	 Name = "apacheserver"
	}
}


