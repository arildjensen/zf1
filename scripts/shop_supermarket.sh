#!/bin/bash

if [ ! -d ~/localmarket ]; then
  mkdir ~/localmarket;
fi
cd ~/localmarket

cookbooks=(apache2 consul build-essential nssm golang poise poise-archive poise-service seven_zip mingw windows ohai haproxy cpu compat_resource consul-template libarchive runit supervisor nssm )

for i in "${cookbooks[@]}"; do
  knife cookbook site download $i;
done

exit 0
