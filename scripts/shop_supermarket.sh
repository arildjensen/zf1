#!/bin/bash

cd cookbooks
knife cookbook site download apache2
knife cookbook site download prometheus

for i in *.tar.gz; do
  tar xzvf $i;
done;

rm -rf *.tar.gz

exit 0
