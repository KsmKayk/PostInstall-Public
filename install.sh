#!/bin/bash

# author: Kayk Mascarenhas
# version: 1.0v
# license: MIT License

THEMES_DIRECTORY="$HOME/.themes"

removeAptLocks() {
  echo 'Removing APT Locks...'
  sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;
}

updateRepos() {
  echo 'Updating Repos...'
  sudo apt update;
}

installPackagesAndUbuntuRepos() {
  echo 'Instaling ubuntu packages...'
  echo 'Instaling curl...'
  sudo apt install curl -y;
  echo 'Instaling wget...'
  sudo apt install wget -y;
  echo 'Instaling wine...'
  sudo apt install wine -y;
  echo 'Instaling snapd...'
  sudo apt install snapd -y;
  echo 'Instaling Python3 PIP...'
  sudo apt install python3-pip -y;
  echo 'Instaling ZSH...'
  sudo apt install zsh -y;
}

installSnapPackages() {
  echo 'Instaling SnapPackages...'
  echo 'Instaling Snap Store...'
  sudo snap install snap-store;
  echo 'Instaling Pycharm...'
  sudo snap install pycharm-community --classic;
  echo 'Instaling Insomnia...'
  sudo snap install insomnia;  
  echo 'Instaling Spotify...'
  sudo snap install spotify;
  echo 'Instaling Node...'
  sudo snap install --edge node --classic;
  echo 'Instaling VsCode...'
  sudo snap install code --classic;  
}

WgetPackages() {
  echo 'Downloading Wget Packages...'
  echo 'Going to start folder'
  cd ./start/;
  echo 'Downloading Git Kraken...'
  wget https://release.gitkraken.com/linux/gitkraken-amd64.deb;
  echo 'Downloading Steam...'
  wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb;
  echo 'Downloading Mongo Compass...'
  wget https://downloads.mongodb.com/compass/mongodb-compass-community_1.21.2_amd64.deb;
  echo 'Downloading OperaGx...'
  wget https://download3.operacdn.com/pub/opera/desktop/69.0.3686.57/linux/opera-stable_69.0.3686.57_amd64.deb;
}

installDebPackages() {
  echo 'Instaling Wget/Deb Packages...'
  echo 'Git Kraken - Steam - Mongo Compass - OperaGx...'
  sudo dpkg -i *.deb;
}

installNodePackages() {
  echo 'Instaling Node Packages...'
  echo 'Instaling Yarn...'
  sudo npm install --global yarn;
  echo 'Instaling NPX...'
  sudo npm install --global npx;
}

installOhMyZsh() {
  echo 'Downloading and Instaling OhMyZSH...'
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";
}

changeBgAndTheme() {
  echo 'Changing BG and Ubuntu Theme...'
  echo 'Creating Theme Directory...'
  sudo mkdir "$THEMES_DIRECTORY";
  echo 'Extracting Dracula theme for Theme directory...'
  sudo tar -xf Dracula.tar.xz -C "$THEMES_DIRECTORY/";
  echo 'Changing theme to Dracula...'
  gsettings set org.gnome.desktop.interface gtk-theme Dracula;
  echo 'Copying Wallpaper to theme directory...'
  sudo cp "./Landscape.png" "$THEMES_DIRECTORY/"
  echo 'Changing Wallpaper...'
  gsettings set org.gnome.desktop.background picture-uri "file:///$THEMES_DIRECTORY/Landscape.png"
}
turnZshDefaultShell() {
  chsh -s $(which zsh)
}

removeAptLocks
updateRepos
installPackagesAndUbuntuRepos
updateRepos
installSnapPackages
WgetPackages
installDebPackages
updateRepos
installNodePackages
changeBgAndTheme
installOhMyZsh
turnZshDefaultShell
