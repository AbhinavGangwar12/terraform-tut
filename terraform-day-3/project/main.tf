resource "docker_network" "final_network" {
    name = "final_net"
}

module "web" {
    source = "./modules"
    container_name = "my-nginx-web"
    image_name = var.nginx_image
    network_name = docker_network.final_network.name 
    depends_on = [
        module.db
    ]
}
module "db" {
    source = "./modules"
    container_name = "my-postgres-db"
    image_name = var.postgres_image
    network_name = docker_network.final_network.name
}