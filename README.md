Setup VM basics
---------------
Install git, ruby and chef inside a fresh and blank Ubuntu VM/Server.

    sudo apt-get update && sudo apt-get install -y curl
    curl -L https://raw.github.com/spider-network/ubuntu-vm-basics/master/fetch |bash
    cd ~/ubuntu-vm-basics && ./installer

**Step by step instruction:** [How to use it!](#how-to-use-it)

* Git 1.8.0.2
* Ruby 1.9.3-p362 (System)
* Bundler 1.2.3
* Chef 10.16.4
* RVM 1.17.4
  * Ruby 1.9.3-p362 (Default)
  * Ruby 1.9.3-p327
  * Ruby 1.9.3-p194


### How to use it!
Requirements [VirtualBox](https://www.virtualbox.org/) and [Ruby](http://www.ruby-lang.org/en/) with RubyGems have installed on your system.

#### Install the vagrant gem
    $> gem install vagrant
    $> mkdir -p ~/vms/vagrant/boxes
    $> cd ~/vms/vagrant/boxes && wget http://files.vagrantup.com/precise64.box
    $> cd ~/vms/vagrant && vagrant box add ubuntu_precise64 boxes/precise64.box

#### Init new project
    $> mkdir -p ~/vms/vagrant/vm-001
    $> cd ~/vms/vagrant/vm-001
    $> vagrant init ubuntu_precise64
    $> vagrant up
    $> vagrant ssh
    vagrant@precise64:~$ sudo apt-get update && sudo apt-get install -y curl
    vagrant@precise64:~$ curl -L https://raw.github.com/spider-network/ubuntu-vm-basics/master/fetch |bash
    vagrant@precise64:~$ cd ~/ubuntu-vm-basics && ./installer

**Now you can setup the vm/server with your own chef recipes.**

#### Save VM status
    $> mkdir .vagrantboxes
    $> vagrant package --output .vagrantboxes/vm_package_001_name.box
    

**Troubleshooting**

    The following SSH command responded with a non-zero exit status.
    Vagrant assumes that this means the command failed!

    mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` v-root /vagrant

See: http://vagrantup.com/v1/docs/troubleshooting.html

    lsmod | grep vboxsf
    sudo /etc/init.d/vboxadd setup

    
#### Teardown
    $> vagrant suspend
    $> vagrant halt
    $> vagrant destroy

With `vagrant up` and `vagrant ssh` you have a brand fresh VM.


#### Vagrant doc links
* [Getting Started](http://vagrantup.com/v1/docs/getting-started/index.html)
  * [teardown](http://vagrantup.com/v1/docs/getting-started/teardown.html)

### Good Weblinks
* [Railscasts.com Episode 292](http://railscasts.com/episodes/292-virtual-machines-with-vagrant)
* [Available Vagrant Boxes](http://www.vagrantbox.es)
