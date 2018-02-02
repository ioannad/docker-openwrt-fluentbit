#!/bin/sh

echo "Starting fluentbit with elasticsearch plugin." 
echo "See documentation here:"
echo 'http://fluentbit.io/documentation/current/output/elasticsearch.html'

if [ "${FLUENTBIT_CONFIG_FILE}" == "" ]
then echo "No config file given, starting Fluent-bit with the test config."
     echo "To start Fluent-bit with a config file <FOO.conf>, place it in ./mnt/conf"
     echo "and start the container with the option: -e FLUENTBIT_CONFIG_FILE=<FOO.conf>"
     FLUENTBIT_CONFIG_FILE="test-config.conf"
else echo "Starting Fluent-bit with configuration file ${FLUENTBIT_CONFIG_FILE}, in container dir ${FLUENTBIT_CONFIG_DIR}."
fi

${FLUENTBIT_HOME}/fluent-bit -c ${FLUENTBIT_CONFIG_DIR}/${FLUENTBIT_CONFIG_FILE}  \
                 es://${ES_LOCATION}:${ES_PORT}/${INDEX_NAME}/${INDEX_TYPE}

