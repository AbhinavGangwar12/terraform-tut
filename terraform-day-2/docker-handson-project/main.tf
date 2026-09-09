terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine" 
}

resource "docker_image" "nginx"{
    name = "nginx:latest"
    keep_locally = false
}
resource "docker_network" "my_network" {
    name = "terraform_network"
}
resource "docker_container" "my_container" {
    count = 2
    image = "${docker_image.nginx.image_id}"
    name = "nginx-server-${count.index}"
    network_mode = docker_network.my_network.name
    # ports = { "8080+${count.index}" }
}