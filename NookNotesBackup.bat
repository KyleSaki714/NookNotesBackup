:: Nook Notes Backup
:: Kyle Santos 3-20-2022
:: TODO: remove the "file:///media/Books/" prefix
:: theres no string manipulation, regex, anything in batch so i give up it works
:: https://forum.xda-developers.com/t/nst-manual-rooting-adb-gapps-1-1-etc.1380400/#post-20069243
:: batch: https://stackoverflow.com/questions/69068/split-long-commands-in-multiple-lines-through-windows-batch-file
@echo off
Rem Takes in adb.exe, nook backup files, and sqlite directories as parameters, then runs sqlite3 query to backup user notes to csv file. 
:: cant be bothered to parameterize it just replace the dirs with your own

set adbdir="C:\Program Files (x86)\Minimal ADB and Fastboot>"
:: places your Nook's database files in a new dir here
set nookdir="C:\Users\kyles13\Documents\Nook Stuff"
:: dir with the exe
set sqlite3dir="C:\Users\kyles13\Documents\Programs\sqlite-tools-win32-x86-3380100"

echo "NookNotesBackup - KyleSaki714 2022"
:: echo "Please input "

:: cd to adb
cd %adbdir%

:: script from dude from xda
adb devices
adb shell "mount -o remount,rw /dev/block/mmcblk0p5 /system"
:: adb shell "exit"
adb pull /data/data/com.bn.nook.reader.activities/databases/ %nookdir%

:: cd to sqlite
cd %sqlite3dir%
:: run query on database, output to csv file
sqlite3.exe "C:\Users\kyles13\Documents\Nook Stuff\databases\annotations.db" < "C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\NNB_Queries.sql" > "C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\NookNotes.csv"

::https://stackoverflow.com/questions/13219628/batch-replace-a-line-in-a-text-file
:: loop through the resulting file and remove the prefix "file:///media/Books/" from File attr
:: > C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\NookNotes.csv (
::    for /F "tokens=*" %%A in  (C:\Users\kyles13\Documents\Programming_Stuff\NookNotesBackup\PreNookNotes.csv) do (
        
::    )
::)



echo "Done, there ya go"