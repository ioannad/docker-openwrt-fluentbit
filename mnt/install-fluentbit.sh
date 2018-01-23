#!/bin/sh

# This script fully installs fluent-bit into a docker container made from the mcreations/openwrt-x64
# image. 

# set -x # uncomment for debugging

# The following environment variables are only used in this script. 

FILE="fluent-bit-${FLUENTBIT_MINOR_VERSION}.tar.gz"
URL="http://fluentbit.io/releases/${FLUENTBIT_MAJOR_VERSION}/${FILE}"

# install necessary packages



# create user and relevant directories

mkdir -p "${FLUENTBIT_HOME}"
usr/sbin/useradd -d "${FLUENTBIT_HOME}" -m -s /bin/sh -U "${FLUENTBIT_USER}"
cp /root/.bashrc "${FLUENTBIT_HOME}"

echo 'alias hostname="echo $HOSTNAME"' >> /etc/profile

# download fluentbit 

cd "${FLUENTBIT_HOME}"
wget -c "${URL}"

# check hash?? Find the official checksum and check it.

# install fluentbit 

tar -C "${FLUENTBIT_HOME}" -xvzf "${FILE}"

# clean up

rm /tmp/opkg-lists/*
opkg remove shadow-groupadd shadow-useraddy

