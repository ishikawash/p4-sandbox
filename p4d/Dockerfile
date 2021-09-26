FROM ubuntu:focal

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add - && \
    echo "deb http://package.perforce.com/apt/ubuntu focal release" > /etc/apt/sources.list.d/perforce.list && \
    apt-get update

ARG P4PORT=ssl:1666
ARG P4ROOT=/opt/perforce/servers/master
ARG P4USER=root
ARG P4PASSWD=@brakadabra

ENV P4PORT=${P4PORT}
ENV P4ROOT=${P4ROOT}
ENV P4USER=${P4USER}
ENV P4PASSWD=${P4PASSWD}

RUN apt-get install -y helix-p4d

COPY files/run.sh /root/
EXPOSE 1666
CMD ["/root/run.sh"]
