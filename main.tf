provider "aws" {
  region = "us-east-1"
}
resource "aws_db_subnet_group" "mydb_subnet_groups" {
  name       = "mydb-subnet-groups"
  subnet_ids = ["subnet-061c5aa91120d6221", "subnet-032fb21e1ee472561"]
}
resource "aws_db_instance" "mydb" {
  identifier          = "mydb"
  engine              = "postgres"
  engine_version      = "12.7"
  instance_class      = "db.t3.micro"
  allocated_storage   =  10
  storage_type        = "gp2"
  storage_encrypted   = true
  db_subnet_group_name = "mydb-subnet-groups"
  db_name                = "mydatabase"
  username            = "naga"
  password            = "password"
  parameter_group_name = "default.postgres12"
}

