#!/bin/bash
echo "file: kali2016-step2.sh"
echo "author: Adam P. Schinder"
echo "purpose: I really just needed to automate some of the setup non-sense for my "
echo "         Kali2016 box. If ever it needs to be re-done or whatever, this script will "
echo "         be on short stand-by, ready to get me back in the game! "
echo "         This might work on other x64 Debian Linux Builds - No guarantees! "
echo "         Run this little guy as root - less sudo stuff to worry about... "
##########################################################################################
# NOTE: SOME ITEMS NEED SOME TYPING IN OF STUFF! READ THE DANG COMMENTS!
##########################################################################################
echo "date: 18 May 2016 - initial commit  ... more like 19 May now...  it's really late..."
echo "date: 19 May 2016 - changed some of the install scripts."
echo "date: 19 May 2016 - finalized the scripts to a four part install process.  Tested on VM. "
echo "                    it works! Not sure if it's a good idea, but it's going on Github...."
echo "#####################################################################################" 
apt-get update
apt-get upgrade -y
apt-get autoremove
#################################
# Starting Printer Support
#################################
dpkg --add-architecture i386
apt-get update
apt-get upgrade -y
apt-get -f install
apt-get autoclean
#######################################################
# Configure your antivirus...
#######################################################
echo " ###################################################"
echo " #   Take a second to setup your antivirus..."
echo " ###################################################"
freshclam
clamtk
echo " ###################################################"
echo " #   Reboot Again... yup..."
echo " ###################################################"
shutdown -r +1
