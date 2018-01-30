#!/bin/sh

echo "Starting fluentbit with elasticsearch plugin." 
echo "See documentation here:"
echo 'http://fluentbit.io/documentation/current/output/elasticsearch.html'

${FLUENTBIT_HOME}/fluent-bit -i cpu -t cpu -o es://${ES_LOCATION}:${ES_PORT}/${INDEX_NAME}/${INDEX_TYPE} -o stdout -m '*'
