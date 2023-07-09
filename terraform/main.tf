terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"
}

resource "docker_image" "node-hello" {
  name  = "node"

  build {
    context     = "../"
    tag         = ["node-hello:v1"]
  }
}

resource "docker_container" "terraform-docker-node-test" {
  image = docker_image.node-hello.image_id
  name = "terraform-docker-node"
  ports {
    internal = 5000
    external = 5000
  }

  env = ["PORT=5000"]
}

resource "docker_container" "terraform-docker-node-test-1" {
  image = docker_image.node-hello.image_id
  name = "terraform-docker-node-1"
  ports {
    internal = 6000
    external = 6000
  }

  env = ["PORT=6000"]
}

resource "docker_container" "terraform-docker-node-test-2" {
  image = docker_image.node-hello.image_id
  name = "terraform-docker-node-2"
  ports {
    internal = 7000
    external = 7000
  }

  env = ["PORT=7000"]
}

