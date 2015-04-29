# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "phpacker-trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.synced_folder "./www", "/var/www/", type: "nfs"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.hostname = "phpdevbox"

  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.limit = "all"
  end

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    # Require YAML module
    require 'yaml'

    # Read YAML file with box details
    sites = YAML.load_file('provisioning/variables/nginx.yml')

    domains = []

    # Iterate through entries in YAML file
    sites['nginx_sites'].each do |site|
      domains.push(site['site']['server_name'])
    end

    config.hostsupdater.aliases = domains
  end

  config.ssh.forward_agent = true

end
