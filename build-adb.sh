#!/data/data/com.termux/files/usr/bin/bash

directory="$(pwd)"
echo
echo -e "\e[93mAdb-tools-minimal!"
echo
mkdir $PREFIX/tmp/adbtemp
mkdir $PREFIX/tmp/permtemp
mkdir $PREFIX/tmp/keytemp
keypath="$PREFIX/tmp/keytemp"
downpath="$PREFIX/tmp/adbtemp"
permpath="$PREFIX/tmp/permtemp"
echo -e "\e[32m[*] \e[34mDownloading binaries..."
wget https://github.com/Androidmate/Adb-tools-minimal/raw/master/bin/adb -P $downpath/ -q
wget https://github.com/Androidmate/Adb-tools-minimal/raw/master/bin/adb.bin -P $downpath/ -q
wget https://github.com/Androidmate/Adb-tools-minimal/raw/master/bin/fastboot -P $downpath/ -q
wget https://github.com/Androidmate/Adb-tools-minimal/raw/master/bin/fastboot-armeabi -P $downpath/ -q
wget https://github.com/Androidmate/Adb-tools-minimal/raw/develop/bin/perm.bin -P $permpath/ -q
wget https://github.com/Androidmate/Adb-tools-minimal/raw/develop/adbkey/authorized_keys -P $keypath/ -q
echo -e "\e[32m[*] \e[34mCopying files to directory..."
cp $downpath/* $PREFIX/bin
echo -e "\e[32m[*] \e[34mSetting up permissions..."
files="$(ls $downpath)"
su -c '/data/data/com.termux/files/usr/bin/bash $PREFIX/tmp/permtemp/perm.bin'
cd $PREFIX/bin
chmod +x $files
echo -e "\e[32m[*] \e[34mCreating workspace directory..."
cd $HOME
if [ ! -d "adbfiles" ]; then
  mkdir adbfiles
fi
echo -e "\e[32m[*] \e[34mCleaning up..."
cd $directory
rm -rf $downpath
rm -rf $permpath
rm -rf $keypath
#rm -rf build-adb.sh

echo
echo -e "\e[32mAdb-tools-minimal was successfully installed!\e[39m"
echo