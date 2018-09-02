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

brew update
brew upgrade --all
brew bundle

caskapps=( appcleaner firefox google-chrome iterm2 mysqlworkbench quicklook-csv quicklook-json spotify webpquicklook docker )

pythonFramework=( glances virtualenvwrapper howdoi percol )
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew update
brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cleanup
brew cask cleanup
pip install "${pythonFramework[@]}"

# virtualenvwrapper setup 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
# install spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" 
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# copy my zshrc settings
cp zshrc ~/.zshrc

# install vim
# wget clone https://raw.githubusercontent.com/ipomoealba/Pyvim/master/.vimrc ~/.vimrc
cp vimrc ~/.vimrc 

# install oh my tmux 
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp ./tmux.conf.local ~/.tmux.conf.local

# install powerfonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

defaults write com.apple.menuextra.battery -bool true

defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.finder ShowPathbar -bool true

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
