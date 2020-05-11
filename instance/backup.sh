#!/bin/sh
echo "Starting backup to remote"
echo "Starting backup to remote" > /backups/log.txt
cd /backups/Backup
echo "removing old origin" >> /backups/log.txt
git remote rm origin  || true
echo "adding origin"${GITURL} >> /backups/log.txt
git remote add origin ${GITURL} >> /backups/log.txt
echo "pushing" >> /backups/log.txt
git push origin -f --allow-unrelated-histories >> /backups/log.txt