#!/bin/sh
## pihole

## Variables
source /etc/piadvanced/install/firewall.conf
source /etc/piadvanced/install/variables.conf
source /etc/piadvanced/install/userchange.conf

{ if (whiptail --yes-button "Skip" --no-button "Proceed" --yesno "Do you want to install pihole?" 8 78) then
echo "User Declined Pi-Hole"
else
git clone --depth 1 https://github.com/pi-hole/pi-hole.git /etc/piadvanced/installscripts/Pi-hole
cd /etc/piadvanced/installscripts/Pi-hole/automated\ install/
bash basic-install.sh
whiptail --msgbox "Let's change pihole password" 20 70 1
NEW_PASS=$(whiptail --inputbox "Please enter a password" 20 60 "" 3>&1 1>&2 2>&3)
pihole -a -p $NEW_PASS
sudo echo "piholefirewall=yes" | sudo tee --append /etc/piadvanced/install/firewall.conf
sudo bash /etc/piadvanced/modules/pihole-tweaks.sh
fi }
