#!/bin/sh
 echo "BACKUP SYNC STARTED"
 #replace this with whatever backup script you use
 rsync -avz /home/minecraft/Civcraft/ /wherever/backup/civcraft
 echo "BACKUP SYNC COMPLETE"
 echo "STARTING SERVER"
 #get number of crash logs we start with
 startlogfiles=$(ls -l ./crash-reports/*.txt | wc -l)
 #replace this with your server java start command
 java -Xms4G -Xmx8G -XX:PermSize256M -jar spigot.jar nogui
 echo "SERVER STOPPED"
 #Check to see if we have any more log files
 endlogfiles=$(ls -l ./crash-reports/*.txt | wc -l)
 if [ "$endlogfiles" -gt "$startlogfiles" ]
  then
   echo "SERVER CRASH DETECTED, STOPPING SCRIPT"
  else
   echo "RESTARTING SCRIPT"
   ./start.sh
 fi

