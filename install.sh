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

# baixar o rclone.conf
mkdir -p ~/.config/rclone
wget https://raw.githubusercontent.com/ricardo8c/init/main/rclone/rclone.conf -O rclone.conf

printf "para copiar o arquivo rclone.conf, execute: cp rclone.conf ~/.config/rclone/rclone.conf"
