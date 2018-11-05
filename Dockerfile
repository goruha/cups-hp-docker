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
                        libgsnmp0 \
                        libgsnmp0-dev \
                        libssl-dev \
                        libusb-1.0-0 \
                        libpthreads-mingw-w64 \
                        libcupsimage2 \
                        hplip \
                        sane-utils \
                        avahi-utils \
                        sane

ENV S6_OVERLAY_VERSION=v1.21.2.2

RUN curl --fail -sSL -O https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    && gunzip -c s6-overlay-amd64.tar.gz | tar -xf - -C / \
    && rm s6-overlay-amd64.tar.gz

RUN useradd ${CUPS_USER_ADMIN} --system -G root,lpadmin --no-create-home --password ${CUPS_USER_PASSWORD}
RUN adduser saned lp

COPY rootfs /

VOLUME /usr/share/hplip/data
VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

EXPOSE 631


CMD ["/start.sh"]
