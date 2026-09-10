terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}


resource "docker_image" "image" {
    name = var.image_name
    keep_locally = false
}

resource "docker_container" "container" {
    name = var.container_name
    image = docker_image.image.image_id
    network_mode = var.network_name
    env = ["POSTGRES_PASSWORD=mysecretpassword"]
}