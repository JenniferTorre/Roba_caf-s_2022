variable "prefix" {
     default = "tfvmex" 
     }

resource "azurerm_resource_group" "grupo_ubuntu" {
     name = "${var.prefix}-resources" 
     location = "West Europe" 
     } 

resource "azurerm_virtual_network" "red_ubuntu" {
     name = "${var.prefix}-network" 
     address_space = ["10.0.0.0/16"] 
     location = azurerm_resource_group.grupo_ubuntu 
     resource_group_name = azurerm_resource_group.grupo_ubuntu
     }

resource "azurerm_subnet" "subred_ubuntu" {
     name = "internal" 
     resource_group_name = azurerm_resource_group.grupo_ubuntue
      virtual_network_name = azurerm_virtual_network.red_ubuntu
       address_prefixes = ["10.0.2.0/24"] 
       }
       
 resource "azurerm_network_interface" "interfaz_ubuntu" {
      name = "${var.prefix}-nic" 
      location = azurerm_resource_group.grupo_ubuntu 
      resource_group_name = azurerm_resource_group.grupo_ubuntu 
      
      ip_configuration {
           name = "configuracionip" 
           subnet_id = azurerm_subnet.subred_ubuntu 
           private_ip_address_allocation = "Dynamic" 
           } 
        }

 resource "azurerm_virtual_machine" "MV_ubuntu" {
      name = "${var.prefix}-vm" 
      location = azurerm_resource_group.grupo_ubuntu 
      resource_group_name = azurerm_resource_group.grupo_ubuntu 
      network_interface_ids = [azurerm_network_interface.red_ubuntu] 
      vm_size = "Standard_DS1_v2" 

      # Uncomment this line to delete the OS disk automatically when deleting the VM 
      # delete_os_disk_on_termination = true 
      
      # Uncomment this line to delete the data disks automatically when deleting the VM 
      # delete_data_disks_on_termination = true 
      
    storage_image_reference { 
          publisher = "Canonical"
          offer = "UbuntuServer" 
          sku = "16.04-LTS" 
          version = "latest" 
          } 
          
    storage_os_disk {
         name = "myosdisk1" 
         caching = "ReadWrite" 
         create_option = "FromImage" 
         managed_disk_type = "Standard_LRS" 
         } 
         
    os_profile {
         computer_name = "RobaCafes_mv_ubuntu" 
         admin_username = "LadronCafeina" 
         admin_password = "R0baC4fes" 
         } 
         
    os_profile_linux_config { 
        disable_password_authentication = false 
        } 
        tags = { 
            environment = "staging" 
            } 
    }