#!/bin/sh
#set -e

#echo "========================================================"
#echo "!!      NOTE: you need 64-bit Java 8 installed.       !!"
#echo "!!      You should see your java version below.       !!"
#echo "!!         Or an error if it's not installed          !!"
#echo "!!            Make sure you have java 1.8             !!"
#echo "========================================================"
#echo
#java -Xmx2G -version
#echo
#echo If you see a "Could not reserve enough space for 2097152KB object heap" above, you need to install 64-bit java 8

#read -n 1 -p "Press any key to continue..."
#echo

#wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar -O installer.jar
java -jar installer.jar --installServer
echo "Install Complete, removing installer..."
rm installer.jar
echo "Server jar should be callable at forge-1.12.2-14.23.5.2847-universal.jar"
#echo Renaming forge to forge.jar...
#rm forge.jar || true
#mv forge-1.12.2-14.23.5.2847-universal.jar forge.jar
#echo
#echo "=========================================================="
#echo "!!      The server has been installed successfully.     !!"
#echo "!! Before running the server, you need to edit eula.txt !!"
#echo "!!          and change eula=false to eula=true          !!"
#echo "=========================================================="
#echo
#read -n 1 -p "Press any key to continue..."
#echo
echo "setting rcon password to" ${RCON} "..."
echo ${RCON} >> /minecraft/server.properties


#have to setup git for backups
if [[ ! -z "$GITURL" ]]; then
    echo "setting up git for backups..."
    (crontab -l 2>/dev/null; echo "*/10 * * * * ./minecraft/backup.sh")| crontab -
	crontab -l
fi
