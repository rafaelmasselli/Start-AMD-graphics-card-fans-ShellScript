# !/bin/bash

echo ´Executando fans da placa de video com 36% de potência´

cd /start-amd-graphics-card-fans/
chmod +x amdgpu-pro-fans.sh
sudo ./amdgpu-pro-fans.sh -s 36
