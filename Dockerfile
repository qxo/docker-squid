FROM ubuntu:trusty
#MAINTAINER sameer@damagehead.com

RUN  \ 
 apt-get update &&  apt-get install -y squid3  && \
 mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist &&  \
   rm -rf /var/lib/apt/lists/* # 20150504

EXPOSE 3128

#ADD squid.conf /etc/squid3/squid.conf
#ADD start /start

ADD custom/ /

RUN chmod 755 /start

VOLUME [/var/spool/squid3]

CMD [/start]
