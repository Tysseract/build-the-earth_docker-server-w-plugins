## A docker container on JDK 8 on Alpine Linux, with plugins!

### **IMPORTANT!**
#### RCON
```rcon is enabled on port 25575 as this is the only way to interact with the terminal (without plugins). 
The password is set during install with the enviroment variable RCON (default RCON=ChangeMe). 
It is very important that you include -e RCON=(your password) on initial install or block port 25575.
```
#### GITHUB BACKUP

The docker is setup to backup to the git upstream remote (e.g. github) repo at the url passed in with the enviroment variable GITURL.
It is highly recommended that you use this backup because accidentally "restart"ing instead of "start"ing a stopped container will reset the whole thing.
- If you *don't* want to backup, run the docker *without* `-e GITURL=`
- If you *do* want to backup, run the docker with the option `-e GITURL=(the repository url)`

**For password protected repos** which should be most, you can include the login in the url (i.e.: `-e GITURL=https://GITHUBUSERNAME:GITHUBPASSWORD@github.com/GITHUBUSERNAME/repo.git`). This is, admittedly, an **UNSECURE implementation** as the login information is stored in the enviroment variables of the docker container and therefore anyone with control of the container has control of the github account. It is for this reason that **you should ___not___ use your personal github** but instead create a new account for hosting the backup. If anyone else has a better way to implement this, feel free to submit a pull request :)
The plugin runs a backup commit every 30 minutes (as long as there has been changes to the world) and always one after the server loads, and the shell runs a git push every 15 minutes and always one 5 minutes after the server starts loading so there should always be a pushed backup 5 minutes after starting the server and a running max of 45 minutes between a change on the server and a push to the origin remote.

### reccomended docker run:
`docker run -p 25565:25565 -p 25575:25575 -e EULA=true --restart unless-stopped --name BTEP_Server -e RCON=YOURPASSWORD -e GITURL=https://GITHUBUSERNAME:GITHUBPASSWORD@github.com/GITHUBUSERNAME/repo.git btep:40`

### Build The Earth required mods:
- CubicChunks-1.12.2-0.0.1055.0-SNAPSHOT-all
- CubicWorldGen-1.12.2-0.0.115.0-SNAPSHOT-all
- terra121-0.1
- worldedit-forge-mc1.12.2-6.1.10-cc975.01-SNAPSHOT-dist

### Included Plugins:
- Aroma1997Core-1.12.2-2.0.0.2
- AromaBackup-1.12.2-2.1.1.4
- DiscordIntegration-mc1.12.2-3.0.5
- gitformat-3.0.0.0.b132
- landmanager-1.12.2-1.5.0
