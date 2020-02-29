#!/bin/bash

# some steps found here: http://android.serverbox.ch/?p=1217

sudo apt-get install libssl-dev

mkdir ~/adb-dev/build-5.1.1
cd ~/adb-dev/build-5.1.1

mkdir system
mkdir external

cd system/                
git clone -b android-5.1.1_r1 https://android.googlesource.com/platform/system/core
git clone -b android-5.1.1_r1 https://android.googlesource.com/platform/system/extras

cd ../external/                 
git clone -b android-5.1.1_r1 https://android.googlesource.com/platform/external/zlib
git clone -b android-5.1.1_r1 https://android.googlesource.com/platform/external/openssl
git clone -b android-5.1.1_r1 https://android.googlesource.com/platform/external/libselinux

cd ../system/core/adb

cp ~/tmp/Makefile .

echo "Ready to hit *make* now and pray?"
read -rsp $'Press any key to continue...\n' -n1 key
