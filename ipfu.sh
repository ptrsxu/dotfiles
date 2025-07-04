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
apt-get install --yes ca-certificates gnupg2 lsof git   # CA & tools
apt-get install --yes apt-transport-https autojump      # minimal tools
apt-get install --yes curl wget htop nethogs telnet     # minimal tools
apt-get install --yes zip unzip p7zip-rar p7zip-full    # minimal tools
apt-get install --yes hwinfo hardinfo jq debian-archive-keyring
apt-get install --yes net-tools util-linux coreutils    # ifconfig, lscpu, nproc etc.
apt-get install --yes bash-completion
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

apt-get install --yes w3m tidy      # command line tools for transferring data with URLs
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

# for bash
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

# install JetBrains Mono Nerd Fonts
# check <https://www.jetbrains.com/lp/mono/#how-to-install> 
# and <https://github.com/JetBrains/JetBrainsMono>
# for details
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# for node v22
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=22
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install --yes nodejs


# install oracle jdk 21
apt-get purge openjdk*
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb \
    && dpkg -i jdk-21_linux-x64_bin.deb \
    && rm jdk-21_linux-x64_bin.deb

# lua for some neovim plugins
apt-get install luarocks luajit libluabind-dev liblua5.1-dev --yes

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
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install sccache
source "$HOME/.cargo/env" && cargo install sccache
# install nightly
rustup toolchain add nightly
rustup default nightly
# curl -sSf https://static.rust-lang.org/rustup.sh | sh
# this may need some interaction with the terminal: 
#     /usr/local/lib/rustlib/uninstall.sh
#     curl https://sh.rustup.rs -sSf | sh
# cargo install cargo-generate ripgrep rustfmt cargo-udeps bindgen cargo-edit cargo-graph cargo-count cargo-outdated cargo-web cargo-tree cargo-tally cargo-watch typos-cli git-cliff cargo-sls-distribution
# cargo install cargo-deny cargo-nextest --locked
# # For compiling to asmjs through Emscripten: rustup target add asmjs-unknown-emscripten
# # For compiling to WebAssembly through Emscripten: rustup target add wasm32-unknown-emscripten
# # For compiling to WebAssembly through Rust's native backend: rustup target add wasm32-unknown-unknown
# cargo install diesel_cli --no-default-features --features "postgres sqlite mysql"
#
# # For watch src and rerun with clear screen: `cargo watch -c -w src -x run`
# cargo generate git@github.com:ptrsxu/template.rs.git
# pip install pre-commit
# pre-commit install
tee -a ~/.cargo/config.toml > /dev/null << EOF
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[build]
target-dir ="/tmp/targets.rs"
rustc-wrapper = ".cargo/bin/sccache"
[net]
git-fetch-with-cli = true
EOF

# select the best source. refer to <https://github.com/wtklbm/crm> and
# <https://bytedance.larkoffice.com/docx/Fa6vdnOgQoTDLcxGjwAcU0qdnCf> for details
cargo install crm
crm best sparse-download


# for bazel
brew install bazelisk

# for golang
brew install golang

# in china
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct


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

# install zellij (only on linux, download the binary for mac manually)
wget https://github.com/zellij-org/zellij/releases/latest/download/zellij-$(arch)-unknown-linux-musl.tar.gz
tar xvzf zellij-$(arch)-unknown-linux-musl.tar.gz
chmod +x zellij
sudo mv zellij /usr/local/bin

tee -a ~/.config/zellij/config.kdl >/dev/null <<EOF
theme "catppuccin-frappe"
EOF

######<<< NOTICE: USE ZELLIJ INSTEAD OF TMUX >>>
######<<< # install and setup tmux, refer to <https://github.com/tmux-plugins/tpm>
######<<< sudo snap install tmux --classic
######<<< # ANOTHER CHOICE IS
######<<< # brew install tmux
######<<< git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
######<<< curl -L https://raw.githubusercontent.com/ptrsxu/dotfiles/master/tmux.conf -o ~/.tmux.conf
# run `tmux` and `tmux source ~/.tmux.conf` and run `<leader> I` to install the plugins
######<<< NOTICE: USE ZELLIJ INSTEAD OF TMUX >>>

# for bash
echo 'export TERM=xterm-256color' >> ~/.bashrc
# for zsh
# echo 'export TERM=xterm-256color' >> ~/.zshrc

# install starship
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
echo 'eval "$(starship init bash)"' >> ~/.bashrc
# for zsh
# eval "$(starship init zsh)"
# echo 'eval "$(starship init zsh)"' >> ~/.zshrc
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# modify ~/.config/starship.toml,
# 
# CHANGE username.format to remove the space after "$user" in format
#
# [username]
# show_always = true
# style_user = "bg:color_orange fg:color_fg0"
# style_root = "bg:color_orange fg:color_fg0"
# format = '[ $user]($style)'
# 
# ADD @hostname
# 
# #ORIGIN# $username\
# [@](bg:color_orange fg:color_fg0)\
# $hostname\
# #ORIGIN# [](bg:color_yellow fg:color_orange)\
#
# AND
#
# [hostname]
# ssh_only = false
# style = "bg:color_orange fg:color_fg0"
# ssh_symbol = '🌐'
# format = '[$hostname$ssh_symbol]($style)'
#
# for hostname configure

# install helix editor (for linux only. download the benary for mac manually)
HELIX_LATEST_RELEASE=$(curl -s https://api.github.com/repos/helix-editor/helix/releases/latest | jq -r '.tag_name')
curl -LsSf https://github.com/helix-editor/helix/releases/download/${HELIX_LATEST_RELEASE}/helix-${HELIX_LATEST_RELEASE}-$(arch)-linux.tar.xz | tar -xJv
sudo mv helix-${HELIX_LATEST_RELEASE}-$(arch)-linux/hx /usr/local/bin
mv helix-${HELIX_LATEST_RELEASE}-$(arch)-linux ~/.local/helix

tee -a ~/.config/helix/config.toml >/dev/null <<EOF
theme = "catppuccin_macchiato"

[editor]
true-color = true
mouse = false

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "underline"

[editor.file-picker]
hidden = false

[editor.lsp]
display-inlay-hints = true

[editor.soft-wrap]
enable = true
max-wrap = 3
EOF

# for mac:
# xattr -d com.apple.quarantine ~/.config/helix/runtime/grammars/*

######<<< NOTICE: USE HELIX INSTEAD OF NEOVIM >>>
######<<< #######################
######<<< # install neovim on mac
######<<< # run: `brew install lua luarocks luajit`
######<<< # run: `brew install neovim`
######<<< # install neovim on Linux aarch64(arm64), compiling from source
######<<< # run: `sudo apt-get install --yes libcurl4-openssl-dev`
######<<< # run: `sudo ln -s /usr/include/aarch64-linux-gnu/curl /usr/include/curl`
######<<< # run: `sudo apt-get install --yes liblua5.1-0-dev`
######<<< # run: `sudo apt-get install ninja-build gettext cmake unzip curl build-essential`
######<<< # run: `git clone https://github.com/neovim/neovim --recurse-submodules`
######<<< # run: `make CMAKE_BUILD_TYPE=Release`
######<<< # run: `sudo make install`
######<<< 
######<<< # install neovim on Linux x86_64(amd64)
######<<< sudo apt-get install libcurl4-openssl-dev --yes
######<<< sudo ln -s /usr/include/x86_64-linux-gnu/curl/ /usr/include/curl
######<<< wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
######<<< tar xvzf nvim-linux64.tar.gz
######<<< sudo mv nvim-linux64 /usr/local/
######<<< sudo ln -s /usr/local/nvim-linux64/bin/nvim  /usr/local/bin/nvim
######<<< rm -rf nvim-linux64.tar.gz
######<<< # OR JUST INSTALL WITH
######<<< # sudo snap install nvim --classic

######<<< # install NvChad, refer to <https://nvchad.com/docs/quickstart/install>
######<<< rm -rf ~/.local/share/{lunarvim,nvim} ~/.config/nvim
######<<< git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 -b v2.0
######<<< NVCHAD_EXAMPLE_CONFIG=y nvim --headless "+q"
######<<< #
######<<< # THEN REPLACE `~/.config/nvim/lua/custom` with `custom/`
######<<< #
######<<< # check with `:TSModuleInfo`, `:LspInfo`, `:Mason`
######<<< # update with `:NvChadUpdate`, `:TSUpdate`, `:MasonUpdate`, `:checkhealth rustaceanvim` (using rustaceanvim instead of rust-tools)

######<<< # for rest.nvim plugin
######<<< # rest.nvim relies on luarocks, run below cmd if luarocks is not auto built:
######<<< # :Lazy build luarocks.nvim
######<<< # :RocksInstall lua-curl nvim-nio mimetypes xml2lua
######<<< #
######<<< # modify `~/.local/share/nvim/lazy/rest.nvim/lua/rest-nvim/utils.lua`
######<<< # regtype="c" to regtype="V" if there is a regtype error.

######<<< # nvim configure can also be installed with v2.5 version, just run:
######<<< # `git clone https://github.com/ptrsxu/nvim ~/.config/nvim -b inuse`
######<<< # start nvim, wait for the installation and run `:MasonInstallAll` 
######<<< #######################
######<<< NOTICE: USE HELIX INSTEAD OF NEOVIM >>>

# install uv & ruff
# NOTICE THAT THIS WOULD `mkdir -p ~/.local/bin`
curl -LsSf https://astral.sh/uv/install.sh | sh -s
curl -LsSf https://astral.sh/ruff/install.sh | sh

tee -a ~/.config/uv/uv.toml > /dev/null <<EOF
python-install-mirror = "https://ghproxy.cn/https://github.com/indygreg/python-build-standalone/releases/download"

[[index]]
url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/"
default = true
EOF

cat ~/.config/uv/uv.toml

uv python install 3.13
uv python pin --global 3.13
uv python list

######<<< NOTICE: USE UV INSTEAD OF CONDA / MINICONDA >>>
######<<< # install miniconda3 latest version on linux
######<<< # compatible for both x86_64 arch and aarch64 arch
######<<< wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(arch).sh -O /tmp/miniconda.sh
######<<< sudo bash /tmp/miniconda.sh -b -u -p /opt/miniconda3
######<<< rm -rf /tmp/miniconda.sh
######<<< # install init script for bash user
######<<< /opt/miniconda3/bin/conda init bash

######<<< tee -a ~/.condarc > /dev/null << EOF
######<<< channels:
######<<<   - defaults
######<<< pkgs_dirs:
######<<<   - /data/disk1/conda/pkgs
######<<< envs_dirs:
######<<<   - /data/disk1/conda/envs
######<<< EOF
######<<< sudo useradd -d /data/disk1/labs/conda -s /usr/sbin/nologin conda
######<<< sudo mkdir -p /data/disk1/conda/{envs,pkgs}
######<<< sudo chown -R conda:conda /data/disk1/conda
######<<< sudo chown -R conda:conda /opt/conda
######<<< sudo chmod -R g+w /data/disk1/conda
######<<< sudo chmod -R g+w /opt/miniconda3
######<<< sudo usermod -aG conda ${USER}                      # needs to re-login
######<<< sudo mkdir -p /data/disk1/${USER}
######<<< sudo chown -R ${USER} /data/disk1/${USER}
######<<< NOTICE: USE UV INSTEAD OF CONDA / MINICONDA >>>


# xh, for http requests
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh

# kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# themes for kitty
kitten themes

# fzf, useful tools, supporting things like `kill -9 **<tab><tab>`
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# zoxide, z, install this after fzf
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
eval "$(zoxide init bash)"
# eval "$(zoxide init zsh)"
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
# echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
# import from autojump if there is any history
# on linux
# zoxide import --from=autojump $HOME/.local/share/autojump/autojump.txt
# on mac
# zoxide import --from=autojump $HOME/Library/autojump/autojump.txt

# atuin
bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
source $HOME/.atuin/bin/env
# eval "$(atuin init zsh)"
eval "$(atuin init bash)"
atuin import auto   # use it locally. or refer to
# <https://github.com/atuinsh/atuin/blob/main/docs/zh-CN/server.md>
# for multi-device sync


