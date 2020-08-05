# Bluetooth HSP/FTP Suppport for Ubuntu 20.04

This repository is based on the following resources:

- [Ask Ubuntu: Failed to change profile to headset_head_unit](https://askubuntu.com/a/1236379)
- [Ask Ubuntu: How to install ofono-phonesim on Ubuntu 20.04](https://askubuntu.com/a/1242489)
- [Ofono Git Reposotry @ kernel.org](https://git.kernel.org/pub/scm/network/ofono/ofono.git/about/)

## Installation

1. Install ofono: `sudo apt install ofono`
2. Edit `/etc/pulse/default.pa`
   Replace `load-module module-bluetooth-discover`
   With `load-module module-bluetooth-discover headset=ofono`
3. Run `sudo usermod -aG bluetooth pulse`
4. Edit `/etc/dbus-1/system.d/ofono.conf`
   Insert the following before `</busconfig>`
   ```
     <policy user="pulse">
       <allow send_destination="org.ofono"/>
     </policy>
   ```
5. Install `ofono-phonesim`:
   ```
   sudo add-apt-repository ppa:smoser/bluetooth
   sudo apt-get install ofono-phonesim
   ```
6. Edit `/etc/ofono/phonesim.conf`
   Insert:
   ```
   [phonesim]
   Driver=phonesim
   Address=127.0.0.1
   Port=12345
   ```
7. Restart ofono: `sudo systemctl restart ofono.service`
8. Clone this repository: `git clone https://github.com/foxylion/ubuntu-bluetooth-hsp-hfp.git /opt/ubuntu-bluetooth-hsp-hfp`
9. Run `/opt/ubuntu-bluetooth-hsp-hfp/startup.sh` after OS start
