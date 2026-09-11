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

resource "docker_container" "backend_container_template"{
    name = var.container_name
    image = docker_image.image_template.image_id
    network_mode = var.network_name
    # must_run = false
    volumes {
        volume_name = var.volume_name
        # old path
        # container_path = "/var/lib/postgresql/data" 
        # new path
        container_path = "/var/lib/postgresql" 
    }
    env = ["POSTGRES_PASSWORD=trackr_admin"]
}