#!/bin/sh
cd /backups/Backup
git remote set-url origin ${GITURL}
git push origin -f --allow-unrelated-histories