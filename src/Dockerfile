FROM ubuntu:22.04

RUN apt update && apt -y install wget openjdk-17-jre git
RUN mkdir /minecraft
RUN mkdir /minecraft/data
RUN mkdir /minecraft/plugins

WORKDIR /minecraft

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar /minecraft/BuildTools.jar --rev=1.20.1
RUN mv $(ls spigot-*) spigot.jar

# Multistaged
FROM openjdk:17

ENV MC_VERSION=1.20.1
ENV MC_MEM_MIN=1G
ENV MC_MEM_MAX=1G

RUN mkdir /minecraft
RUN mkdir /minecraft/data
RUN mkdir /minecraft/data/plugins
WORKDIR /minecraft
COPY --from=0 /minecraft/spigot.jar spigot.jar
RUN cd /minecraft/data && ln -s /minecraft/spigot.jar spigot.jar
RUN ls /minecraft/data

ADD ./entrypoint.sh ./entrypoint.sh
ADD ./server.properties /minecraft/server.properties.template
RUN chmod 770 ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
