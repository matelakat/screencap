#!/bin/bash
mkdir scrcap

# vnc2flv
(
cd scrcap
virtualenv .env
. .env/bin/activate
pip install vnc2flv
)

# dwm
(
cd scrcap
DWM=dwm-6.0
wget -qO - "http://dl.suckless.org/dwm/$DWM.tar.gz" | tar -xzf -
cd $DWM
make
)

# set vnc password
echo -ne "000000\n000000" | vncpasswd > /dev/null
