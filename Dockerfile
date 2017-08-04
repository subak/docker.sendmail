FROM debian:stretch

RUN apt-get update && apt-get install -y \
    ssmtp \
    incron

RUN rm /etc/incron.allow

COPY send_and_remove.sh /root/sendmail/bin/send_and_remove.sh
COPY root /var/spool/incron
COPY docker-entrypoint.sh /usr/local/bin

VOLUME ["/root/sendmail/queue"]

ENTRYPOINT ["docker-entrypoint.sh","/root/sendmail/queue"]

CMD ["incrond","--foreground"]
