###############################################################################
# Common Variables
###############################################################################
project = "testmz-secret-mg"
aws_region  = "ap-northeast-2"

default_tags = {
  dept  = "Platform Service Architect Group / DevOps SWAT Team"
  email = "schan@mz.co.kr"
}

env     = "dev"

###############################################################################
# sec-v
###############################################################################
secrets = [{
  name      = "test/db-info"
  sec = {
    db_host_ro  = "database-xxx.ap-northeast-2.rds.amazonaws.com"
    db_host_rw  = "database-xxx.ap-northeast-2.rds.amazonaws.com"
    db_user_ro  = "db_ro_user"
    db_user_rw  = "db_rw_user"
    # db_pass_ro  = ""
    # db_pass_rw  = ""
  },

}]