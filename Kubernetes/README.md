# Kubernets 

- Voce pode usar um pronto como de cloud AKS e EKS e entre outros providers com custo de uso.
- Voce pode usar Minikube para uso DevTest , não use isso em produção.

Alguns exemplos são:

Kind: Uma ferramenta para execução de contêineres Docker que simulam o funcionamento de um cluster Kubernetes. É utilizado para fins didáticos, de desenvolvimento e testes. O Kind não deve ser utilizado para produção;

Minikube: ferramenta para implementar um cluster Kubernetes localmente com apenas um nó. Muito utilizado para fins didáticos, de desenvolvimento e testes. O Minikube não deve ser utilizado para produção;

MicroK8S: Desenvolvido pela Canonical, mesma empresa que desenvolve o Ubuntu. Pode ser utilizado em diversas distribuições e pode ser utilizado em ambientes de produção, em especial para Edge Computing e IoT (Internet of things);

k3s: Desenvolvido pela Rancher Labs, é um concorrente direto do MicroK8s, podendo ser executado inclusive em Raspberry Pi;

k0s: Desenvolvido pela Mirantis, mesma empresa que adquiriu a parte enterprise do Docker. É uma distribuição do Kubernetes com todos os recursos necessários para funcionar em um único binário, que proporciona uma simplicidade na instalação e manutenção do cluster. A pronúncia é correta é kay-zero-ess e tem por objetivo reduzir o esforço técnico e desgaste na instalação de um cluster Kubernetes, por isso o seu nome faz alusão a Zero Friction. O k0s pode ser utilizado em ambientes de produção;

API Server: É um dos principais componentes do k8s. Este componente fornece uma API que utiliza JSON sobre HTTP para comunicação, onde para isto é utilizado principalmente o utilitário kubectl, por parte dos administradores, para a comunicação com os demais nós, como mostrado no gráfico. Estas comunicações entre componentes são estabelecidas através de requisições REST;

etcd: O etcd é um datastore chave-valor distribuído que o k8s utiliza para armazenar as especificações, status e configurações do cluster. Todos os dados armazenados dentro do etcd são manipulados apenas através da API. Por questões de segurança, o etcd é por padrão executado apenas em nós classificados como control plane no cluster k8s, mas também podem ser executados em clusters externos, específicos para o etcd, por exemplo;

Scheduler: O scheduler é responsável por selecionar o nó que irá hospedar um determinado pod (a menor unidade de um cluster k8s - não se preocupe sobre isso por enquanto, nós falaremos mais sobre isso mais tarde) para ser executado. Esta seleção é feita baseando-se na quantidade de recursos disponíveis em cada nó, como também no estado de cada um dos nós do cluster, garantindo assim que os recursos sejam bem distribuídos. Além disso, a seleção dos nós, na qual um ou mais pods serão executados, também pode levar em consideração políticas definidas pelo usuário, tais como afinidade, localização dos dados a serem lidos pelas aplicações, etc;

Controller Manager: É o controller manager quem garante que o cluster esteja no último estado definido no etcd. Por exemplo: se no etcd um deploy está configurado para possuir dez réplicas de um pod, é o controller manager quem irá verificar se o estado atual do cluster corresponde a este estado e, em caso negativo, procurará conciliar ambos;

Kubelet: O kubelet pode ser visto como o alente do k8s que é executado nos nós workers. Em cada nó worker deverá existir um agente Kubelet em execução. O Kubelet é responsável por de fato gerenciar os pods que foram direcionados pelo controller do cluster, dentro dos nós, de forma que para isto o Kubelet pode iniciar, parar e manter os contêineres e os pods em funcionamento de acordo com o instruído pelo controlador do cluster;

Kube-proxy: Age como um proxy e um load balancer. Este componente é responsável por efetuar roteamento de requisições para os pods corretos, como também por cuidar da parte de rede do nó;

# Portas que devemos nos preocupar
- CONTROL PLANE

- Protocol	Direction	Port Range	Purpose	Used By
- TCP	Inbound	6443*	Kubernetes API server	All
- TCP	Inbound	2379-2380	etcd server client API	kube-apiserver, etcd
- TCP	Inbound	10250	Kubelet API	Self, Control plane
- TCP	Inbound	10251	kube-scheduler	Self
- TCP	Inbound	10252	kube-controller-manager	Self
  
  # Toda porta marcada por * é customizável, você precisa se certificar que a porta alterada também esteja aberta.
- WORKERS
- Protocol	Direction	Port Range	Purpose	Used By
- TCP	Inbound	10250	Kubelet API	Self, Control plane
- TCP	Inbound	30000-32767	NodePort	Services All
