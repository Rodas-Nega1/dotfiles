#!/bin/bash
#
# Setting up a new instance
#
echo Update & upgrade system
sudo apt-get update
sudo apt-get full-upgrade -y

# Configure Git
git config --global user.email "rodas.nega@mths.ca"
git config --global user.name "Rodas-Nega1"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

# Github & SSH
echo "Enter 3 times"
ssh-keygen -t ed25519 -C "rodas.nega@mths.ca"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Copy that and bring to setting"
echo "once done press enter"
read any_key
echo "type yes"
echo "press enter"
read any_key
ssh -T git@github.com

# NeoVim
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..

echo Load .bashrc file
cp ~/dotfiles/.bashrc ~/.bashrc

echo load nvim options
cp -r ~/dotfiles/config ~/.config

# Typel script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" #loads vim
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" #loads
nvm install node --lst
nvm install-latest-npm

# load java software
echo load java
sudo apt install default-jdk -y

# script
echo load shell script file
mkdir ~/scripts

# java linter
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.3.3/checkstyle-10.3.3-all.jar
cp ./checkstyle-10.3.3-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/
rm checkstyle-10.3.3-all.jar
rm mr-coxall_checks.xml

# rid of dotfiles
sudo rm -R ~/dotfiles

mkdir ~/ICS4U
mkdir -p ~/ICS4U/Unit1/Unit1-02
mkdir ~/ICS4U/Unit1/Unit1-03
mkdir ~/ICS4U/Unit1/Unit1-04
mkdir ~/ICS4U/Unit1/Unit1-05
mkdir ~/ICS4U/Unit1/Unit1-06
mkdir ~/ICS4U/Unit1/Unit1-07
# ... 

# reboot
echo ---
echo rebooting now ...
echo ---
sudo reboot now
