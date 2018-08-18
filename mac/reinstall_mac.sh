# @Author: Oscar
# @Date:   2016-09-01 16:33:11
# @Last Modified by:   oscar
# @Last Modified time: 2016-09-09 12:22:23

# Install Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew);
  then echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew update
brew upgrade --all

# Install packages
apps=( wget autoconf automake cmake ctags ffmpeg gcc git go gradle highlight htop nmap node mycli macvim openssl pcre pixman pkg-config polipo portaudio python python3 rkhunter ruby smartmontools source-highlight sqlite ssh-copy-id tig tmux valgrind vim zsh zsh-syntax-highlighting z ack )

caskapps=( appcleaner firefox google-chrome iterm2 mysqlworkbench quicklook-csv quicklook-json spotify sqlitebrowser webpquicklook docker )

pythonFramework=( glances )
pip3 install "${pythonFramework[@]}"
brew install "${apps[@]}"
brew tap caskroom/versions
brew update
brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cleanup
brew cask cleanup


# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

cp ./zshrc ~/.zshrc
# install vim
wget clone https://raw.githubusercontent.com/ipomoealba/Pyvim/master/.vimrc ~/.vimrc

# install oh my tmux 
cd ~ || git clone https://github.com/gpakosz/.tmux.git || ln -s -f .tmux/.tmux.conf
wget https://raw.githubusercontent.com/oscar84922tw/myReinstaller/master/mac/tmux.conf.local ~/.tmux.conf.local
# 電池顯示是百分百
defaults write com.apple.menuextra.battery -bool true

# Finder 顯示狀態欄
defaults write com.apple.finder ShowStatusBar -bool true

# Finder 顯示地址欄
defaults write com.apple.finder ShowPathbar -bool true

# 禁止在網絡驅動器上生成 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
