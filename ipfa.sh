################################################################################
# update the origin packages
################################################################################
# update system
pacman -Syu --noconfirm

################################################################################
# setup the system
################################################################################
# get the latest Pacman mirror list
pacman -S --noconfirm reflector
pacman -S --noconfirm sudo
pacman -S --noconfirm net-tools
pacman -S --noconfirm openssh nmap
pacman -S --noconfirm wget

# vesa is generic driver, use lspci | grep VGA to determine the driver
# man startx to see how to config xinitrc and rxvt (xterm doesnot support unicode, uxterm does)
pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit mesa
pacman -S --noconfirm xf86-video-vesa
pacman -S --noconfirm xorg-twm xorg-xclock
pacman -S --noconfirm xterm rxvt-unicode

# install fonts, exec fc-cache -f -v later, the Ubuntu Mono font is recommended
pacman -S --noconfirm ttf-dejavu ttf-ubuntu-font-family wqy-microhei wqy-zenhei wqy-bitmapfont
# input method
pacman -S --noconfirm ibus ibus-table ibus-googlepinyin

################################################################################
# setup devel environment
################################################################################
# for devel toolchain
# gvim is compiled with python, while vim is not.
pacman -S --noconfirm gvim
pacman -S --noconfirm ctags cscope dos2unix tree

pacman -S --noconfirm git mercurial

pacman -S --noconfirm gcc gdb make automake autoconf

# for python3
pacman -S --noconfirm python ipython python-pip
pacman -S --noconfirm python-sphinx python-jedi
pacman -S --noconfirm python-mock python-pytest python-nose python-virtualenv python-pylint pep8-python3

pacman -S --noconfirm uwsgi-plugin-python

pacman -S --noconfirm python-numpy python-scipy python-matplotlib python-numexpr
pacman -S --noconfirm python-scikit-learn

# for python2
pacman -S --noconfirm python2-pip
