################################################################################
# update the orgin packages
################################################################################
apt-get update
apt-get upgrade --yes


################################################################################
# setup devel environment
################################################################################
apt-get install --yes vim ctags cscope
apt-get install --yes git

apt-get install --yes traceroute
apt-get install --yes automake autotools-dev autoconf

# for web server
apt-get install --yes nginx

# for better shell ops
apt-get install --yes autojump
apt-get install --yes powerline

# for some lib
apt-get install --yes libyaml-dev

# for python2
apt-get install --yes ipython python-numpy python-scipy python-matplotlib 
apt-get install --yes python-pip
apt-get install --yes python-virtualenv
apt-get install --yes python-sphinx
apt-get install --yes python-django
apt-get install --yes python-flask
apt-get install --yes vim-python

# for python3
apt-get install --yes python3-pip

# for python-recsys
#apt-get install csc-pysparse
#apt-get install --yes libatlas libatlas-dev
#apt-get install --yes libatlas-dev
#apt-get install --yes python-scikits-learn python-scikits.statsmodels
#apt-get install --yes python-boto

# for python editor eric
apt-get install --yes eric
