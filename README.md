# Tools for recording screencasts
A set of scripts, to manipulate:

- dwm http://dwm.suckless.org/
- vncserver
- vncviewer
- flvrec http://www.unixuser.org/~euske/python/vnc2flv/index.html

In order to be able to easily produce screencasts in flv format. Those files
could later be uploaded to youtube if required.

## Installation

    ./install.sh `TARGET_DIR`

## Configuration
In the specified `TARGET_DIR` you can find a file, called `.scrc`. That is a
simple file, that is sourced by some of the scripts. You can configure the 
size of the virtual display, and the display port.

## Usage

    cd TARGET_DIR
    ./sc-server-start
    ./sc-desktop-show
    ./sc-record-to cast1.flv
    ./sc-server-kill

## Record the desktop
This requires `x11vnc` to be installed.

    cd TARGET_DIR
    ./sc-record-x11 cast1.flv
