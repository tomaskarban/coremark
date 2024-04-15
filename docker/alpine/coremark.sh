#!/bin/ash
set -e
apk update
apk upgrade
apk add build-base git
git clone --depth=1 https://github.com/eembc/coremark.git
cd coremark
make XCFLAGS="-DMULTITHREAD=`nproc` -DUSE_FORK"
echo "------------------------------------------------------"
tail -n 2 run1.log
