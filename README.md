## A docker container on JDK 8 on Alpine Linux, with plugins!

### **IMPORTANT!**
```rcon is enabled on port 25575 as this is the only way to interact with the terminal (without plugins). 
The password is set during install with the enviroment variable RCON (default RCON=ChangeMe). 
It is very important that you include -e RCON=(your password) on initial install or block port 25575.
```
### reccomended docker run:
`docker run -p 25565:25565 -p 25575:25575 -e EULA=true --restart unless-stopped --name BTEP_Server -e RCON=YOURPASSWORD tysseract/build-the-earth_docker-server:1.2`

### Build The Earth required mods:
- CubicChunks-1.12.2-0.0.1055.0-SNAPSHOT-all
- CubicWorldGen-1.12.2-0.0.115.0-SNAPSHOT-all
- terra121-0.1
- worldedit-forge-mc1.12.2-6.1.10-cc975.01-SNAPSHOT-dist

### Included Plugins:
- Aroma1997Core-1.12.2-2.0.0.2
- AromaBackup-1.12.2-2.1.1.4
- DiscordIntegration-mc1.12.2-3.0.5
- Dynmap-3.0-beta-4-forge-1.12.2
- FastAsyncWorldEdit-forge111-16.12.27-2d295ef-455-9.24.5
- forgeessentials-1.12.2-12.3.82-server
- gitformat-3.0.0.0.b132
