terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }    
}

resource "docker_image" "image_template" {
    name = var.image_name
    keep_locally = false
}

resource "docker_container" "api_container"{
    name = var.container_name
    image = docker_image.image_template.image_id
    network_mode = var.network_name
    ports {
        internal = 80
        external = var.host_port
    }
}