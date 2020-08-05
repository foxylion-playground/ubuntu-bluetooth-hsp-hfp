#/bin/bash
set -e

ofono-phonesim -p 12345 /usr/share/phonesim/default.xml &
sleep 1

THIS_DIR=$(dirname "$0")

$THIS_DIR/tools/enable-modem
$THIS_DIR/tools/online-modem
$THIS_DIR/tools/list-modems
