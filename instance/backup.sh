#!/bin/sh
echo "Starting backup to remote"
cd /backups/Backup
echo "removing old origin"
git remote rm origin  || true
echo "adding origin"${GITURL}
git remote add origin ${GITURL}
echo "pushing"
git push origin -f --allow-unrelated-histories