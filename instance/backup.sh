#!/bin/sh
echo "waiting 3 minutes to start first backup to remote"
sleep 5m
echo "Starting backup to remote"
echo "Starting backup to remote" >> /backups/log.txt
cd /backups/Backup
echo "removing old origin"
git remote rm origin  || true
echo "adding origin"${GITURL}
git remote add origin ${GITURL}
echo "pushing"
git push -f -u origin master
while [ true ]
do
  echo "waiting 15 minutes to push to remote"
  sleep 15m
  echo "pushing"
  git push origin -f >> /backups/log.txt
done
