#!/bin/sh

# set -x # uncomment for debugging

echo "Testing with external config file. This might also take a while."

mkdir bar
cp src/fluent-bit/conf/in_dummy.conf bar/foo.conf
sed -i 's/Dummy {"this is":"dummy data"}/Dummy {"foo":"bar"}/1' bar/foo.conf
sed -i 's/Flush        5/Flush        1/1' bar/foo.conf

cat bar/foo.conf 

CURRENT_DIR="$(pwd)"
echo "current dir: $CURRENT_DIR"

docker run -d --name test-1 -v "${CURRENT_DIR}/bar/foo.conf":/opt/fluent-bit/foo.conf -e FLUENTBIT_CONFIG_FILE=/opt/fluent-bit/foo.conf docker-openwrt-fluentbit

sleep 140

TEST_STRING="$(docker logs test-1 | grep '{"foo"=>"bar"}')"

if [ "${TEST_STRING}" == "" ]
then
  echo "Docker logs is not showing any dummy data. This could be due to the container taking longer or because of an actual error. Please investigate."
  docker stop test-1
  docker rm test-1
  exit 1
else 
  echo "Modified dummy data found, passed external config tets."
fi

docker stop test-1
docker rm test-1
rm -rd bar
