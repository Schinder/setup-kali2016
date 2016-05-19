#!/bin/bash
echo "file: kali2016-step4.sh"
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
apt-get -f install
#################################
# Printer Support
#################################
service cups status
cd /root/Downloads/
#wget http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.0.0-1.gz
#gunzip linux-brprinter-installer-2.0.0-1.gz
#chmod 755 linux-brprinter-installer-2.0.0-1 
#./linux-brprinter-installer-2.0.0-1 

wget http://download.brother.com/welcome/dlf007027/mfc9340cdwlpr-1.1.2-1.i386.deb
chmod 755 mfc9340cdwlpr-1.1.2-1.i386.deb
dpkg -i mfc9340cdwlpr-1.1.2-1.i386.deb 
dpkg --configure -a

wget http://download.brother.com/welcome/dlf007029/mfc9340cdwcupswrapper-1.1.2-1.i386.deb
chmod 755 mfc9340cdwcupswrapper-1.1.2-1.i386.deb 
dpkg -i mfc9340cdwcupswrapper-1.1.2-1.i386.deb 
dpkg --configure -a

apt-get update
apt-get upgrade -y
apt-get -f install
apt-get clean
dpkg --configure -a
echo " ##########################################################################################"
echo " # Time to reboot again!"
echo " # When you come back, modify the printer in the cups frontend --> 127.0.0.1:631"
echo " # You will need to delete the current one and readd it as --> lpd://192.168.1.9/binary_p1"
echo " ##########################################################################################"
shutdown -r +1








