#!/bin/bash -
#
#     FileName: pip.sh
#         Desc: for pip installs
#       Author: Peter Xu
#        Email: p@cooliktas.com
#     HomePage: http://peter.cooliktas.com
#      Version: 0.0.1
#   LastChange: 2014-03-27 19:54:49
#      History:
#

###############################################################################
# system helper
###############################################################################
pip install glances
pip install pexpect
# pip install launchpadlib

###############################################################################
# devel helper
###############################################################################
pip install ipython
pip install ipython

# devassistant needs libyaml-dev
pip install devassistant

# cookiecutter
pip install cookiecutter

# for python2/python3 compatible
pip install six pies

# for app package on mac/linux/win
pip install pyinstaller

# for documents
pip install docutils
pip install sphinx
pip install pyyaml

pip install xlrd xlwt

# for general develenv
pip install virtualenv wheel
pip install pep8 pylint pyflakes coverage clonedigger
pip install mock nose tox
pip install pytest pytest-cache pytest-capturelog pytest-codecheckers pytest-cov pytest-timeout

# for web/network develenv
pip install cssselect lxml
pip install beautifulsoup4
pip install bottle
pip install flask
pip install django
pip install django-classy-tags django-cms django-mptt django-sekizai
pip install flup
pip install paste pastescript
pip install twisted twisted-core twisted-names twisted-web

pip install markupsafe pygments jinja2 mako
pip install fontforge html5lib

pip install requests werkzeug greenlet
pip install six south sqlalchemy

pip install impacket
pip install paramiko fabric

pip install pyquery pycurl scrapy

# for speedup
pip install cffi

# for bigdata
pip install jieba
# python-recsys
# scikit-learn
# scikits.crab

# for serial
pip install pyserial

# for image
pip install pillow

# others
pip install pytz
pip install pyzmq
