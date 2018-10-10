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

pip install --upgrade pip

###############################################################################
# system helper
###############################################################################
pip install glances
pip install pexpect
# pip install launchpadlib
pip install tig
pip install htop
pip install sshuttle
pip install aiohttp
pip install aiodns

###############################################################################
# devel helper
###############################################################################
pip install ipython

# devassistant needs libyaml-dev
pip install six pies
pip install devassistant
pip install pymysql
pip install mycli
pip install cookiecutter

# for app package on mac/linux/win
pip install pyinstaller

# for documents
pip install docutils
pip install sphinx
pip install sphinx_bootstrap_theme
pip install pyyaml

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
pip install uwsgi
pip install gunicorn

pip install markupsafe pygments jinja2 mako
pip install fontforge html5lib

pip install requests werkzeug greenlet
pip install south sqlalchemy

pip install impacket
pip install paramiko fabric

pip install pyquery pycurl scrapy

# for speedup
pip install cffi

# for bigdata
pip install jieba
pip install kafka
# python-recsys
# scikit-learn
# scikits.crab
pip install networkx
pip install pymc
pip install seaborn
pip install wxpy

# for serial
pip install pyserial

# for image
pip install pillow

# others
pip install arrow
pip install pytz
pip install pyzmq
pip install chardet
pip install cchardet


###############################################################################
# for usefull improvement.
###############################################################################
pip install addict


###############################################################################
# for pdf/word/excel etc.
###############################################################################
pip install pypdf2
pip install openpyxl
pip install docx
pip install xlrd xlwt

###############################################################################
# drivers
###############################################################################
# pip install neo4j-driver

