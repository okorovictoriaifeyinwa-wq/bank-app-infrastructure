# Outputs temporarily disabled
# Uncomment when helm releases are enabled

# output "nginx_lb_ip" {
#   value = data.aws_lb.nginx_ingress.ip_address_type == "ipv4" ? data.aws_lb.nginx_ingress.dns_name : data.aws_lb.nginx_ingress.dns_name
# }

# output "nginx_ingress_load_balancer_hostname" {
#   value = data.aws_lb.nginx_ingress.dns_name
# }
