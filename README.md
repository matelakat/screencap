# Tools for recording screencasts

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
