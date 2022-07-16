#!/bin/sh
exec docker run \
--rm \
--tty \
--interactive \
--device=/dev/net/tun \
--name=openvpn-client \
--cap-add=NET_ADMIN \
--publish 127.0.0.1:1080:1080 \
--volume "$(realpath "$1"):/etc/openvpn/:ro" \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
kizzx2/openvpn-client-socks
