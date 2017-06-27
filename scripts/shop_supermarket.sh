#!/bin/bash

cd ~/vagrant/cookbooks

cookbooks=(apache2 prometheus )

for i in "$cookbooks"; do
  knife cookbook site download $i;
done

for i in *.tar.gz; do
  tar xzvf $i;
done;

rm -rf *.tar.gz

exit 0
