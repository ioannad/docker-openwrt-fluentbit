#!/bin/sh

echo "Starting fluentbit with elasticsearch plugin." 
echo "See documentation here:"
echo 'http://fluentbit.io/documentation/current/output/elasticsearch.html'

if [ "${FLUENTBIT_CONFIG_FILE}" == "" ]
then echo "No config file given, starting Fluent-bit with the test config: in_dummy.conf"
     echo "To start Fluent-bit with another config file, say FOO.conf, place it in a directory, for example in /BAR and start the container with the option:"
     echo "-v BAR:/BAR -e FLUENTBIT_CONFIG_FILE=BAR/FOO.conf"
     FLUENTBIT_CONFIG_FILE="in_dummy.conf"
else echo "Starting Fluent-bit with configuration file ${FLUENTBIT_CONFIG_FILE}, in container dir ${FLUENTBIT_CONFIG_DIR}."
fi

${FLUENTBIT_HOME}/fluent-bit -c ${FLUENTBIT_CONFIG_DIR}/${FLUENTBIT_CONFIG_FILE}

