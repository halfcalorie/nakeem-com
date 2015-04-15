#!/bin/bash
#Based in information available at 
#http://www.58bits.com/blog/2014/01/09/ssh-and-sftp-chroot-jail

#sudo tar -xzvf /vagrant/chroot.tar.gz -C /

#Create our directories
sudo mkdir /chroot
sudo mkdir -p /chroot/{dev,etc,lib,lib64,usr,bin,home}
sudo mkdir -p /chroot/usr/bin
 
#Set owner
sudo chown root:root /chroot
 
#Needed for the OpenSSH ChrootDirectory directive to work
sudo chmod go-w /chroot

#First the binaries
cd /chroot/bin
sudo cp /bin/bash .
sudo cp /bin/ls .
 
#Now our l2chroot script to bring over dependencies
sudo /vagrant/l2chroot.sh /bin/bash
sudo /vagrant/l2chroot.sh /bin/ls

# clear command
cd /chroot/usr/bin
sudo cp /usr/bin/clear .
sudo /vagrant/l2chroot.sh /usr/bin/clear
#Add terminal info files - so that clear, and other terminal aware commands will work.
cd /home/jail/lib
sudo cp -r /lib/terminfo .

