################################################################################
# update the orgin packages
################################################################################
apt-get update
apt-get upgrade --yes

################################################################################
# for system management
################################################################################
apt-get install --yes zerofree

################################################################################
# setup devel environment
################################################################################
apt-get install --yes vim-gnome ctags cscope global
apt-get install --yes git tig gitolite mercurial subversion
apt-get install --yes ack-grep

apt-get install --yes automake autotools-dev autoconf libtool build-essential
apt-get install --yes clang cmake
apt-get install --yes linux-headers-`uname -r` dkms     # for kernel related.

# for web
apt-get install --yes nginx curl traceroute ifstat nethogs

# for better shell ops
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
apt-get install --yes python-dev ipython python-numpy python-scipy python-matplotlib
apt-get install --yes python-pip
apt-get install --yes python-virtualenv
apt-get install --yes python-sphinx
apt-get install --yes python-django
apt-get install --yes python-flask
apt-get install --yes vim-python

# for python3
apt-get install --yes python3-dev ipython3 python3-pip

# for python-recsys
#apt-get install csc-pysparse
#apt-get install --yes libatlas libatlas-dev
#apt-get install --yes libatlas-dev
#apt-get install --yes python-scikits-learn python-scikits.statsmodels
#apt-get install --yes python-boto

# for python editor eric
apt-get install --yes eric

# for database, a password is required for mysql-server during the installation.
apt-get install --yes memcached libmemcached-dev redis-server
apt-get install --yes postgresql mysql-client libmysqlclient-dev mysql-server
