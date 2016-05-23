#!/bin/bash
echo "file: kali2016-step2.sh"
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
apt-get -f install -y
echo "###########################################################"
echo "Install Printer Support"
echo "###########################################################"
apt-get install cups cups-common cups-client cups-daemon foomatic-db sane-utils tcsh csh -y  
#ln -s /etc/init.d/cupsys /etc/init.d/lpd
dpkg --configure -a
mkdir /var/spool/lpd
useradd root lpadmin 
adduser root lpadmin
update-rc.d cups enable
service cups start
echo "#!/bin/sh" >> /etc/network/if-up.d/cups
echo "service cups restart" >> /etc/network/if-up.d/cups
chmod 755 /etc/network/if-up.d/cups 
apt-get install lib32z1 lib32ncurses5 gcc-6-base lib32gcc1 libc6-i386 gcc-6-base lib32gcc1 lib32stdc++6 libc6-i386 -y
#####apt-get install libc6-dev-i386
#####apt-get install '^libc6.*'
apt-get -f install -y
dpkg --configure -a
echo " ################################################"
echo " # Time to reboot again!"
echo " ################################################"
shutdown -r +1

