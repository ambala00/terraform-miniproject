resource "aws_elb" "bar" {
  name               = "ambala-terraform-elb"
  availability_zones = ["ap-south-1a", "ap-south-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                 = ["${aws_instance.one.id}", "${aws_instance.two.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "ambala-tf-elb"
  }
}

 /*resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  availability_zones      = ["ap-south-1a", "ap-south-1b"]
  database_name           = "mydb"
  master_username         = "ambala"
  master_password         = "Ambala@3186786"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}*/

/*resource "aws_instance" "one" {
  for_each = toset(["one", "two", "three"])
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = {
    Name = "instance-${each.key}"
  }
}
*/
