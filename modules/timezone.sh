#!/bin/sh
## Timezone
NAMEOFAPP="timesone"

## Dependencies Check
sudo bash /etc/piadvanced/dependencies/dep-whiptail.sh

## Variables
source /etc/piadvanced/install/firewall.conf
source /etc/piadvanced/install/variables.conf
source /etc/piadvanced/install/userchange.conf

{ if 
(whiptail --title "$NAMEOFAPP" --yes-button "Skip" --no-button "Proceed" --yesno "Do you want to set the timezone?" 10 80) 
then
echo "User Declined $NAMEOFAPP"
else
sudo dpkg-reconfigure tzdata
fi }

unset NAMEOFAPP
