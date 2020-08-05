#/bin/bash

ofono-phonesim -p 12345 /usr/share/phonesim/default.xml &
sleep 1

./tools/enable-modem
./tools/online-modem
./tools/list-modems
