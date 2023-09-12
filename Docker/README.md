# Manipulação
$ docker create volume        --// cria volume
$ docker create network       --/// criar network

$ docker rm -f imagens       ---/// deletar
$ docker ps                  ---///listar
$ docker images ls           ---//listar imagens

# Versinamento
docker tag imagen                            ----/// criar tag da imagens
docker push imagen "set url upload"          ---///upload para repositorio dockerhub ou Cloud

# Build 
$ docker build -t .
$ docker build -t arquivo/ .


# Executar 

$ docker run nginx  //--- Baixa imagen nginx:latest
$ docker run -d -p 80:80 nginx //-- setar paraemetros

# Docker Compose


# docker commandos Swarm


