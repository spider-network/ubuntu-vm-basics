Setup VM basics
---------------
Install git, ruby and chef inside a fresh and blank Ubuntu VM/Server.

    sudo apt-get install -y curl
    curl -L https://raw.github.com/spider-network/ubuntu-vm-basics/master/installer |bash

* Git 1.8.0.2
* Ruby 1.9.3-p327
* Bundler 1.2.3
* Chef 10.16.2


### Howto test it locally.
Requirements [VirtualBox](https://www.virtualbox.org/) and [Ruby](http://www.ruby-lang.org/en/) with RubyGems have installed on your system.

    $> gem install vagrant
    $> mkdir -p ~/vms/vagrant/boxes && mkdir -p ~/vms/vagrant/vm-001
    $> cd ~/vms/vagrant/boxes && wget http://files.vagrantup.com/precise64.box
    $> vagrant box add ubuntu_precise64 boxes/precise64.box
    $> cd ~/vms/vagrant/vm-001
    $> vagrant init ubuntu_precise64
    $> vagrant up
    $> vagrant ssh
    vagrant@precise64:~$ sudo apt-get install -y curl
    vagrant@precise64:~$ curl -L https://raw.github.com/spider-network/ubuntu-vm-basics/master/installer |bash

**Now you can setup the vm/server with your own chef recipes.**

### Good Weblinks
* [Railscasts.com Episode 292](http://railscasts.com/episodes/292-virtual-machines-with-vagrant)
* [Available Vagrant Boxes](http://www.vagrantbox.es)
