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
apps=( autoconf automake cmake ctags ffmpeg gcc git go gradle highlight htop jpeg libdnet libevent libffi libmpc libpng libtiff libtool libyaml nmap node numpy mycli macvim  openssl pcre pixman pkg-config polipo portaudio python python3 r rkhunter ruby smartmontools source-highlight sqlite ssh-copy-id testdisk tor tig tmux valgrind vim wget zsh zsh-syntax-highlighting z )

# caskapps=( appcleaner arduino atom dropbox firefox google-chrome iterm2 java mplayerx mysqlworkbench processing robomongo quicklook-csv quicklook-json skype spotify sqlitebrowser vlc webpquicklook rstudio)

pythonFramework=( glances )
pip3 install "${pythonFramework[@]}"
brew install "${apps[@]}"
brew tap caskroom/versions
brew update
# brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cleanup
brew cask cleanup
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport

# 電池顯示是百分百
defaults write com.apple.menuextra.battery -bool true

# Finder 顯示狀態欄
defaults write com.apple.finder ShowStatusBar -bool true

# Finder 顯示地址欄
defaults write com.apple.finder ShowPathbar -bool true

# 禁止在網絡驅動器上生成 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
