resource "azurerm_virtual_network" "red_ubuntu" {
     name = "${var.prefix}-network" 
     address_space = ["10.0.0.0/16"] 
     location = var.vmlocation
     resource_group_name = var.rgname
}

resource "azurerm_subnet" "subred_ubuntu" {
     name = "internal" 
     resource_group_name = var.rgname
      virtual_network_name = azurerm_virtual_network.red_ubuntu.name
       address_prefixes = ["10.0.2.0/24"] 
}

resource "azurerm_public_ip" "ip_publica" {
     name = "${var.prefix}-public-ip"
     location = var.vmlocation
     resource_group_name = var.rgname
     allocation_method = "Dynamic"
}
       
 resource "azurerm_network_interface" "interfaz_ubuntu" {
     name = "${var.prefix}-nic" 
     location = var.vmlocation 
     resource_group_name = var.rgname
      
     ip_configuration {
          name = "configuracionip" 
          subnet_id = azurerm_subnet.subred_ubuntu.id
          private_ip_address_allocation = "Dynamic"
          public_ip_address_id = azurerm_public_ip.ip_publica.id 
     } 
}

 resource "azurerm_virtual_machine" "ercubuntu" {
     name = "${var.prefix}-vm" 
     location = var.vmlocation 
     resource_group_name = var.rgname
     network_interface_ids = [azurerm_network_interface.interfaz_ubuntu.id] 
     vm_size = "Standard_DS1_v2" 
     tags = var.tags
      
    storage_image_reference { 
          publisher = "Canonical"
          offer = "UbuntuServer" 
          sku = "16.04-LTS" 
          version = "latest" 
     } 
          
    storage_os_disk {
         name =  "${var.prefix}-disk"
         caching = "ReadWrite" 
         create_option = "FromImage" 
         managed_disk_type = "Standard_LRS" 
     } 
         
    os_profile {
         computer_name = "${var.prefix}-ubuntu" 
         admin_username = "LadronCafeina" 
         admin_password = "R0baC4fes" 
     } 
         
    os_profile_linux_config { 
        disable_password_authentication = false 
     } 
     
}