# vi: set ft=ruby ts=2 :
Vagrant.configure("2") do |config|
  config.vm.define "master", primary: true do |master|
    master.vm.box = "geerlingguy/ubuntu1604"
    master.vm.network "private_network", type: "static", ip: "172.28.128.3"
    master.vm.hostname = "pgmaster"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "pgmaster"
      vb.memory = 2048
      vb.cpus = 1
    end
  end
  config.vm.define "slave" do |slave|
    slave.vm.box = "geerlingguy/ubuntu1604"
    slave.vm.network "private_network", type: "static", ip: "172.28.128.4"
    slave.vm.hostname = "pgslave"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "pgslave"
      vb.memory = 2048
      vb.cpus = 1
    end
  end
end
