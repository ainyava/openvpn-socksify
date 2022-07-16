# OpenVPN socksify
using OpenVPN and sockd to convert openvpn connection into a socks proxy server

## How to use
```
docker run -it --rm \
    --device=/dev/net/tun --cap-add=NET_ADMIN \
    --name openvpn-socksify \
    --volume /path/to/configs:/etc/openvpn/ -p 1080:1080 \
    openvpn-socksify
```

Note: your config folder can contain .ovpn configuration files.
