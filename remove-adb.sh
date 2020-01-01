#!/data/data/com.termux/files/usr/bin/bash

echo
echo -e "\e[93mUninstalling Adb-tools-minimal"
echo -e "\e[32m[*] \e[34mRemoving binaries..."
rm -rf $PREFIX/bin/adb $PREFIX/bin/adb.bin $PREFIX/bin/fastboot $PREFIX/bin/fastboot-armeabi
echo -e "\e[32m[*] \e[34mRemoving keys..."
case `find $HOME/adbfiles -type f | wc -l` in
0 | 2)
  rm -rf $HOME/adbfiles ;;
*)
  rm -rf $HOME/adbfiles/adbkey $HOME/adbfiles/adbkey.pub ;;
esac
echo -e "\e[32m[*] \e[34mCleaning up..."
rm -rf remove-adb.sh
echo
echo -e "\e[32mAdb-tools-minimal was successfully uninstalled!\e[39m"
echo
