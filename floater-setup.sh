#!/bin/bash

# supress password prompts
#sudo -v

# supress the neeed to press 'return'. alternately redirect > /dev/null
#yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew taps
#brew tap caskroom/cask
#brew tap caskroom/versions
#brew tap caskroom/fonts

# cask
#brew install brew-cask

brew tap homebrew/services

brew install wget
brew install ag
brew install jq
brew install git
brew install lastpass-cli

brew install direnv
echo 'eval "$(direnv hook bash)"' >> ~/.bash_profile

brew install go@1.7
echo 'export PATH="$PATH:/usr/local/opt/go@1.7/libexec/bin"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/go@1.7/bin:$PATH"' >> ~/.bash_profile

brew install ruby-install
ruby-install ruby 2.3.1
echo "ruby-2.3.1" ~/.ruby-version

brew install chruby
echo "source /usr/local/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source /usr/local/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile

source ~/.bash_profile

brew cask install flux
brew cask install shiftit
brew cask install google-chrome
brew cask install iterm2
brew cask install sublime-text
#brew cask install intellij-idea
brew cask install rubymine
brew cask install gogland
brew cask install sourcetree
brew cask install slack

mkdir ~/workspace
cd ~/workspace

# need to load ssh key to ssh-agent before cloning
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
git clone git@github.com:cloudfoundry/bosh.git

# postgres
brew install postgresql
brew services start postgresql
createuser -U $USER --superuser postgres
createdb -U $USER

# mysql
brew install mysql
#brew services start mysql

cd bosh/src
gem install bundler
bundler install
bundle exec rake spec:integration:install_dependencies

# TODO: add alias for bstale and bkill

#### TEMP
brew cask install docker
