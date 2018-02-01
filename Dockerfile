FROM mcreations/openwrt-x64:latest 

LABEL maintainer="Ioanna M. Dimitriou <dimitriou@m-creations.com>"
LABEL description="Fluent-bit docker image on top of openWRT"
LABEL vendor="mcreations"

ENV FLUENTBIT_USER="fluent-bit"
ENV FLUENTBIT_GROUP="${FLUENTBIT_USER}"
ENV FLUENTBIT_NAME="fluent-bit"
ENV FLUENTBIT_HOME="/opt/${FLUENTBIT_NAME}"
ENV FLUENTBIT_CONFIG_DIR="${FLUENTBIT_HOME}/config"


ENV ES_LOCATION="localhost"
ENV ES_PORT="9200"
ENV INDEX_NAME="fluentbit"
ENV INDEX_TYPE="string"

VOLUME /data

COPY mnt ${FLUENTBIT_HOME}

RUN echo "${FLUENTBIT_USER}:*:100:100::${FLUENTBIT_HOME}:/bin/bash" >> /etc/passwd && \
    mkdir -p "${FLUENTBIT_HOME}/conf" && \
    chown "${FLUENTBIT_USER}" "${FLUENTBIT_HOME}"

EXPOSE 24224 5140

COPY src/fluent-bit/build/bin/fluent-bit ${FLUENTBIT_HOME}
COPY src/fluent-bit/conf ${FLUENTBIT_HOME}/conf

RUN chmod +x "${FLUENTBIT_HOME}/start-fluentbit.sh"

USER ${FLUENTBIT_USER}

CMD ["${FLUENTBIT_HOME}/start-fluentbit.sh"] 
