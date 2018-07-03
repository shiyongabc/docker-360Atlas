#
# Dockerfile for 360Atlas
#

FROM ubuntu:14.04

#更新系统
RUN apt-get update
RUN apt-get update -y

#安装 wget
RUN apt-get install -y wget

#安装 mysql 客户端
RUN apt-get install -y mysql-client-5.6

#下载并安装 Atlas 2.2
COPY Atlas-2.2-debian7.0-x86_64.deb /Atlas-2.2-debian7.0-x86_64.deb
RUN chmod +x /Atlas-2.2-debian7.0-x86_64.deb
RUN dpkg -i  /Atlas-2.2-debian7.0-x86_64.deb

#移除 wget
RUN apt-get remove -y wget

#公开 Atlas 的配置文件
VOLUME /usr/local/mysql-proxy/conf/

#公开 Atlas 的端口，1234是代理端口，2345是管理端口
EXPOSE 1234
EXPOSE 2345

#运行 Atlas，并利用持续打印 Atlas 日志
CMD /usr/local/mysql-proxy/bin/mysql-proxyd docker-atlas start && tail -f /usr/local/mysql-proxy/log/docker-atlas.log
