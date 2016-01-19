FROM ubuntu:14.04

RUN apt-get update &&\
    apt-get install -y lib32gcc1 wget

RUN groupadd -g 1500 steam
RUN useradd -m -u 1500 -g 1500 steam
USER steam

RUN mkdir ~/steamcmd
WORKDIR /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -zxvf steamcmd_linux.tar.gz
RUN ./steamcmd.sh +quit

#ENTRYPOINT ["/home/steam/steamcmd/.steamcmd.sh"]

