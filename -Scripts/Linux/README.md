# instalar jenkins azure CLi

- usar azure Cli ou Clou shell

az group create --name jenkins-get-started-rg --location eastus

az vm create --resource-group jenkins-get-started-rg --name jenkins-server-vm --image UbuntuLTS --data-disk-sizes-gb 1024 --size Standard_D2as_v4 --admin-username "azureuser" --generate-ssh-keys --public-ip-sku Standard --custom-data cloud-init-jenkins.txt

az vm create --resource-group jenkins-get-started-rg --name monitoramento-server-vm --image UbuntuLTS --data-disk-sizes-gb 1024 --size Standard_D2as_v4 --admin-username "azureuser" --generate-ssh-keys --public-ip-sku Standard 

az vm list -d -o table --query "[?name=='jenkins-server-vm']"
az vm list -d -o table --query "[?name=='monitoramento-server-vm']"

az vm open-port --resource-group jenkins-get-started-rg --name jenkins-server-vm --port 8080 --priority 1010

az vm open-port --resource-group jenkins-get-started-rg --name monitoramento-server-vm --port 9090 --priority 1020

az vm open-port --resource-group jenkins-get-started-rg --name monitoramento-server-vm --port 9100 --priority 1030

az vm open-port --resource-group jenkins-get-started-rg --name monitoramento-server-vm --port 3000 --priority 1040

az vm show --resource-group jenkins-get-started-rg --name monitoramento-server-vm -d --query [publicIps] --output tsv

Acesso SSH commados apos instalação

ssh azureuser@<ip_address>
service jenkins status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword