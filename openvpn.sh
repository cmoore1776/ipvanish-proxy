#!/bin/sh
cd /etc/openvpn
set -eu

: ${REGION:?"List of regions available at http://www.ipvanish.com/software/configs/"}
: ${USERNAME:?"Pass in '-e USERNAME='IPVANISH Username''"}
: ${PASSWORD:?"Pass in '-e PASSWORD='IPVANISH Password''"}

echo "$USERNAME" > auth.conf
echo "$PASSWORD" >> auth.conf

chmod 600 auth.conf

service tinyproxy start

openvpn \
  --config "${REGION}.ovpn" \
  --auth-user-pass auth.conf \
  --mute-replay-warnings