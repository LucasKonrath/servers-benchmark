#!/usr/bin/bash

ulimit -n 65000
sudo sysctl -w net.ipv4.ip_local_port_range="1025 65535"
echo 300000 | sudo tee /proc/sys/fs/nr_open
echo 300000 | sudo tee /proc/sys/fs/file-max

./k6 run -e TEST=netty-mono -e URL='http://localhost:8080/r' --out dashboard=report=results/netty-mono-1k.html test.js 