#!/bin/sh

echo "Starting fluentbit"

if [ "${FLUENTBIT_CONFIG_FILE}" == "" ]
then echo "No config file given, starting Fluent-bit with the test config: in_dummy.conf"
     echo "To start Fluent-bit with another config file, say FOO.conf, place it in a directory, for example in ./BAR/ and start the container with the option:"
     echo "-v /full/path/to/BAR/FOO.conf:${FLUENTBIT_HOME}/FOO.conf -e FLUENTBIT_CONFIG_FILE=${FLUENTBIT_HOME}/FOO.conf"
     FLUENTBIT_CONFIG_FILE="${FLUENTBIT_CONFIG_DIR}/in_dummy.conf"
else echo "Starting Fluent-bit with configuration file ${FLUENTBIT_CONFIG_FILE}"
fi

${FLUENTBIT_HOME}/fluent-bit -c ${FLUENTBIT_CONFIG_FILE}

