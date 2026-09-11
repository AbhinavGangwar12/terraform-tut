resource "docker_network" "app_net" {
    name = "app_net"
}
resource "docker_volume" "app_volume" {
    name = var.volume_name
}
module "db" {
    source = "./module/database"
    container_name = "database-container-postgres"
    image_name = var.postgres_img
    volume_name = docker_volume.app_volume.name
    network_name = docker_network.app_net.name
}

module "api" {
    source = "./module/api"
    count = 2
    container_name = "api-container-nginx-${count.index}"
    image_name = var.nginx_img
    network_name = docker_network.app_net.name 
    host_port = var.host_port + count.index
    depends_on = [
        module.db
    ]
}