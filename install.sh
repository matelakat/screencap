#!/bin/bash
set -eu

THISDIR=$(dirname $(readlink -f "$0"))

function print_usage_and_die
{
cat >&2 << USAGE
usage: $0 TARGET_DIR

Install screen capture utilities to TARGET_DIR

Positional arguments:
 TARGET_DIR     A directory where files will be installed
USAGE
exit 1
}

TGTDIR="${1-`print_usage_and_die`}"
LOGFILE="$TGTDIR/install.log"

[ -e "$TGTDIR" ] || mkdir "$TGTDIR"

# vnc2flv
echo "setup a virtual environment, and install vnc2flv"
(
cd "$TGTDIR"
virtualenv -p python2 .env
set +u
. .env/bin/activate
set -u
pip install vnc2flv
) >> "$LOGFILE" 2>&1

# dwm
echo "download and compile dwm"
(
cd "$TGTDIR"
git clone http://git.suckless.org/dwm dwm
cd dwm
cp "$THISDIR/files/config.h" .
make
) >> "$LOGFILE" 2>&1

echo "Copy files to target directory"
mkdir -p "$TGTDIR/files"
cp files/* "$TGTDIR/files/"
chmod 0600 "$TGTDIR/files/vncpassword"

echo "Copy scripts to target directory"
cp scripts/* "$TGTDIR/"

echo "Create password file"
echo "000000" > "$TGTDIR/files/pwdfile"

echo "Create default settings"
cat > "$TGTDIR/.scrc" << EOF
GEOMETRY="853x480"
SC_DISPLAY=":13"
EOF
