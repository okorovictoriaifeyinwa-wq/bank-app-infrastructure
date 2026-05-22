provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks_cluster.token
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_cluster.token
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = var.cluster_name
}

# resource "helm_release" "nginx_ingress" {
#   name             = "nginx-ingress"
#   repository       = "https://kubernetes.github.io/ingress-nginx"
#   chart            = "ingress-nginx"
#   version          = "4.8.0"
#   namespace        = "ingress-nginx"
#   create_namespace = true
#   values           = [file("${path.module}/nginx-ingress-values.yaml")]
#   depends_on       = [var.eks_cluster_eks_node_group]
# }

# data "aws_lb" "nginx_ingress" {
#   tags = {
#     "kubernetes.io/ingress-nginx/ingress-nginx-nginx-controller" = "owned"
#   }
#   depends_on = [helm_release.nginx_ingress]
# }

# resource "helm_release" "cert_manager" {
#   name             = "cert-manager"
#   repository       = "https://charts.jetstack.io"
#   chart            = "cert-manager"
#   version          = "1.14.4"
#   namespace        = "cert-manager"
#   create_namespace = true
#   set {
#     name  = "installCRDs"
#     value = "true"
#   }
#   depends_on = [helm_release.nginx_ingress]
# }

# resource "helm_release" "argocd" {
#   name             = "argocd"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   version          = "5.51.6"
#   namespace        = "argocd"
#   create_namespace = true
#   values           = [file("${path.module}/argocd-values.yaml")]
#   depends_on       = [helm_release.nginx_ingress, helm_release.cert_manager]
# }
