#!/bin/sh - 
#=============================================================================
#     FileName: homenv.sh
#         Desc: for ~/.local related settings.
#       Author: Peter Xu
#        Email: p@cooliktas.com
#     HomePage: http://peter.cooliktas.com
#      Version: 0.0.1
#   LastChange: 2014-03-25 17:10:44
#      History:
#=============================================================================

#set -o nounset                              # Treat unset variables as an error

PATH=/usr/local/bin:$PATH
if [ -e ~/.local ]; then
    echo "We have got ~/.local, dealing with related settings..."
    for exe in bin sbin s
    do
        if [ -d ~/.local/$exe ]; then
            PATH=$(cd ~/.local/$exe; pwd):$PATH
        fi
    done

    for exe in scala sbt maven ant spark hadoop hbase jython hbase hive pio elasticsearch
    do
        if [ -d ~/.local/$exe/bin ]; then
            PATH=$(cd ~/.local/$exe/bin; pwd):$PATH
        fi
    done

    for lib in lib lib64
    do
        if [ -d ~/.local/$lib ]; then
            LD_LIBRARY_PATH=$(cd ~/.local/$lib; pwd):$LD_LIBRARY_PATH
        fi
    done
fi

if [ -e ~/.cargo ]; then
    PATH=$(cd ~/.cargo/bin; pwd):$PATH
fi

if [ -e ~/.pythonrc ]; then
    export PYTHONSTARTUP=~/.pythonrc
fi

if [ `uname -s` = "Darwin" ]; then
    # set JAVA_HOME for mac
    if [ -e /usr/libexec/java_home -a `/usr/libexec/java_home` != "" ]; then
        JAVA_HOME=`/usr/libexec/java_home`
    fi
    if [ -d /Developer/NVIDIA/CUDA-7.5/bin ]; then
        PATH=/Developer/NVIDIA/CUDA-7.5/bin/:$PATH
    fi
elif [ `uname -s` = "Linux" -a `head -1 /etc/issue | awk '{print $1}'` = "Ubuntu" ]; then
    # set JAVA_HOME for ubuntu
    if [ -e /usr/lib/jvm/default-java -a "$JAVA_HOME" = "" ]; then
        JAVA_HOME=/usr/lib/jvm/default-java
        PATH=$JAVA_HOME/bin:$PATH
    fi
fi

# a few alias
alias tmux="tmux -u"

# set up path for pyenv
if [ -d ~/.pyenv/bin ]; then        # for manually installation.
    PATH=$(cd ~/.pyenv/bin; pwd):$PATH
fi
if [ -d ~/.pyenv/shims ]; then
    PATH=$(cd ~/.pyenv/shims; pwd):$PATH
fi

# set up for haskell cabal
if [ -d ~/.cabal/bin ]; then
    PATH=$(cd ~/.cabal/bin; pwd):$PATH
fi


export PATH
export LD_LIBRARY_PATH
export JAVA_HOME
export HOMEBREW_GITHUB_API_TOKEN='aec095b373d378888ec38f6e46003e873f0fab2b'
export HISTSIZE=1000000

if [ -d ~/.local/anaconda3/ ]; then
    export PATH=~/.local/anaconda3/bin:$PATH
    alias an35='~/.local/anaconda/bin/ipython'
    alias apy3='~/.local/anaconda/bin/python'
    alias api3='~/.local/anaconda/bin/pip'
    alias an27=' ~/.local/anaconda/envs/2.7/bin/ipython'
    alias apy2=' ~/.local/anaconda/envs/2.7/bin/python'
    alias api2=' ~/.local/anaconda/envs/2.7/bin/pip'
fi

# use vim shortcuts for shells
# set -o vi

# handle rvm for ruby version manage.
[ -e /home/ptr/.rvm/scripts/rvm ] && source /home/ptr/.rvm/scripts/rvm

# NEVER put a "exit 0" here!
