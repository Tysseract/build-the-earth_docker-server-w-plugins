FROM openjdk:8-alpine

LABEL maintainer="Tys vanZeyl <tys@tysseract.net>" \
  org.label-schema.name="build-the-earth_docker-server-w-plugins" \
  org.label-schema.version="1.12.2" \
  org.label-schema.vendor="Tys vanZeyl" \
  org.label-schema.schema-version="1.3"

EXPOSE 25565 25575 8123

WORKDIR /minecraft
VOLUME ["/minecraft"]

CMD ["/bin/s6-svscan", "/etc/s6"]

RUN apk update && \
  apk upgrade && \
  apk add git less openssh && \
#  apk add openrc && \
#  apk add cron && \
#  apk add busybox-initscripts && \
  rm -rf /var/cache/apk/*

ENV MINECRAFT_VERSION 1.12.2

ENV FORGE_VERSION 14.23.5.2847
ENV FORGE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar


COPY instance/. /minecraft/

ADD https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar /minecraft/installer.jar

#COPY SpongeBootstrap-0.7.1.jar /minecraft/SpongeBootstrap-0.7.1.jar

COPY plugins/. /minecraft/mods/

#options
ENV EULA false
ENV Xss 6M
ENV Xmx 6G
ENV Xms 4G
ENV RCON ChangeMe

#git backup
#COPY backup.sh /etc/periodic/15min/backup
#ENV GITURL https://{GITUSR}:{GITPASS}@github.com/BTE-SB-Server/Backup.git

RUN cd /minecraft && \
  echo "eula="${EULA} > /minecraft/eula.txt && \
  chmod +x /minecraft/run.sh && \
  chmod +x /minecraft/install.sh
  #chmod +x /etc/periodic/15min/backup
  
RUN ["chmod", "+x", "/minecraft/run.sh"]
RUN ["chmod", "+x", "/minecraft/install.sh"]
#RUN ["chmod", "+x", "/etc/periodic/15min/backup"]

ENTRYPOINT ["/minecraft/run.sh"]
