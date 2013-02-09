#!/bin/bash
set -eu

[ -e scrcap ] || mkdir scrcap

# vnc2flv
echo "setup a virtual environment, and install vnc2flv"
(
cd scrcap
virtualenv .env
set +u
. .env/bin/activate
set -u
pip install vnc2flv
) >> scrcap-install.log 2>&1

# dwm
echo "download and compile dwm"
(
cd scrcap
DWM=dwm-6.0
wget -qO - "http://dl.suckless.org/dwm/$DWM.tar.gz" | tar -xzf -
cd $DWM
make
) >> scrcap-install.log 2>&1

# set vnc password
echo "set vnc password to 000000"
cp files/vncpassword ~/.vnc/passwd
chmod 0600 ~/.vnc/passwd

# Note setting the password this way didn't work
#echo -ne "000000\n000000" | vncpasswd > /dev/null
