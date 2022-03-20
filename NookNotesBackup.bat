:: https://forum.xda-developers.com/t/nst-manual-rooting-adb-gapps-1-1-etc.1380400/#post-20069243
:: batch: https://stackoverflow.com/questions/69068/split-long-commands-in-multiple-lines-through-windows-batch-file


:: cd to adb
cd "C:\Program Files (x86)\Minimal ADB and Fastboot>"

:: script from dude from xda
adb devices
adb shell "mount -o remount,rw /dev/block/mmcblk0p5 /system"
:: adb shell "exit"
adb pull /data/data/com.bn.nook.reader.activities/databases/ "C:\Users\kyles13\Documents\Nook Stuff"

:: cd to sqlite
cd "C:\Users\kyles13\Documents\Programs\sqlite-tools-win32-x86-3380100"
sqlite3.exe "C:\Users\kyles13\Documents\Nook Stuff\databases\annotations.db" < "C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\NNB_Queries.sql" > "C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\NookNotes.csv"