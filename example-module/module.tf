variable "command" {
  default = "echo 'Hello World Change me'"
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "${var.command}"
  }
}
