#!/bin/sh

export DROID_HOME=`pwd`
export ANDROID_PRODUCT_OUT=${DROID_HOME}/out/target/product/generic
export PATH=${DROID_HOME}/out/host/linux-x86/bin:$PATH

MYTTY=`tty|sed -e '/^\/dev\//s///'`
MYCLI=`w -u|grep "${MYTTY}"|awk '{ print $3 }'`
export DISPLAY=$MYCLI:0

YY_OPT="-debug-init"

#mulator -show-kernel -shell -memory 512 -logcat '*:S' -sdcard ~/bin/yy_sd.img |tee /run/shm/OyO.log
emulator ${YY_OPT} -show-kernel -shell -memory 768 -logcat '*:E' -sdcard ~/bin/yy_sd.img |tee /run/shm/OyO.log
