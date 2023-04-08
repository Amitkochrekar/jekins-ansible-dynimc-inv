provider "aws"{
  region = "ap-south-1"
}


resource "aws_instance" "AWSInstance"{
    ami = "ami-03c4dbdfc36515b16"
	instance_type = "t2.micro"
	key_name = "amitkey"
	security_groups = ["launch-wizard-48"]
	tags = {
	 Name = "terraform"
		
	}
}


