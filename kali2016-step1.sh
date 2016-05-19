#!/bin/bash
echo "file: kali2016-step1.sh"
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
passwd
apt-get update
apt-get upgrade -y
#update-initramfs -u -k $(uname -r)
dpkg --add-architecture i386  # <---- needed for the printer to work
# get google drive setup ** COMMENTED OUT FOR NOW ** 
# apt-get install golang
# get some version control tools
apt-get install git git-gui git-doc gitk mercurial -y
# get the go-to mail client
apt-get install icedove calendar-google-provider -y
# get the old-school antivirus program...
apt-get install clamav clamtk clamav-docs clamtk-nautilus clamtk-gnome freshclam -y
# get virtualbox and extension-pack
apt-get install virtualbox* virtualbox-ext-pack virtualbox-dkms virtualbox-qt vde2 virtualbox-guest-additions-iso -y
# get this so you can read the perl formatted man pages...
apt-get install perl-doc -y
# get the ubiquitous disk burning client
apt-get install brasero -y
# get the good ole' torrent client
apt-get install deluge -y
# get these nifty hex editors
apt-get install bless wxhexeditor dhex -y
# get these so you can use a smart-card with the operating system
apt-get install pcsc-tools pcscd -y
# get the ubiquitous anonymity service and browser...  *** DO NOT INSTALL the torbrowser-launcher - it just doesn't work.  Download off the website and extract to /opt/torbrowser
apt-get install tor tor-arm tor-dbg torsocks torchat -y
# get gimp and extraz...
apt-get install gimp gimp-help-en gimp-data-extras -y
# get a better image viewer (one that can crop and edit).  Not as good as irfanview in windows, but it'll do.
apt-get install gthumb -y
# get the backup utility burp and related tools
apt-get install burp librsync-dev libz3-dev libssl-dev libncurses5-dev make g++ uthash-dev ncurses-doc -y
# get the samba windows file transfer (smb) client / server
apt-get install samba -y
# I can't remember why I needed this...
apt-get install winbind -y
# get these so you can develop in assembly and so forth...
apt-get install build-essential linux-headers-4.4.0-kali1-amd64 -y
# get this for your c program development
apt-get install monodevelop monodevelop-database monodevelop-nunit monodevelop-versioncontrol -y
# get these to develop programs in ada
apt-get install gnat-gps gnat-gps-doc gprbuild gpr gcc -y
# get the arduino programming suite
apt-get install arduino arduino-mk avrdude-doc gcc-doc libjna-java-doc -y
# get netbeans for Java Development
apt-get install netbeans -y
# get the postgres database graphical utility
apt-get install pgadmin3* -y
# get the cool fonts... Not sure if this worked or not...
apt-get install ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu* ttf-xfree86-nonfree -y
# get these updates to php so that laravel works correctly...
apt-get install php7.0 php7.0-mysql php7.0-zip php7.0-bz2 php7.0-cli php7.0-sqlite3 php7.0-xml php7.0-phpdbg php7.0-pgsql php7.0-bcmath php7.0-cli php7.0-curl php7.0-dev php7.0-json -y
# get composer to manage all of those crazy dependencies php projects tend to have these days.  Yay package managers......... :/
apt-get install composer -y
# get all of those lovely mysql database tools.  Nice.
apt-get install mysql-client mysql-common mysql-proxy mysql-sandbox mysql-server mysqltcl mysqltuner mysql-utilities mysql-workbench mysql-workbench-data -y
# get nodejs for javascript server functionality
apt-get install nodejs nodejs-dev nodejs-dbg -y
# get the npm manager.... Yay package managers........ :/
apt-get install npm -y
# get this to easily enable or disable system services.  No different than up update-rc.d - I think...  not sure there...
apt-get install chkconfig -y
echo "###########################################################"
echo "Whew! installs are complete. Let's get some things setup!"
echo "###########################################################"
##################################
# Start these services at start-up
##################################
update-rc.d postgresql enable
update-rc.d tor enable
service postgresql start
service tor start
#################################################
# Setup Google Drive  -- COMMENTED OUT FOR NOW --
#################################################
#cd /root/
#mkdir googledrive
#echo "export GOPATH=\$HOME/googledrive" >> .bashrc
#echo "export PATH=\$GOPATH:\$GOPATH/bin:\$PATH" >> .bashrc
###################################################
# Be careful! ./ and source are not quite the same.
#    ./script runs the script as an executable file, launching a new shell to run it
#    source script reads and executes commands from filename in the current shell environment
# Note: ./script is not . script, but . script == source script
###################################################
#source ~/.bashrc
#cd /root/Downloads/
#go get -u github.com/odeke-em/drive/cmd/drive
#cd /root/googledrive/
#drive init
#drive pull -ignore-name-clashes -verbose
######################################################
# Setup Kingsoft WPS Office - Best Office Product IMHO
######################################################
cd /root/Downloads
wget http://kdl.cc.ksosoft.com/wps-community/download/a20/wps-office_10.1.0.5503~a20p2_amd64.deb
dpkg -i wps-office_10.1.0.5503~a20p2_amd64.deb
#cd /usr/share/applications/
#gedit et.desktop &
#gedit wps.desktop &
#gedit wpp.desktop &
#cd /root/
#echo "export PATH=\$PATH:/opt/kingsoft-wps" >> .bashrc
#################################################
# If you want Microsoft Visual Studio Code...
#################################################
#visit https://go.microsoft.com/fwlink/?LinkID=760868
#dpkg -i vscode-amd64.deb 
#################################################
# Setup Sublime Text Editor
#################################################
cd /root/Downloads
wget https://download.sublimetext.com/sublime-text_build-3114_amd64.deb
dpkg -i sublime-text_build-3114_amd64.deb 
#################################################
# Setup Tor Browser
#################################################
cd /root/Downloads
wget https://www.torproject.org/dist/torbrowser/5.5.5/tor-browser-linux64-5.5.5_en-US.tar.xz
tar xf tor-browser-linux64-5.5.5_en-US.tar.xz
mv tor-browser_en-US tor-browser
mv tor-browser /opt/
gedit /opt/tor-browser/Browser/start-tor-browser
gedit /usr/share/applications/tor-browser.desktop
ln -s /opt/tor-browser/Browser/start-tor-browser /usr/bin/ 
#######################################################
# Setup the CAC-Card Reader
# You will still need to add the packages in firefox...
#######################################################
#cd p11-capi/
#cd module/w64
#chmod 755 build.sh 
#./build.sh 
#chmod 755 make-dist.sh 
#./make-dist.sh 
#cat make-dist.sh 
#./build.sh 
#cd cac-card-setup/
#cd cackey/
#dpkg -i cackey_0.7.5-1_amd64.deb 
#######################################################
# Configure your samba server stuff (filesharing)
#######################################################
smbpasswd -a root
gedit /etc/samba/smb.conf
update-rc.d samba defaults 
update-rc.d smbd enable
update-rc.d nmbd enable
service smbd restart
#testparm
#systemctl start smbd
#######################################################
# Leftover tools...
#######################################################
#dpkg -i tuxboot_0.8debian1_amd64.deb 
#./AESCrypt-GUI-3.10-Linux-x86_64-Install 
#aescrypt -e file.pdf 
#aescrypt -d file.pdf.aes 
#rm file.pdf.aes 
#######################################################
# Uhhh.... Nifty Commands?
#######################################################
#find / -type f -name *grub* -exec file '{}' \;
#find / -type f -name *grub* -exec ls -l '{}' \;
echo "###########################################################"
echo "All done for step one.  Reboot now!"
echo "###########################################################"
shutdown -r +1




