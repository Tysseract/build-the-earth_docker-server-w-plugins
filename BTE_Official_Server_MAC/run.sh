#!/bin/sh
if [[ ! -f forge.jar ]]; then
    echo "forge.jar missing, proceeding to install"
	./install.sh
fi
echo "setting eula to" ${EULA} "based on enviroment variable (-e EULA="${EULA}")"
echo "eula="${EULA} > /minecraft/eula.txt
cat /minecraft/eula.txt
java -XX:+UseG1GC -Xss${Xss} -Xmx${Xmx} -Xms${Xms} -XX:+DisableExplicitGC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Duser.language=en -Duser.country=US -jar forge.jar nogui