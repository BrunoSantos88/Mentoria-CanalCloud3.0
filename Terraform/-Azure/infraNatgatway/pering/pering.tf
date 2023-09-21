#pering global
resource "azurerm_virtual_network_peering" "k8_to_jenkins" {
  name                         = "vnet0-to-vnet2"
  resource_group_name          = "Clusterk8s-get-started-rg"
  virtual_network_name         = "Clusterk8s-server-vmVNET"
  remote_virtual_network_id    = "jenkins-server-vmVNET"
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet1_to_vnet3" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = "jenkins-get-started-rg"
  virtual_network_name         = "jenkins-server-vmVNET"
  remote_virtual_network_id    = "Clusterk8s-server-vmVNET"
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}
