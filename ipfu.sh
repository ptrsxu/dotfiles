################################################################################
# update the orgin packages
################################################################################
apt-get update
apt-get upgrade --yes

################################################################################
# for basic settings
################################################################################
timedatectl set-timezone Asia/Shanghai
locale-gen zh_CN.UTF-8
update-locale LANG=zh_CN.UTF-8 LC_MESSAGES=POSIX
unlink /bin/sh
ln -s /bin/bash /bin/sh

################################################################################
# for system management
################################################################################
apt-get install --yes apt-file
apt-get install --yes zerofree
apt-get install --yes tmux
apt-get install --yes dos2unix
apt-get install --yes expect
apt-get install --yes curl
apt-get install --yes traceroute
apt-get install --yes ifstat
apt-get install --yes nethogs
apt-get install --yes htop
apt-get install --yes nmon
apt-get install --yes iptraf
apt-get install --yes nmap
apt-get install --yes sysstat
apt-get install --yes nicstat
apt-get install --yes pstack
apt-get install --yes p7zip-rar
apt-get install --yes p7zip-full
apt-get install --yes pkg-config
apt-get install --yes proxychains
apt-get install --yes rlwrap
apt-get install --yes supervisor

################################################################################
# for bisic libs
################################################################################
apt-get install --yes libreadline-dev
apt-get install --yes libbz2-dev
apt-get install --yes liblzma-dev
apt-get install --yes libncurses-dev
apt-get install --yes libncursesw5-dev
apt-get install --yes libxml2-dev
apt-get install --yes libxslt-dev
apt-get install --yes icu-devtools
apt-get install --yes libicu-dev
apt-get install --yes zlib1g-dev
apt-get install --yes openssl
apt-get install --yes libssl-dev

################################################################################
# for cgroups
################################################################################
apt-get install --yes cgroup-bin
apt-get install --yes cgroup-lite
apt-get install --yes cgroup-tools
apt-get install --yes cgroupfs-mount
apt-get install --yes libcgroup1

################################################################################
# for numerical 
################################################################################
apt-get install --yes libatlas-dev
apt-get install --yes libatlas-base-dev
apt-get install --yes libatlas3-base
apt-get install --yes libgsl-dev

################################################################################
# setup devel environment
################################################################################
# ATTENTION: ubuntu 16.04 uses python3, which may cause vim configuration
# compatibility error, use vim-nox-py2 instead if vim-gnome is not working.
# apt-get install --yes vim-gnome ctags cscope global ack-grep
apt-get install --yes vim-nox-py2
apt-get install --yes ctags
apt-get install --yes cscope
apt-get install --yes global
apt-get install --yes ack-grep
apt-get install --yes tig
apt-get install --yes git
apt-get install --yes gitolite3
apt-get install --yes mercurial
apt-get install --yes subversion

apt-get install --yes automake
apt-get install --yes autotools-dev
apt-get install --yes autoconf
apt-get install --yes libtool
apt-get install --yes build-essential
apt-get install --yes clang
apt-get install --yes libclang-dev
apt-get install --yes cmake
apt-get install --yes cmake-data
apt-get install --yes cmake-doc
apt-get install --yes linux-headers-`uname -r` dkms     # for kernel related.

apt-get install --yes libx11-dev
apt-get install --yes libxtst-dev
apt-get install --yes libxrandr-dev
apt-get install --yes libxi-dev
apt-get install --yes mesa-common-dev
apt-get install --yes libglu1-mesa-dev

apt-get install --yes valgrind
apt-get install --yes kcachegrind
apt-get install --yes oprofile
apt-get install --yes linux-tools  # for profiler.

# for entertainment
apt-get install --yes ffmpeg

# for web
apt-get install --yes nginx
apt-get install --yes w3m

# for better shell ops
apt-get install --yes zsh
apt-get install --yes zsh-common
apt-get install --yes zsh-dev
apt-get install --yes zsh-doc
apt-get install --yes autojump
apt-get install --yes powerline
apt-get install --yes xclip
apt-get install --yes graphviz

# for some lib
apt-get install --yes libyaml-dev
apt-get install --yes libargtable2-dev  # for gnu arg parse
apt-get install --yes libpcap-dev
apt-get install --yes tcpdump
apt-get install --yes libdnet-dev
apt-get install --yes capnproto

# python pillow will need them for png/jpeg/... support
apt-get install --yes libjpeg-dev
apt-get install --yes libfreetype6
apt-get install --yes libfreetype6-dev
apt-get install --yes zlib1g-dev

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
apt-get install --yes python3-dev
apt-get install --yes ipython3
apt-get install --yes python3-pip

# for python-recsys
# apt-get install --yes csc-pysparse
# apt-get install --yes python-scikits-learn python-scikits.statsmodels
# apt-get install --yes python-boto

# for python editor eric
# apt-get install --yes eric

# for neovim
# add-apt-repository ppa:neovim-ppa/unstable
# apt-get update
# apt-get install --yes neovim

# for database, a password is required for mysql-server during the installation.
# so we should keep the installation at the end of all.
apt-get install --yes memcached
apt-get install --yes libmemcached-dev
apt-get install --yes redis-server
apt-get install --yes sqlite3
apt-get install --yes libsqlite3-dev
# apt-get install --yes postgresql libpq-dev mysql-client libmysqlclient-dev mysql-server

# for javascript
apt-get install --yes nodejs
apt-get install --yes nodejs-dev

# # for rust
# curl -sSf https://static.rust-lang.org/rustup.sh | sh
# this may need some interaction with the terminal: 
#     /usr/local/lib/rustlib/uninstall.sh
#     curl https://sh.rustup.rs -sSf | sh
# cargo install racer
# cargo install rustfmt
# cargo install bindgen
# cargo install cargo-edit
# cargo install cargo-graph
# cargo install cargo-count
# cargo install cargo-outdated
# cargo install cargo-web
# cargo install cargo-tree
# # For compiling to asmjs through Emscripten: rustup target add asmjs-unknown-emscripten
# # For compiling to WebAssembly through Emscripten: rustup target add wasm32-unknown-emscripten
# # For compiling to WebAssembly through Rust's native backend: rustup target add wasm32-unknown-unknown
# cargo install diesel_cli --no-default-features --features "postgres sqlite mysql"

# for ruby, a better way pls refer to: https://github.com/rvm/rvm
apt-get install --yes ruby
apt-get install --yes ruby-dev
apt-get install --yes bundler

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
SCALA_VERSION=2.12.1
wget www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb -O /tmp/scala-${SCALA_VERSION}.deb
dpkg -i /tmp/scala-${SCALA_VERSION}.deb
rm /tmp/scala-${SCALA_VERSION}.deb

# for cpp
apt-get install --yes swig
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
apt-get update && apt-get install --yes bazel

# you may need to monitor your system by sending some email.
# this is the easiest way.
apt-get install --yes mailutils
