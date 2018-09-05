cp ~/.vimrc vimrc 
echo "backup vimrc"
cp ~/.zshrc zshrc
echo "backup zshrc"
cp ~/.tmux.conf.local tmux.conf.local
echo "backup tmux"
cp Brewfile Brewfile.bak 
rm Brewfile
brew bundle dump
rm Brewfile.bak
echo "backup brew"

git add . && git commit -m "udpate" && git push
