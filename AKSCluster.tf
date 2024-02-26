resource "azurerm_kubernetes_cluster" "my_cluster" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.my_cluster.location
  resource_group_name = azurerm_resource_group.my_cluster.name
  dns_prefix          = "aks-cluster-dns"

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_size
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.2.0.10"
    service_cidr   = "10.2.0.0/24"
    pod_cidr       = "10.244.0.0/16"
  }

  identity {
    type = "SystemAssigned"
  }
}
