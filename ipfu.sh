################################################################################
# update the orgin packages
################################################################################
apt-get update
apt-get upgrade --yes

################################################################################
# for system management
################################################################################
apt-get install --yes zerofree
apt-get install --yes tmux
apt-get install --yes curl traceroute
apt-get install --yes ifstat nethogs htop iptraf
apt-get install --yes sysstat nicstat pstack
apt-get install --yes p7zip-rar

################################################################################
# for bisic libs
################################################################################
apt-get install --yes libreadline-dev libbz2-dev
apt-get install --yes libxml2-dev libxslt-dev
apt-get install --yes icu-devtools libicu-dev zlib1g-dev
apt-get install --yes openssl libssl-dev

################################################################################
# for numerical 
################################################################################
apt-get install --yes libatlas libatlas-dev libatlas-base-dev
apt-get install --yes libgsl-dev

################################################################################
# setup devel environment
################################################################################
# ATTENTION: ubuntu 16.04 uses python3, which may cause vim configuration
# compatibility error, use vim-nox-py2 instead if vim-gnome is not working.
# apt-get install --yes vim-gnome ctags cscope global ack-grep
apt-get install --yes vim-nox-py2 ctags cscope global ack-grep
apt-get install --yes git tig gitolite mercurial subversion

apt-get install --yes automake autotools-dev autoconf libtool build-essential
apt-get install --yes clang libclang-dev cmake cmake-data cmake-doc
apt-get install --yes linux-headers-`uname -r` dkms     # for kernel related.

apt-get install --yes valgrind kcachegrind oprofile linux-tools  # for profiler.

# for web
apt-get install --yes nginx

# for better shell ops
apt-get install --yes zsh zsh-common zsh-dev zsh-doc
apt-get install --yes autojump
apt-get install --yes powerline
apt-get install --yes xclip

# for some lib
apt-get install --yes libyaml-dev
apt-get install --yes libargtable2-dev  # for gnu arg parse
apt-get install --yes libpcap-dev tcpdump libdnet-dev

# python pillow will need them for png/jpeg/... support
apt-get install --yes libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev

# for python2
apt-get install --yes python-dev # ipython python-numpy python-scipy python-matplotlib
apt-get install --yes python-pip
apt-get install --yes python-virtualenv
apt-get install --yes pylint
apt-get install --yes python-sphinx
apt-get install --yes python-django
apt-get install --yes python-flask
apt-get install --yes vim-python

# for python3
apt-get install --yes python3-dev ipython3 python3-pip

# for python-recsys
# apt-get install --yes csc-pysparse
# apt-get install --yes python-scikits-learn python-scikits.statsmodels
# apt-get install --yes python-boto

# for python editor eric
# apt-get install --yes eric

# install oracle java 8, which would need confirmation.
apt-get purge openjdk*   # just in case
apt-get install --yes software-properties-common
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install --yes oracle-java8-installer
apt-get install --yes maven

# for sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update
apt-get install --yes sbt

# for scala
SCALA_VERSION=2.11.8
wget www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb -O /tmp/scala-${SCALA_VERSION}.deb
dpkg -i /tmp/scala-${SCALA_VERSION}.deb
rm /tmp/scala-${SCALA_VERSION}.deb

# for neovim
# add-apt-repository ppa:neovim-ppa/unstable
# apt-get update
# apt-get install --yes neovim

# for database, a password is required for mysql-server during the installation.
# so we should keep the installation at the end of all.
apt-get install --yes memcached libmemcached-dev redis-server
apt-get install --yes sqlite3 libsqlite3-dev
# apt-get install --yes postgresql mysql-client libmysqlclient-dev mysql-server

# for javascript
apt-get install --yes nodejs nodejs-dev

# for rust
curl -sSf https://static.rust-lang.org/rustup.sh | sh
# this may need some interaction with the terminal: 
#     /usr/local/lib/rustlib/uninstall.sh
#     curl https://sh.rustup.rs -sSf | sh
cargo install racer
cargo install rustfmt
cargo install bindgen

# for ruby, a better way pls refer to: https://github.com/rvm/rvm
apt-get install --yes ruby ruby-dev bundler
