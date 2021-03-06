FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get install -y  nano \
                        gcc \
                        libtool \
                        libtool-bin \
                        libdbus-1-dev \
                        python3-pyqt4 \
                        gtk2-engines-pixbuf \
                        sane-utils \
                        avahi-utils \
                        sane \
                        libsane-dev \
                        libcups2-dev \
                        cups-bsd \
                        cups-client \
                        libjpeg62-turbo-dev \
                        libcupsimage2 \
                        libcupsimage2-dev \
                        libsnmp-dev \
                        snmp \
                        libusb-1.0-0-dev \
                        g++ \
                        libtool \
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
                        libgsnmp0 \
                        libgsnmp0-dev \
                        libssl-dev \
                        libusb-1.0-0 \
                        libpthreads-mingw-w64 \
                        libcupsimage2 \
                        hplip


ENV S6_OVERLAY_VERSION=v1.21.7.0

RUN curl --fail -sSL -O https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-armhf.tar.gz \
    && gunzip -c s6-overlay-armhf.tar.gz | tar -xf - -C / \
    && rm s6-overlay-armhf.tar.gz

RUN adduser saned lp

COPY rootfs /

VOLUME /var/lib/hp
VOLUME /usr/share/cups
VOLUME /usr/share/ppd
VOLUME /usr/share/hplip
VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631


CMD ["/init"]
