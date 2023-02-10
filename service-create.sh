# !/bin/bash

echo O seu computador vai reiniciar nesse processo, deseja continuar a execução do script?
echo Digite S para continuar e N para sair
read Alternative

lowerstAlternative=$(echo $Alternative | tr '[:upper:]' '[:lower:]')

if [ $lowerstAlternative = "s" ]; then
cd /etc/systemd/system/
echo "Criando o arquivo incialize-fans.service, no /etc/systemd/system"

echo "[Unit]
Description="script to run graphics card fans"
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /Start-AMD-graphics-card-fans-ShellScript/inicializefans.sh
TimeoutStartSec=0

[Install]
WantedBy=default.target
"> inicialize-fans.service

echo "Habilitando o arquivo inicialize-fans.service"

systemctl daemon-reload
systemctl enable inicialize-fans.service

echo "O sistema ira reiniciar a 10 segundos"
start=$(date +%s)
sleep 10
end=$(date +%s)
reboot

else
     echo "👾"
fi
