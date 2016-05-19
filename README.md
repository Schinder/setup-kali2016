# Repository: Setup-Kali-2016.1
### Author: Adam P. Schinder
** Purpose: I really just needed to automate the initial setup of my machines. If ever it needs to be re-done or whatever, these scripts will be on short stand-by - ready to get me back in the game! This might work on other x64 Debian Linux Builds - No guarantees! Run this little guy as root - less sudo stuff to worry about...
** NOTE: SOME ITEMS NEED SOME TYPING IN OF STUFF! READ THE DANG COMMENTS!
- date: 18 May 2016 - initial development  ... more like 19 May now...  it's really late...
- date: 19 May 2016 - changed some of the install scripts.
- date: 19 May 2016 - finalized the scripts to a four part install process.  Tested on VM. It works! Not sure about implications, but it's going on Github....

These are my personal setup scripts for a new installation of Kali Linux 2016.1.

I found myself spending a lot of time with the initial setup of my machines. Especially after some catastrophic event such as hardware failure or a nasty virus... I needed a set of scripts that could get me back on my feet quickly. Not to mention, something to use when provisioning another machine I may need to work on.

Now, these scripts aren't anything incredible. Honestly, they are mostly just install automations. I use Kali as a my personal desktop environment on many of my computers... So I wanted it to have all of the nifty features a desktop should have... email client, office suites... etc.

** WARNING!  You may not need every item in these scripts!
** WARNING!  Read the lines and comment out the stuff you don't want!
** NOTE: IE: You may or may not have a Brother MFC9340CDW printer.... 
** NOTE: If not, don't bother with anything beyond setup script 1 and 2.

Some items that users of Kali may appreciate:

- 1. You get hooked up with my favorite office suite - Kingsoft WPS (better than libre-office, IMHO)
- 2. You get the repo-maintained version of virtualbox
- 3. Want to burn a dvd?  Brasero is on there...
- 4. I don't know why Kali comes without Tor and the TorBrowser, but I have it in there...
- 5. For quick image cropping and so forth - Gthumb (it's as suitable a replacement for irfanview as I could find...)
- 6. Samba server is now good to go.  Please edit the smb.conf when prompted:

comment out the printer stuff with ';'
then type in :
[Public]
    comment = The Public Folder
    path = /root/Public
    browseable = yes
    guest ok = no
    valid users = root

- 7. Services tor, postgres, and samba are ready to go at startup! (Cups too if you go beyond script 1 and 2...)
- 8. If you happen to have a Brother Printer, this script ought to releive some of the stress you may have had with broken dependencies. I know when I ran their installer, it would flunk my system and I'd have to revert or start over... Now, I have that installer script commented out if you want to use it. However, I only have my cups wrapper and lpd installer on by default. This means if you happen to have a Brother MFC9340CDW - you are good to go. Others may need to tweak this a bit.
   
### Let me know what you think!


** WARNING! This software comes with no warranty! 
** WARNING! This is purely "use at your own risk"
** WARNING! I am not responsible for anything that happens to your system should you decide to run these!

