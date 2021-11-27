#!/bin/bash

docker build . --no-cache -t vpn
docker run -it --name vpn-test1 --privileged -e "VPNADDR=vpn.ssa-br.com:10443" -e "VPNUSER=marco.queiroz" -e "VPNPASS=PASS" -p 22222:22 vpn:latest