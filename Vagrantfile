# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./www", "/var/www/", type: "nfs"
  config.vm.hostname = "vagrant"

  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.limit = "all"
  end

end
