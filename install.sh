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
wget -O - "http://dl.suckless.org/dwm/$DWM.tar.gz" | tar -xzf -
cd $DWM
make
)

# set vnc password
vncpasswd
