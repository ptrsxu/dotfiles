################################################################################
# for 22.04 by Peter Xu at 2023
# 
# a few package management commands:
# - `dpkg -i packagename.deb` install a package
# - `dpkg -L packagename` list package file details
# - `apt-cache depends packagename` list package dependencies
# - `apt-cache rdepends packagename` list package reverse dependencies
#
# Notice: this script is not for Dockerfile as the steps are splitted for
#         locating potential bugs. A Dockerfile should be more compact.
#
################################################################################
apt-get update
apt-get upgrade --yes


################################################################################
# for basic settings
################################################################################
# timedatectl set-timezone Asia/Shanghai
timedatectl set-timezone UTC                            # keep using UTC or GMT
apt-get install --yes language-pack-zh-hans language-pack-en
locale-gen zh_CN.UTF-8
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX
unlink /bin/sh
ln -s /bin/bash /bin/sh

apt-get install --yes apt-file pkg-config lsb-release   # search for files within deb packages
apt-get install --yes dbus-user-session uidmap acl      # package configuration tool
apt-get install --yes fontconfig libfontconfig-dev      # dealing with fonts
apt-get install --yes ca-certificates gnupg lsof git    # CA & tools
apt-get install --yes apt-transport-https autojump      # minimal tools
apt-get isntall --yes curl wget htop nethogs telnet     # minimal tools
apt-get install --yes zip unzip p7zip-rar p7zip-full    # minimal tools
apt-get install --yes hwinfo hardinfo
apt-get install --yes net-tools util-linux coreutils    # ifconfig, lscpu, nproc etc.
#
# echo "source /usr/share/autojump/autojump.bash" >> ~/.profile
# hostnamectl set-hostname sub.domain.com


################################################################################
# for bisic libs
################################################################################
apt-get install --yes libbz2-dev        # compression library
apt-get install --yes liblzma-dev       # XZ-format compression library
apt-get install --yes zlib1g-dev        # compression library

apt-get install --yes libncurses5-dev   # shared libraries for terminal handling
apt-get install --yes libreadline-dev   # GNU readline and history libraries, run-time libraries
apt-get install --yes libyaml-dev       # a YAML parser and emitter in C++
apt-get install --yes libxml2-dev       # an XML C parser and toolkit
apt-get install --yes libxslt-dev       # an XML language to define transformation for XML

apt-get install --yes openssl           
apt-get install --yes libssl-dev        # TLS protocol implementations
apt-get install --yes libnss3-dev       # Network Security Service libraries
apt-get install --yes libgdbm-dev       # a set of database routines
apt-get install --yes libffi-dev        # A portable foreign-function interface library.
apt-get install --yes libfftw3-dev      # Computes FFT in one or more dimensions
apt-get install --yes liblapacke64-dev  # Library of linear algebra routines

apt-get install --yes icu-devtools      # full-featured Unicode and locale support
apt-get install --yes libicu-dev        # full-featured Unicode and locale support


################################################################################
# for cgroups
################################################################################
apt-get install --yes cgroup-bin
apt-get install --yes cgroup-lite
apt-get install --yes cgroup-tools
apt-get install --yes cgroupfs-mount


################################################################################
# for system management
################################################################################
apt-get install --yes zerofree      # zero free blocks from ext2, ext3 and ext4 file-systems
# apt-get install --yes tmux        # terminal multiplexer. latest version provided in homebrew
apt-get install --yes dos2unix      # convert text file from dos to unix
apt-get install --yes expect        # program that can automate interactive applications
apt-get install --yes tree          # display directories as trees
apt-get install --yes rlwrap        # readline feature command line wrapper
apt-get install --yes supervisor    # daemon process supervising

apt-get install --yes nmon          # performance monitoring tool
apt-get install --yes sysstat       # system performance tools for Linux(iostat/mpstat/sar)
apt-get install --yes pstack        # display stack trace of a running process
apt-get install --yes oprofile      # system-wide profiler for Linux systems

apt-get install --yes w3m           # command line tools for transferring data with URLs
apt-get install --yes traceroute    # network diagnostic commands with ICMP packets
apt-get install --yes ifstat        # InterFace STATistics Monitoring
apt-get install --yes nmap          # network exploration tool and security / port scanner
apt-get install --yes nicstat       # print network traffic statistics
apt-get install --yes proxychains4  # proxy chains - redirect connections through proxy servers
apt-get install --yes tcpdump

# apt-get install --yes ctop        # ctop not work on 22.04, use `quay.io/vektorlab/ctop` docker image instead


# for dealing with video
# apt-get install --yes ffmpeg

# for dealing with image
# python pillow will need them for png/jpeg/... support
apt-get install --yes libjpeg-dev
apt-get install --yes libfreetype6-dev
apt-get install --yes libfreeimage-dev


################################################################################
# for numerical 
################################################################################
# Using ATLAS
apt-get install --yes libatlas-dev
apt-get install --yes libatlas-base-dev
apt-get install --yes libatlas3-base
apt-get install --yes libgsl-dev
apt-get install --yes libatlas3gf-base
# Using OpenBLAS
# apt-get install --yes libopenblas-dev
# Using OpenGL
apt-get install --yes libglfw3-dev


################################################################################
# for basic language support
################################################################################
# for python3 and setup python to python3
apt-get install --yes python3 python3-pip python3-dev python3-venv
# 3.10 default for ubuntu 22.04
update-alternatives --install /usr/bin/python python /usr/bin/python3 10


################################################################################
# setup devel environment
################################################################################

# buld tools
apt-get install --yes automake          # depends autoconf, autotools-dev
apt-get install --yes libtool
apt-get install --yes build-essential   # depends gcc, g++, dpkg-dev
apt-get install --yes clang libclang-dev
apt-get install --yes cmake cmake-curses-gui
apt-get install --yes linux-headers-`uname -r` dkms     # for kernel related.
# NOTICE:
# the `ubuntu-dev-tools` will install a lot of packages besides above.
# apt-get install --yes ubuntu-dev-tools

# for X
apt-get install --yes libxtst-dev       # depends libx11-dev, libxi-dev, 
apt-get install --yes libxrandr-dev
apt-get install --yes mesa-common-dev
apt-get install --yes libglu1-mesa-dev

# for entertainment
# apt-get install --yes ffmpeg

# for web
# apt-get install --yes nginx

# for better shell ops
apt-get install --yes zsh zsh-dev
apt-get install --yes autojump powerline xclip

# for some lib
apt-get install --yes libargtable2-dev  # for gnu arg parse
apt-get install --yes libpcap-dev
apt-get install --yes libdnet-dev
apt-get install --yes capnproto


# for database, a password is required for mysql-server during the installation.
# so we should keep the installation at the end of all.
apt-get install --yes sqlite3 libsqlite3-dev
# apt-get install --yes memcached
# apt-get install --yes libmemcached-dev
# apt-get install --yes redis-server
# apt-get install --yes postgresql libpq-dev mysql-client libmysqlclient-dev mysql-server


# you may need to monitor your system by sending some email.
# this is the easiest way.
apt-get install --yes mailutils


# install JetBrains Mono Nerd Fonts
# check <https://www.jetbrains.com/lp/mono/#how-to-install> 
# and <https://github.com/JetBrains/JetBrainsMono>
# for details
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# for node v20
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install --yes nodejs


# install oracle jdk 21
apt-get purge openjdk*
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb \
    && dpkg -i jdk-21_linux-x64_bin.deb \
    && rm jdk-21_linux-x64_bin.deb

# lua for some neovim plugins
apt-get install luarocks luajit libluabind-dev

################################################################################
# switch to a non-root user from here.
################################################################################
# install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# install oh-my-zsh
# change the theme to dst in ~/.zshrc: ZSH_THEME="dst"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# use homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
# for zsh
# (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zshrc


# for rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
# curl -sSf https://static.rust-lang.org/rustup.sh | sh
# this may need some interaction with the terminal: 
#     /usr/local/lib/rustlib/uninstall.sh
#     curl https://sh.rustup.rs -sSf | sh
# cargo install rustfmt
# cargo install bindgen
# cargo install cargo-edit
# cargo install cargo-graph
# cargo install cargo-count
# cargo install cargo-outdated
# cargo install cargo-web
# cargo install cargo-tree
# cargo install cargo-tally
# cargo install cargo-sls-distribution
# # For compiling to asmjs through Emscripten: rustup target add asmjs-unknown-emscripten
# # For compiling to WebAssembly through Emscripten: rustup target add wasm32-unknown-emscripten
# # For compiling to WebAssembly through Rust's native backend: rustup target add wasm32-unknown-unknown
# cargo install diesel_cli --no-default-features --features "postgres sqlite mysql"


# for bazel
brew install bazelisk


# for node version management(not the system level node)
brew install nvm
tee -a ~/.profile > /dev/null << EOF
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
EOF
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm install --lts


# install bb
brew install borkdude/brew/babashka


# install and setup tmux, refer to <https://github.com/tmux-plugins/tpm>
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -L https://raw.githubusercontent.com/ptrsxu/dotfiles/master/tmux.conf -o ~/.tmux.conf
# run `tmux` and `tmux source ~/.tmux.conf` and run `<leader> I` to install the plugins


# install starship
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
echo 'eval "$(starship init bash)"' >> ~/.bashrc
# for zsh
# eval "$(starship init zsh)"
# echo 'eval "$(starship init zsh)"' >> ~/.zshrc
starship preset gruvbox-rainbow -o ~/.config/starship.toml



# brew install lua luarocks luajit
# or apt install liblua5.1-0-dev

# neovim ppa is not officially maintained, install neovim with brew
brew install neovim
# install NvChad, refer to <https://nvchad.com/docs/quickstart/install>
rm -rf ~/.local/share/{lunarvim,nvim} ~/.config/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 -b v2.0
NVCHAD_EXAMPLE_CONFIG=y nvim --headless "+q"
#
# THEN REPLACE `~/.config/nvim/lua/custom` with `custom/`
#
# check with `:TSModuleInfo`, `:LspInfo`, `:Mason`
# update with `:NvChadUpdate`, `:TSUpdate`, `:MasonUpdate`, `:checkhealth rustaceanvim` (using rustaceanvim instead of rust-tools)

# rest.nvim relies on luarocks, run below cmd if luarocks is not auto built:
# :Lazy build luarocks.nvim

# nvim configure can also be installed with v2.5 version, just run:
# `git clone https://github.com/ptrsxu/nvim ~/.config/nvim -b inuse`
# start nvim, wait for the installation and run `:MasonInstallAll` 


# install conda
#
# NOTICE: this is not available on "ARM LINUX"(uname -m: aarch64)
# run `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh`
# to get the latest aarch64 bin version, and install it manually.
#
# Install our public GPG key to trusted store and check if fingerprint is correct.
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
sudo install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806
# Add our Debian repo
sudo tee -a /etc/apt/sources.list.d/conda.list > /dev/null << EOF
deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main
EOF
# or
# echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" | sudo tee -a /etc/apt/sources.list.d/conda.list
sudo apt-get update
sudo apt-get install --yes conda
sudo tee -a /opt/conda/.condarc > /dev/null << EOF
channels:
  - defaults
pkgs_dirs:
  - /data/disk1/conda/pkgs
envs_dirs:
  - /data/disk1/conda/envs
EOF
sudo useradd -d /data/disk1/labs/conda -s /usr/sbin/nologin conda
sudo mkdir -p /data/disk1/conda/{envs,pkgs}
sudo chown -R conda:conda /data/disk1/conda
sudo chown -R conda:conda /opt/conda
sudo chmod -R g+w /data/disk1/conda
sudo chmod -R g+w /opt/conda
sudo usermod -aG conda ${USER}                      # needs to re-login
source /opt/conda/etc/profile.d/conda.sh
echo "source /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
# fro zsh
# echo "source /opt/conda/etc/profile.d/conda.sh" >> ~/.zshrc

sudo mkdir -p /data/disk1/${USER}
sudo chown -R ${USER} /data/disk1/${USER}
