##A docker container on JDK 8 on Alpine Linux, with plugins!

###**IMPORTANT!**
```rcon is enabled on port 25575 as this is the only way to interact with the terminal (without plugins). 
The password is set during install with the enviroment variable RCON (default RCON=ChangeMe). 
It is very important that you include -e RCON=(your password) on initial install or block port 25575.
```
###reccomended docker run:
`docker run -p 25565:25565 -p 25575:25575 -e EULA=true --restart unless-stopped --name BTE_Server -e RCON=(YOURPASSWORD) tysseract/build-the-earth_docker-server:1.1`
