#!/bin/bash - 
#=============================================================================
#     FileName: dotfiles.sh
#         Desc: install the dot files.
#               
#               1. If we have environment variables to export, we need to put
#                  them in common/userenv.sh, the shell related environment
#                  variables can be put in related shell menu.
#               2. We use symbolic links to for the "user related" configurations.
#               3. Most tools can be installed both by package manager and some
#                  other tool(for exmaple, Django can be installed by apt-get
#                  and pip), WE MAY GET SOME CONVINENT if we choose installing
#                  tools by package manager(for example, apt-get install
#                  python-django provides django-completion installed to
#                  /etc/bash_completion.d).
#  
#       Author: Peter Xu
#        Email: p@cooliktas.com
#     HomePage: http://peter.cooliktas.com
#      Version: 0.0.1
#   LastChange: 2014-03-24 23:00:14
#      History: 2014-03-24 23:00:14 restructured from install.sh
#
#=============================================================================

set -o nounset                          # Treat unset variables as an error

OS=$(uname -s)                          # which can be Linux, Darwin, ...
INSTALL_FROM="$(cd $(dirname $0); pwd)"
INSTALL_TO=$HOME

function print_head()
{
    echo "======================================================================"
    echo "User          : $USER"
    echo "OS            : $OS"
    echo "Install from  : $INSTALL_FROM"
    echo "Install to    : $INSTALL_TO (by symbolic links)"
    echo "======================================================================"
    echo
}

function check_user()
{
    if [ "$USER" = "root" -a "$INSTALL_TO" != "/root" ]; then
        echo "You should switch to root by 'su - root' to load the environment."
        exit 1
    fi
}

function check_home()
{
    if [ "$USER" = "root" -a "$OS" = "Darwin" -a ! -e /root ]; then
        echo "Setting up /root directory for Darwin..."
        ln -s /var/root /root
    fi
}

function get_dist_name()
{
    echo "$(cat /etc/issue | awk '{print $1}')"
}

function print_end_notes()
{
    echo
    echo "We have mutt configure files not installed, check mutt/ for details."
}

function install_vimscripts()
{
    echo
    if [ -e "$INSTALL_TO/.vim" ]; then
        echo "Moving $INSTALL_TO/.vim to $INSTALL_TO/.vim.bak.$$"
        mv $INSTALL_TO/.vim $INSTALL_TO/.vim.bak.$$
    fi

    if [ -e "$INSTALL_TO/.vimrc" ]; then
        echo "Moving $INSTALL_TO/.vimrc to $INSTALL_TO/.vimrc.bak.$$"
        mv $INSTALL_TO/.vimrc $INSTALL_TO/.vimrc.bak.$$
    fi

    if [ -d "$INSTALL_FROM/vim" ]; then
        echo "Installing vim configure files..."
        ln -s $INSTALL_FROM/vim/ $INSTALL_TO/.vim
        ln -s $INSTALL_FROM/vim/vimrc $INSTALL_TO/.vimrc
        echo "Installed."
    fi
}

function install_gitconfig()
{
    echo
    if [ "$(which git)" != "" ]; then
        if [ -e $INSTALL_TO/.gitconfig ]; then
            echo "Moving $INSTALL_TO/.gitconfig to $INSTALL_TO/.gitconfig.bak.$$"
            mv $INSTALL_TO/.gitconfig $INSTALL_TO/.gitconfig.bak.$$
        fi
        if [ -e $INSTALL_FROM/git/gitconfig ]; then
            echo "Installing git configure files..."
            ln -s $INSTALL_FROM/git/gitconfig $INSTALL_TO/.gitconfig
            echo "Installed."
        fi
    fi
}

function install_pythonrc()
{
    echo
    if [ -e $INSTALL_TO/.pythonrc ]; then
        echo "Moving $INSTALL_TO/.pythonrc $INSTALL_TO/.pythonrc.bak.$$"
        mv $INSTALL_TO/.pythonrc $INSTALL_TO/.pythonrc.bak.$$
    fi
    if [ -e $INSTALL_FROM/python/pythonrc ]; then
        echo "Installing python configure files..."
        ln -s $INSTALL_FROM/python/pythonrc $INSTALL_TO/.pythonrc
        echo "Installed."
    fi
}

function install_pylintrc()
{
    echo
    if [ -e $INSTALL_TO/.pylintrc ]; then
        echo "Moving $INSTALL_TO/.pylintrc $INSTALL_TO/.pylintrc.$$"
        mv $INSTALL_TO/.pylintrc $INSTALL_TO/.pylintrc.$$
    fi
    if [ -e $INSTALL_FROM/python/pylintrc ]; then
        echo "Installing python configure files..."
        ln -s $INSTALL_FROM/python/pylintrc $INSTALL_TO/.pylintrc
        echo "Installed."
    fi
}

function install_tmux()
{
    if [ ! -e $INSTALL_TO/.tmux ]; then
        git clone https://github.com/gpakosz/.tmux $INSTALL_TO/.tmux
        ln -s $INSTALL_TO/.tmux/.tmux.conf $INSTALL_TO/.tmux.conf
    fi
}

function install_sh()
{
    echo
    # We use the origin .bashrc file on Ubuntu
    if [ "$(get_dist_name)" != "Ubuntu" ]; then
        if [ -e $INSTALL_TO/.bashrc ]; then
            echo "Moving $INSTALL_TO/.bashrc $INSTALL_TO/.bashrc.$$"
            mv $INSTALL_TO/.bashrc $INSTALL_TO/.bashrc.$$
        fi
        if [ -e $INSTALL_FROM/bash/bashrc ]; then
            echo "Installing bash configure files..."
            ln -s $INSTALL_FROM/bash/bashrc $INSTALL_TO/.bashrc
            echo "Installed."
        fi
    fi

    if [ ! -e $INSTALL_TO/.oh-my-zsh ]; then
        # wget --no-check-certificate http://install.ohmyz.sh -O - | sh
        sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    fi

    if [ -e $INSTALL_TO/.zshrc ]; then
        echo "Moving $INSTALL_TO/.zshrc $INSTALL_TO/.zshrc.$$"
        mv $INSTALL_TO/.zshrc $INSTALL_TO/.zshrc.bak.$$
    fi
    if [ -e $INSTALL_FROM/zsh/zshrc ]; then
        echo "Installing zsh configure files..."
        ln -s $INSTALL_FROM/zsh/zshrc $INSTALL_TO/.zshrc
        echo "Installed."
    fi

    if [ $OS = "Darwin" ]; then
        echo "[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh" \
            >> $INSTALL_TO/.bashrc
        echo "[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh" \
            >> $INSTALL_TO/.zshrc
    fi

    echo "[ -e $INSTALL_FROM/common/userenv.sh ] && source $INSTALL_FROM/common/userenv.sh"\
        >> $INSTALL_TO/.bashrc

    echo "[ -e $INSTALL_FROM/common/userenv.sh ] && source $INSTALL_FROM/common/userenv.sh"\
        >> $INSTALL_TO/.zshrc

}


print_head
check_user
check_home

install_vimscripts
install_gitconfig
install_pythonrc
install_pylintrc
install_tmux
install_sh

print_end_notes
