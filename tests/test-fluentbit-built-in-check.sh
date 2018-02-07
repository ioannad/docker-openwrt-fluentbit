#!/bin/sh

# set -x # uncomment for debugging

echo "Testing with internal check. This might take a while."

docker run -d --name test-0 docker-openwrt-fluentbit

sleep 140

TEST_STRING="$(docker logs test-0 | grep '{"this is"=>"dummy data"}')"

if [ "${TEST_STRING}" == "" ]
then
  echo "Docker logs is not showing any dummy data. This could be due to the container taking longer or because of an actual error. Please investigate."
  docker stop test-0
  docker rm test-0
  exit 1
else 
  echo "Dummy data found, passed internal check test."
fi

docker stop test-0
docker rm test-0
