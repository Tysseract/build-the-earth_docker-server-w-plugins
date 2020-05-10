#!/bin/sh
java -XX:+UseG1GC -Xss4M -Xmx4G -Xms4G -XX:+DisableExplicitGC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -Duser.language=en -Duser.country=US -jar forge.jar nogui
