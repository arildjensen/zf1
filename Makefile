SHELL=/bin/bash
.DEFAULT_GOAL := help

help:
	cat README.md

clean:
	if [ -d ~/vagrant ]; then rm -rf ~/vagrant && mkdir ~/vagrant; fi

install:
	if [ ! -d ~/vagrant ]; then mkdir ~/vagrant; fi
	install vagrant/Vagrantfile ~/vagrant/Vagrantfile
	if [ ! -d ~/vagrant/cookbooks ]; then mkdir ~/vagrant/cookbooks; fi
	cp -r chef/cookbooks/simple_web ~/vagrant/cookbooks
	install scripts/shop_supermarket.sh ~/vagrant 
