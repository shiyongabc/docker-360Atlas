#
# Dockerfile for 360Atlas
#


FROM ubuntu:16.04
MAINTAINER kev<noreply@datageek.info>

WORKDIR /usr/local

RUN apt-get install wget
RUN wget https://github.com/Qihoo360/Atlas/releases/download/2.2/Atlas-2.2-debian7.0-x86_64.deb
RUN  apt-get remove wget
RUN  dpkg -i  Atlas-2.2-debian7.0-x86_64.deb
RUN  apt-get update & apt-get install mysql-client-5.6
RUN  sed -i '$a /usr/local/mysql-proxy/bin/mysql-proxyd test start' /etc/bash.bashrc