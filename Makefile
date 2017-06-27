SHELL=/bin/bash
.DEFAULT_GOAL := help

help:
	cat README.md

clean:
	if [ -d ~/vagrant ]; then rm -rf ~/vagrant && mkdir ~/vagrant; fi

install:
	if [ ! -d ~/vagrant ]; then mkdir ~/vagrant; fi
	install -m 0644 vagrant/Vagrantfile ~/vagrant/Vagrantfile
	if [ ! -d ~/vagrant/cookbooks ]; then mkdir ~/vagrant/cookbooks; fi
	cp -r chef/cookbooks/simple_web ~/vagrant/cookbooks
	if [ ! -d ~/vagrant/scripts ]; then mkdir ~/vagrant/scripts; fi
	install -m 0755 scripts/shop_supermarket.sh ~/vagrant/scripts/shop_supermarket.sh
	~/vagrant/scripts/shop_supermarket.sh
