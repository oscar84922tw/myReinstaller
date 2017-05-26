#!/bin/bash 

sudo apt-get install gparted
sudo apt-get update && sudo apt-get install -y curl vim git zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
sudo chsh -s $(which zsh) $(whoami)

echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
sudo apt-get update
sudo apt-get install spotify-client

sudo apt-get install -y python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev

sudo add-apt-repository ppa:mystic-mirage/pycharm
sudo apt update

sudo apt install pycharm


sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install npm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.profile

sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev
sudo apt-get install gdebi-core
wget https://download1.rstudio.org/rstudio-1.0.44-amd64.deb
sudo gdebi -n rstudio-1.0.44-amd64.deb
rm rstudio-1.0.44-amd64.deb

sudo ufw enable 
sudo apt-get install rkhunter 
