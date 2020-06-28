#!/system/bin/sh

MARK=/data/local/symbol_thirdpart_apks_installed
PKGS=/vendor/preinstall/
LOGTEXT=/data/local/log.txt

#/system/xbin/daemonsu --auto-daemon &
if [ ! -e $MARK ]; then
touch $LOGTEXT
echo "booting the first time, so pre-install some APKs." >> /data/local/log.txt

echo "install kodi at first"
/system/bin/pm install /vendor/kodi/kdplayer18.4.apk
#/system/bin/pm install /vendor/kodi/kodi17.6.apk
#busybox mkdir /sdcard/Android
#busybox mkdir /sdcard/Android/data
#busybox unzip /vendor/kodi/org.xbmc.kodi.zip -o -q -d /sdcard/Android/data
#sync
#busybox find $PKGS -name "*\.apk" -exec sh /system/bin/pm install {} \;
APKLIST='ls /vendor/preinstall/*.apk'
for INFILES in $APKLIST
do
  echo $INFILES >> /data/local/log.txt
  /system/bin/pm install -r $INFILES
done
echo "OK, installation complete."
echo "OK, installation complete." >> /data/local/log.txt
touch $MARK
fi
