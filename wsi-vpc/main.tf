module "vpc" {
  source = "./modules"

  vpc_name = local.vpc.name
  vpc_cidr = local.vpc.cidr

  public_subnet_a_name = "wsi-public-a"
  public_subnet_a_cidr = "10.1.2.0/24"

  private_subnet_a_name =  "wsi-app-a"
  private_subnet_a_cidr = "10.1.0.0/24"

  igw_name = "wsi-igw"

  nat_a_name = "wsi-natgw-a"

  public_rt_name = "wsi-public-rt"
  private_a_rt_name = "wsi-app-a-rt"
}