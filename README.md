<H2>A docker container on JDK 8 on Alpine Linux that supports adding plugins (eg: sponge, dynmap in plugins folder)</H2>

<H3>**IMPORTANT!**</H3>
```rcon is enabled on port 25575 as this is the only way to interact with the terminal (without plugins). 
The password is set during install with the enviroment variable RCON (default RCON=ChangeMe). 
It is very important that you include -e RCON=(your password) on initial install or block port 25575.
```
<H3>reccomended docker run:</H3>
`docker run -p 25565:25565 -p 25575:25575 -e EULA=true -e RCON=(YOURPASSWORD) --restart unless-stopped --name BTE_Server tysseract/build-the-earth_docker-server:latest`
