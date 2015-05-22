FROM ubuntu:latest
#MAINTAINER sameer@damagehead.com

RUN  cp  /etc/apt/sources.list  /etc/apt/sources.list.bak && \ 
   sed -i 's#http[:]//[^/]*/#http://mirrors.163.com//#g' /etc/apt/sources.list  &&  \ 
 apt-get update &&  apt-get install -y squid3  && \
 mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist &&  \
  \ 
 cat /etc/apt/sources.list.bak >  /etc/apt/sources.list  && rm -f  /etc/apt/sources.list.bak && \ 
  rm -rf /var/lib/apt/lists/* # 20150504

EXPOSE 3128

#ADD squid.conf /etc/squid3/squid.conf
#ADD start /start

ADD custom/ /

RUN chmod 755 /start

#VOLUME ["/var/spool/squid3"]

#CMD ["/start"]
