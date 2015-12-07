################################################################################
# update
################################################################################
brew update

################################################################################
# for dev tool chain and some basic libs.
################################################################################

# for tool chain
brew install autoconf autojump automake cmake gdbm gettext glib gmp gnutls

# for some libs
brew install libevent libffi libgpg-error libksba libtasn1 libtool libyaml pkg-config readline
brew install libxml2 libxslt

brew install libuv

################################################################################
# for system
################################################################################

# for system tools
brew install nmap wget curl tree
brew install openssl
brew install synergy
brew install dos2uinx
brew install lrzsz

# for compress
brew install xz
brew install p7zip

# for terminal
brew install zsh
brew install tmux

# for system monitor
brew install watch
brew install htop-osx
brew install ifstat

# for python, python has to be installed before vim.
brew install python python3 jython
brew install pyenv

# for editor
brew install vim macvim
brew install emacs

brew tap neovim/neovim
brew install --HEAD neovim

# for brew cast
brew install brew-cask

# for multimedia
brew install jpeg jpegoptim

# for notice
brew install terminal-notifier

################################################################################
# for devel
################################################################################

# general devel tools
brew install ctags cscope

# for vcs
brew install mercurial git tig

# for database
brew install redis mongodb mysql sqlite
brew install mycli
# brew install pgcli

# for java (install jdk from Oracle is suggested.)
brew install maven
brew install gradle

# for scala
brew install sbt

# for nodejs
brew install nvm
brew install nodejs
brew install watchman
brew install flow

# for editer
brew cask install macdown

################################################################################
# for bigdata
################################################################################
brew install hadoop
brew install zookeeper
brew install akka
brew install kafka

################################################################################
# for virtual machine
################################################################################

# for virtualbox
brew cask install virtualbox 
brew cask install vagrant --force
brew cask install veewee

# for qemu
brew install qemu
