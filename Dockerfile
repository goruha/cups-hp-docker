FROM resin/rpi-raspbian

RUN apt-get update && \
    apt-get install -y  nano \
                        ca-certificates \
                        git \
                        openssl \
                        wget \
                        cups \
                        cups-pdf \
            			python-cups \
                        whois \
                        libcups2 \
                        make

COPY rootfs /

RUN /hplip.sh

VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631


CMD ["/start.sh"]