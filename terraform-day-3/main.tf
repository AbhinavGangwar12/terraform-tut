module "app_one" {
    source = "./modules"
    app_name = "trackr"
}
module "app_two" {
    source = "./modules"
    app_name = "SignWeaver"
}