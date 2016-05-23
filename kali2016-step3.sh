#!/bin/bash
echo "file: kali2016-step3.sh"
echo "author: Adam P. Schinder"
echo "purpose: I really just needed to automate some of the setup non-sense for my "
echo "         Kali2016 box. If ever it needs to be re-done or whatever, this script will "
echo "         be on short stand-by, ready to get me back in the game! "
echo "         This might work on other x64 Debian Linux Builds - No guarantees! "
echo "         Run this little guy as root - less sudo stuff to worry about... "
echo " !!!!!               --------------WARNING--------------                         !!!!"
echo " !!!!! Depending on your internet speed, this process may take an hour or longer !!!!"
echo " !!!!! Also, change your lock screen settings off for this. Turn it on afterwards!!!!"
echo " !!!!!             --------------END WARNING--------------                       !!!!"
##########################################################################################
# NOTE: SOME ITEMS NEED SOME TYPING IN OF STUFF! READ THE DANG COMMENTS!
##########################################################################################
echo "date: 18 May 2016 - initial commit  ... more like 19 May now...  it's really late..."
echo "date: 19 May 2016 - changed some of the install scripts."
echo "date: 19 May 2016 - finalized the scripts to a four part install process.  Tested on VM. "
echo "                    it works! Not sure if it's a good idea, but it's going on Github...."
echo "date: 23 May 2016 - Removed creation of et, wpp, and wps .desktop files"
echo "                    Paired down the process to three reboots"
echo "                    Added a .desktop creator for gnat-gps"
echo "                    Re-install added for full version of gdb (GNAT-GPS makes you use gdb-minimal..."
echo "                    Changed the script to use the updated linux headers (4.5)"
echo "                    Added the Internet Speed and lock screen notices"
echo "                    Fixed the clamav freshclam error"
echo "                    Added -y to the install scripts for script 2 and 3"
echo "                    Fixed the tor-browser setup functions (added chown -R root:root"
echo "#####################################################################################" 
apt-get update
apt-get upgrade -y
apt-get -f install
echo "###########################################################"
echo "Brother MFC-9340-CDW Printer Support - SPECIFICALLY!"
echo "###########################################################"
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
echo " # You will need to delete the current one and re-add it as --> lpd://192.168.1.9/binary_p1"
echo " ##########################################################################################"
shutdown -r +1








