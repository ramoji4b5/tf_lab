
############resource############################################
resource "aws_emr_cluster" "example" {
  name           = "example-cluster"
  release_label  = "emr-6.4.0"
  instance_type  = "m5.xlarge"
  instance_count = "3"

}