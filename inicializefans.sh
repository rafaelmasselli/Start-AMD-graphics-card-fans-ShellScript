#!/bin/bash

speed=36
echo "Executando fans da placa de video com ${speed}% de potência"

cd /start-amd-graphics-card-fans/

chmod +x amdgpu-pro-fans.sh
sudo ./amdgpu-pro-fans.sh -s $speed
