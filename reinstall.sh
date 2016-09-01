# @Author: Oscar
# @Date:   2016-09-01 16:33:11
# @Last Modified by:   oscar
# @Last Modified time: 2016-09-01 23:00:02

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
apps=( caskroom/cask/brew-cask git gnu-sed --with-default-names go wget mercurial mackup mysql python python3 scala ruby vim wget zsh autoconf mongodb source-highlight node openssl sqlite ssh-copy-id tor htop-osx zsh-completions zsh-syntax-highlighting maven )
caskapps=( android-studio alfred mamp spotify sequel-pro eclipse-java google-chrome intellij-idea iterm2 java pomotodo pycharm webstorm vlc qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package dropbox appcleaner sublime-text3 evernote )

brew install "${apps[@]}"
brew tap caskroom/versions
brew cask update
brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cleanup
brew cask cleanup

# 電池顯示是百分百
defaults write com.apple.menuextra.battery -bool true

# Finder 顯示狀態欄
defaults write com.apple.finder ShowStatusBar -bool true

# Finder 顯示地址欄
defaults write com.apple.finder ShowPathbar -bool true

# 禁止在網絡驅動器上生成 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# 重新整理 launchpad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
