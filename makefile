# Folders
SERVER_CONFIG_DIR = $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SERVER_CONFIG_INSTALL_DIR = $(SERVER_CONFIG_DIR)
SERVER_CONFIG_VENDOR_DIR = $(SERVER_CONFIG_INSTALL_DIR)/vendor

# Programm versions
BUNDLER_VERSION = 1.2.3 		# http://rubygems.org/gems/bundler
GIT_VERSION = 1.8.0.2 			# http://code.google.com/p/git-core/downloads/list
RUBY_VERSION = 1.9.3-p327		# http://www.ruby-lang.org/de/downloads/

install:
	make install_main_packages
	make install_git
	make install_ruby
	make install_bundler
	make install_chef

install_main_packages:
	sudo apt-get update
	sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
	sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
	sudo apt-get -y install build-essential zlib1g-dev libssl-dev openssl libreadline6 libreadline6-dev libyaml-dev curl libcurl4-openssl-dev libexpat1-dev gettext htop wget screen

install_git:
	cp $(SERVER_CONFIG_VENDOR_DIR)/git-$(GIT_VERSION).tar.gz /tmp
	cd /tmp && tar -xvf git-$(GIT_VERSION).tar.gz
	cd /tmp/git-$(GIT_VERSION) && make prefix=/usr/local all && sudo make prefix=/usr/local install
	rm -rf /tmp/git-$(GIT_VERSION)

install_ruby:
	cp $(SERVER_CONFIG_VENDOR_DIR)/ruby-$(RUBY_VERSION).tar.bz2 /tmp
	cd /tmp && tar -xvf ruby-$(RUBY_VERSION).tar.bz2
	cd /tmp/ruby-$(RUBY_VERSION) && ./configure && make && sudo make install
	rm -rf $(SERVER_CONFIG_VENDOR_DIR)/ruby-$(RUBY_VERSION)

install_bundler:
	cd $(SERVER_CONFIG_VENDOR_DIR) && sudo gem install bundler-$(BUNDLER_VERSION).gem --local --no-rdoc --no-ri

install_chef:
	cd $(SERVER_CONFIG_INSTALL_DIR) && bundle install --local
