#!/bin/bash
clear
echo Installing Dependencies!
sudo apt-get update && sudo apt-get -y install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-7-jre openjdk-7-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib liblz4-* android-tools-adb android-tools-fastboot
clear
echo Dependencies have been installed
echo Downloading repo in 5 seconds
sleep 5
mkdir ~/bin
echo "export PATH=~/bin:$PATH" >> ~/.bashrc
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
clear
echo repo has been Downloaded!
echo Settings up USB Ports
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/snowdream/51-android/master/51-android.rules
sudo chmod 644   /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo service udev restart
adb kill-server
sudo killall adb
echo "Type your name, hit enter, then email, and hit enter"
read name
read email
git config --global user.name $name
git config --global user.email $email
echo Git has been configured
