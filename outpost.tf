output "instance_public_ip" {
    description = "public ip"
    value = {
        ip = aws_instance.Ngnixserver.public_ip
        url = "http://${aws_instance.Ngnixserver.public_ip}" 
    } 

}

# output "instance_url" {
#     description = "THe URL Access the Ngnix server"
#     value = "http://${aws_instance.Ngnixserver.public_ip}"  
# }