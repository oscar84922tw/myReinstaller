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
apps=( caskroom/cask/brew-cask git gnu-sed --with-default-names go wget mercurial mackup mysql wget zsh  mongodb source-highlight node htop-osx maven harfbuzz pidof arm heroku pixman autoconf highlight pkg-config autogen htop platformio automake icu4c polipo bdw-gc json-c postgresql boost libevent protobuf boot2docker libffi pstree cairo libgpg-error python cmake libksba python3 ctags libpng readline docker libtool redis docker-machine libunistring rkhunter doxygen libxml2 rrdtool eris libyaml ruby fail2ban lua ruby21 fontconfig luajit scala freetype mackup smartmontools gdbm mercurial sqlite geoip mongodb ssh-copy-id gettext mysql tor git ncdu uncrustify glib node vim gmp openssl watchman gnu-sed p0f wget go pango xz gobject-introspection pcre zsh guile perl zsh-syntax-highlighting )
caskapps=( android-studio alfred mamp spotify sequel-pro eclipse-java google-chrome intellij-idea iterm2 java pomotodo pycharm webstorm vlc qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package dropbox appcleaner sublime-text3 evernote )

brew install "${apps[@]}"
brew tap caskroom/versions
brew cask update
brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cleanup
brew cask cleanup

pythonFramework=( ipython scrapy )

pip install "${pythonFramework[@]}"

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
