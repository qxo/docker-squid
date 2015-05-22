FROM ${BASE_IMAGE}
#MAINTAINER sameer@damagehead.com

RUN ${MIRROR_UPDATE} \ 
 apt-get update && \
 apt-get install -y squid3  && \\
 mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist &&  \\
 ${MIRROR_RESTORE} \
 rm -rf /var/lib/apt/lists/* # 20150504

EXPOSE 3128

#ADD squid.conf /etc/squid3/squid.conf
#ADD start /start

ADD custom/ /

RUN chmod 755 /start

VOLUME ["/var/spool/squid3"]

CMD ["/start"]
