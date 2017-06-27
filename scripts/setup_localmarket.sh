#!/bin/bash

if [ ! -d ~/localmarket ]; then
  exit 1
fi

if [ ! -d ~/vagrant/cookbooks ]; then
  exit 1
fi
cd ~/vagrant/cookbooks

for i in ~/localmarket/*.tar.gz; do
  tar xzvf $i;
done;

exit 0
