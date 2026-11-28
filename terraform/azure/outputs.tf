output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Created resource group"
}
output "virtual_network_id" {
  value       = azurerm_virtual_network.main.id
  description = "Created virtual network ID"
}
output "app_subnet_id" {
  value       = azurerm_subnet.app.id
  description = "Created application subnet ID"
}