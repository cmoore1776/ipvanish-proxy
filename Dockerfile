FROM ubuntu:18.04

RUN \
  apt-get update && apt install -y \
    curl \
    unzip \
    network-manager-openvpn \
    tinyproxy && \
  cd /etc/openvpn && \
  curl https://www.ipvanish.com/software/configs/configs.zip -o configs.zip && \
  unzip configs.zip && \
  apt-get remove -y \
    curl \
    unzip && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY openvpn.sh openvpn.sh
COPY config /etc/tinyproxy/tinyproxy.conf

ENV REGION='' USERNAME='' PASSWORD=''

EXPOSE 8888

CMD sh openvpn.sh