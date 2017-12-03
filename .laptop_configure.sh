#!/bin/bash
set -e

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
chsh -s /bin/zsh

# install dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".dotfiles" >> ${HOME}/.gitignore
git clone --bare https://github.com/jshapiro26/dotfiles.git $HOME/.dotfiles

# move existing dotfiles that would be overwritten
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}

# pull down the dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# install brew and brew packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --global

# install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
export rvm_ignore_dotfiles=yes
\curl -sSL https://get.rvm.io | sudo bash -s stable --rails 

# install latest gpgsuite
LATEST_GPG_DMG=$(curl -s https://gpgtools.org/ | grep dmg | head -n1 | awk '{print $2}' | cut -d= -f2)
wget -O ${HOME}/Downloads/gpgsuite.dmg $LATEST_GPG_DMG
hdiutil attach ${HOME}/Downloads/gpgsuite.dmg
sudo installer -pkg /Volumes/GPG\ Suite/Install.pkg -target /
hdiutil detach /Volumes/GPG\ Suite/
echo ""
echo "Restore backup of ~/.gnupg manually"

# install visual studio code
wget -O ${HOME}/Downloads/vscode.zip https://go.microsoft.com/fwlink/?LinkID=620882
unzip ${HOME}/Downloads/vscode.zip
sudo cp ${HOME}/Downloads/Visual\ Studio\ Code.app /Applications/

# install iterm2
wget -O ${HOME}/Downloads/iterm2.zip https://iterm2.com/downloads/stable/iTerm2-3_1_5.zip
unzip ${HOME}/Downloads/iterm2.zip
sudo cp ${HOME}/Downloads/iTerm.app /Applications/

# install docker
wget -O ${HOME}/Downloads/docker.dmg https://download.docker.com/mac/stable/Docker.dmg
hdiutil attach ${HOME}/Downloads/docker.dmg
sudo cp /Volumes/Docker/Docker.app -target /
hdiutil detach /Volumes/Docker/
