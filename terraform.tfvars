# VPC - use these parameters to create new VPC resources
# 10.0.0.0 - 10.255.255.255 (10/8 접두사)	
# 172.16.0.0 - 172.31.255.255 (172.16/12 접두사)	
# 192.168.0.0 - 192.168.255.255 (192.168/16 접두사)	
cidr = "192.168.0.0/16"

azs = ["ap-northeast-2a", "ap-northeast-2c"]

private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]

public_subnets = ["192.168.11.0/24", "192.168.12.0/24"]

# VPC - use these parameters to use existing VPC resources
# vpc_id = "vpc-1651acf1"
# private_subnet_ids = ["subnet-1fe3d837", "subnet-129d66ab"]
# public_subnet_ids = ["subnet-1211eef5", "subnet-163466ab"]

# DNS
route53_zone_name = "overtake.live"         ## (1) route53 의 도메인
route53_zone_id   = "Z01434532HN0SX4VDYLJG" ## (2) route 53 내의 (1) 에 대한 zone id 

# ACM (SSL certificate)
# Specify ARN of an existing certificate or new one will be created and validated using Route53 DNS:
certificate_arn = ""

# ECS Service and Task
ecs_service_assign_public_ip = true

# Atlantis
atlantis_allowed_repo_names = ["eks-tf-provisioning"]       ## (3) atlantis 가 검사할 terraform 리포지터리
atlantis_repo_whitelist     = ["github.com/alpha3002025/*"] ## (4) atlantis 가 검사할 리포지터리 주소 (여러개를 지정할 수 있다.)

# Specify one of the following block.
# For Github
atlantis_github_user = "alpha3002025" ## (5) 사용할 github user 명

# For Gitlab
atlantis_gitlab_user       = ""
atlantis_gitlab_user_token = ""

# For Bitbucket
atlantis_bitbucket_user       = ""
atlantis_bitbucket_user_token = ""

# For Bitbucket on prem (Stash)
# atlantis_bitbucket_base_url = ""

# Tags
tags = {
  Name = "atlantis"
}

policies_arn = [
  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
]
