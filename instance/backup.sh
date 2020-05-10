#!/bin/sh
cd /backups/Backup
git remote set-url origin https://${GITUSR}:${GITPASS}github.com/BTE-SB-Server/Backup.git
git push origin -f --allow-unrelated-histories