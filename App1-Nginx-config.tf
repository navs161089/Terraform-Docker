resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}


resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
    external = 80
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/naveen/mywebsite"
    read_only = true
  }
}
