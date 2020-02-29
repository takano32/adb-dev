#!/bin/bash
# some steps found here: http://android.serverbox.ch/?p=1217
#

set -xe

BRANCH=android-5.1.1_r38
# BRANCH=android-10.0.0_r29

sudo apt-get install libssl-dev

mkdir ~/adb-dev/build-$BRANCH
cd ~/adb-dev/build-$BRANCH

mkdir system
mkdir external

cd system/                
git clone -q -b $BRANCH --depth 1 https://android.googlesource.com/platform/system/core
git clone -q -b $BRANCH --depth 1 https://android.googlesource.com/platform/system/extras

cd ../external/                 
git clone -q -b $BRANCH --depth 1 https://android.googlesource.com/platform/external/zlib
git clone -q -b $BRANCH --depth 1 https://android.googlesource.com/platform/external/openssl
git clone -q -b $BRANCH --depth 1 https://android.googlesource.com/platform/external/libselinux

cd ../system/core/adb

cp ~/adb-dev/Makefile.adb ./Makefile

pwd
echo "Ready to hit *make* now and pray?"
read -rsp $'Press any key to continue...\n' -n1 key

