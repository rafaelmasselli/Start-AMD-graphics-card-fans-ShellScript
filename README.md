## Inicializador automático das ventoinhas da placa de vídeo AMD no sistema operacional Linux Ubuntu 22.04

### Requisitos 

- [git](https://git-scm.com/)

### Descrição

Este script, chamado "service-create", cria um serviço para iniciar automaticamente as ventoinhas da placa de vídeo.

Para ajustar a velocidade de rotação das ventoinhas ao iniciar, você precisa editar o arquivo "inicializefans.sh" e modificar o número em frente a "./amdgrpu-pro-fans.sh -s".

![Alterando a potencia da fan](./.github/fan-power.gif)

<hr>

### Configurando o projeto

Para que o script seja iniciado juntamente com o sistema operacional, você precisa colocar a pasta na raiz do sistema.

```bash
$ cd /
## Clone o projeto
$ sudo git clone https://github.com/rafaelmasselli/start-amd-graphics-card-fans
```

### Iniciando o Script

```bash
sudo chmod +x service-create.sh
sudo ./service-create.sh
```
## Referencias

- [Codigo para rodar as fans](./referencias.md)
