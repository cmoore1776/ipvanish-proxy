# ipvanish-proxy

A Docker image for ipvanish using tinyproxy and built from Ubuntu 20.04

## Usage

First, you must select an IPVanish config from https://www.ipvanish.com/software/configs/

Use the full name of the config, minus the `.ovpn` extention, as the `REGION` environment variable.

```
docker run --rm -it -p 127.0.0.1:8888:8888 -e REGION=ipvanish-US-Ashburn-iad-a01 -e USERNAME=my@email.com -e PASSWORD=MyPaSsWoRd --cap-add=NET_ADMIN --device=/dev/net/tun shamelesscookie/ipvanish-proxy
```

You now have a proxy running on 127.0.0.1:8888