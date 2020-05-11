#!/bin/sh
echo "waiting 5 minutes to start first backup to remote"
  sleep 5m
  echo "Starting backup to remote"
  echo "Starting backup to remote" >> /backups/log.txt
  cd /backups/Backup
  echo "removing old origin" >> /backups/log.txt
  git remote rm origin  || true
  echo "adding origin"${GITURL} >> /backups/log.txt
  git remote add origin ${GITURL} >> /backups/log.txt
  echo "pushing"
  git push origin -f --allow-unrelated-histories >> /backups/log.txt
while [ true ]
do
  echo "waiting 15 minutes to push to remote"
  sleep 15m
  echo "pushing"
  git push origin -f --allow-unrelated-histories >> /backups/log.txt
done
