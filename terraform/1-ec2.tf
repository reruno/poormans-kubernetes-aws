resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh-sg"
  description = "Allow SSH inbound traffic"
  
  vpc_id      = aws_subnet.public_subnet_a.vpc_id 

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-sg"
  }

  depends_on = [ aws_subnet.public_subnet_a ]
}

resource "aws_key_pair" "my_key" {
  key_name = "my-aws-key-pair" 
  public_key = file("~/.ssh/id_ed25519.pub") 
}

resource "aws_instance" "hello_world" {
  ami           = "ami-0f439e819ba112bd7" # Debian amd64
  instance_type = "t3a.nano"
  subnet_id     = aws_subnet.public_subnet_a.id

  key_name = aws_key_pair.my_key.key_name 

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "hello-world-pm-k8s"
  }

  depends_on = [ aws_security_group.allow_ssh ]
}