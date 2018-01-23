FROM mcreations/openwrt-x64:latest 

LABEL maintainer="Ioanna M. Dimitriou <dimitriou@m-creations.com>"
LABEL version="0.12.11"
LABEL description="Fluent-bit docker image on top of openWRT"
LABEL vendor="mcreations"

ENV FLUENTBIT_MAJOR_VERSION="0.12"
ENV FLUENTBIT_MINOR_VERSION="0.12.11"
ENV FLUENTBIT_USER="fluentbit"
ENV FLUENTBIT_GROUP="${FLUENTBIT_USER}"
ENV FLUENTBIT_HOME="/opt/${FLUENTBIT_USER}"
ENV FLUENTBIT_CONFIG_DIR="/opt/fluent-bit/config"

VOLUME /data

ADD mnt/ /mnt

RUN sh /mnt/install-fluentbit.sh

EXPOSE 24224 5140

CMD ["/mnt/start-fluentbit.sh"] 
