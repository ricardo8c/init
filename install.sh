#!/bin/bash

# instalar o navi
printf "instalando o navi"

bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
sudo apt update && sudo apt install fzf 
# no alpine: apk add navi skim rclone

# instalar o rclone
printf "instalando o rclone"
curl https://rclone.org/install.sh | sudo bash

# reload bash
printf "reloading bash"
source ~/.bashrc

# criar pasta do rclone.conf
mkdir -p ~/.config/rclone

read -p "Deseja copiar/substituir o rclone.conf? [S/n]: " resposta

if [ -z "$resposta" ]; then
    resposta="s"
fi

# Verifica se a resposta é 's' ou 'S'
if [[ "$resposta" =~ ^[Ss]$ ]]; then
    echo "copiando o rclone.conf..."
    cp rclone/rclone.conf ~/.config/rclone/rclone.conf
else
    printf "para copiar o arquivo rclone.conf, execute: cp rclone/rclone.conf ~/.config/rclone/rclone.conf"
fi


read -p "Deseja baixar mycheats.cheat e core.cheat? [S/n]: " resposta

if [ -z "$resposta" ]; then
    resposta="s"
fi

# Verifica se a resposta é 's' ou 'S'
if [[ "$resposta" =~ ^[Ss]$ ]]; then
    echo "copiando..."
    rclone copy rustfs:dev/navi-cheats/mycheats.cheat ~/.local/share/navi/cheats/
    rclone copy rustfs:dev/navi-cheats/core.cheat ~/.local/share/navi/cheats/
else
    printf "para copiar cheats, use o navi/rclone"
fi
