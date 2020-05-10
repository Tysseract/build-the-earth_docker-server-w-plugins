FROM openjdk:8-alpine

LABEL maintainer="Tys vanZeyl <tys@tysseract.net>" \
  org.label-schema.name="BTE SB" \
  org.label-schema.version="1.12.2" \
  org.label-schema.vendor="Tys vanZeyl" \
  org.label-schema.schema-version="1.0"

VOLUME ["/minecraft"]

EXPOSE 25565 25575 8123

WORKDIR /minecraft

CMD ["/bin/s6-svscan", "/etc/s6"]

RUN apk update && \
  apk upgrade && \
  rm -rf /var/cache/apk/*

ENV MINECRAFT_VERSION 1.12.2

ENV FORGE_VERSION 14.23.5.2847
ENV FORGE_JAR forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar

ADD https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar installer.jar

COPY BTE_Official_Server_MAC/* /minecraft/

#RUN curl --create-dirs -sLo /minecraft/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar ${FORGE_URL}
  
RUN cd /minecraft/ && \
  java -jar installer.jar --installServer && \
  rm -f installer.jar && \
  rm forge.jar || true && \
  mv forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-universal.jar forge.jar
  
COPY plugins/* /minecraft/mods/

#options
ENV EULA true
ENV Xss 6M
ENV Xmx 6G
ENV Xms 4G

RUN cd /minecraft && \
  echo ${EULA} > eula.txt
 
ENTRYPOINT ["/minecraft/run.sh"]
 