#!/bin/bash - 
#=============================================================================
#     FileName: pip.sh
#         Desc: for pip installs
#       Author: Peter Xu
#        Email: p@cooliktas.com
#     HomePage: http://peter.cooliktas.com
#      Version: 0.0.1
#   LastChange: 2014-03-27 19:54:49
#      History:
#=============================================================================


################################################################################
# devel helper
################################################################################
# devassistant needs libyaml-dev
pip install devassistant

# cookiecutter
pip install cookiecutter

# for python2/python3 compatible
pip install six pies

# for app package on mac/linux/win
pip install pyinstaller
