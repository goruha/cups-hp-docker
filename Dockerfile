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
                        libcups2-dev \
                        python3-dev \
                        libjpeg9 \
                        libnetsnmp-devel \
                        libgsnmp0 \
                        libgsnmp0-dev \
                        libssl-dev \
                        libusb-1.0-0 \
                        libpthreads-mingw-w64 \
                        libcupsimage2 \
                        hplib \
                        sane-utils \
                        avahi-utils \
                        scanimage \

COPY rootfs /

VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631


CMD ["/start.sh"]