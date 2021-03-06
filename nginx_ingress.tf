resource "helm_release" "nginx_ingress" {
  count            = var.nginx_ingress_enabled ? 1 : 0
  name             = "nginx-ingress"
  chart            = "nginx-ingress"
  repository       = "stable"
  create_namespace = "true"
  namespace        = "nginx-ingress"
  values           = [file("${path.module}/nginx_ingress.yaml")]

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }
}
