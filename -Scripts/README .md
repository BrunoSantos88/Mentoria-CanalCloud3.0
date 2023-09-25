# instalar jenkins azure CLi

- usar azure Cli ou Clou shell

az group create --name jenkins-get-started-rg --location eastus
az group create --name Clusterk8s-get-started-rg --location eastus


az vm create --resource-group jenkins-get-started-rg --name jenkins-server-vm --image UbuntuLTS --data-disk-sizes-gb 80 --size Standard_D2s_v3 --admin-username "jenkins"  --ssh-key-value ~/.ssh/id_rsa.pub --public-ip-sku Standard --custom-data cloud-init-jenkins.txt 

az vm create --resource-group jenkins-get-started-rg --name monitoramento-server-vm --image UbuntuLTS --data-disk-sizes-gb 1024 --size Standard_D2as_v4 --admin-username "azureuser" --generate-ssh-keys --public-ip-sku Standard 

az vm create --resource-group Clusterk8s-get-started-rg --name Clusterk8s-server-vm --image UbuntuLTS --data-disk-sizes-gb 160 --size Standard_D2as_v4 --admin-username "azureuser" --generate-ssh-keys --public-ip-sku Standard --custom-data cloud-init-clusterk8.txt


az vm list -d -o table --query "[?name=='jenkins-server-vm']"
az vm list -d -o table --query "[?name=='monitoramento-server-vm']"
az vm list -d -o table --query "[?name=='Clusterk8s-server-vm']"

az vm open-port --resource-group jenkins-get-started-rg --name jenkins-server-vm --port 8080 --priority 1010

az vm open-port --resource-group jenkins-get-started-rg --name monitoramento-server-vm --port 9090 --priority 1020

az vm open-port --resource-group Clusterk8s-get-started-rg --name Clusterk8s-server-vm --port 3000-32800 --priority 1010

az vm open-port --resource-group Clusterk8s-get-started-rg --name monitoramento-server-vm --port 9100 --priority 1030

az vm open-port --resource-group -get-started-rg --name monitoramento-server-vm --port 3000 --priority 1040

az vm show --resource-group jenkins-get-started-rg --name monitoramento-server-vm -d --query [publicIps] --output tsv

# Criar SSH
- ssh-keygen -m PEM -t rsa -b 4096
- --ssh-key-value ~/.ssh/id_rsa.pub

- commando add
- c \- --ssh-key-values mysshkey.pub

# Colocar Gitignore na chave

Acesso SSH commados apos instalação

ssh -i ~/.ssh/id_rsa jenkins@ip
service jenkins status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
