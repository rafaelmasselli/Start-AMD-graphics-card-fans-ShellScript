## Inicializador automático das fans da placa de video AMD no sistema operacional Linux Ubuntu 22.04

### Requisitos para iniciar o projeto

- [git](https://git-scm.com/)

### Descrição

#### O Script ( service-create ) vai criar um serviço de inicialização automática das fans da placa de video

<br>

#### Para modificar a velocidade que as ventoinhas vai rodar ao iniciar você devera entrar no arquivo ( inicializefans.sh ) e modificar o numero que esta na frente do ( ./amdgrpu-pro-fans.sh -s )

![Alterando a potencia da fan](./.github/fan-power.gif)

<hr>

### Iniciando o projeto

#### Para o script iniciar junto com o sistema operacional voce precisa colocar a pasta do projeto na home do usuário

```bash
$ cd /home/$USER/
## Clone o projeto
$ git clone https://github.com/rafaelmasselli/Start-AMD-graphics-card-fans-ShellScript
```

### Iniciando o Script

```bash
chmod +x service-create.sh
sudo ./service-create.sh
```

- ### [Código para fazer as fans rodar](https://github.com/dominilux/amdgpu-pro-fans)
