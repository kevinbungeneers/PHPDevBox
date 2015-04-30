# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "phpacker-trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.hostname = "phpdevbox"

  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
  end


  if Vagrant::Util::Platform.windows?

    config.vm.synced_folder ".", "/vagrant", type: "nfs"

    if File.exists?(File.join(Dir.home, ".ssh", "id_rsa"))
      # Read local machine's SSH Key (~/.ssh/id_rsa)
      ssh_key = File.read(File.join(Dir.home, ".ssh", "id_rsa"))
      # Copy it to VM as the /home/vagrant/.ssh/id_rsa key
      config.vm.provision :shell, :inline => "echo 'Windows-specific: Copying local SSH Key to VM for provisioning...' && mkdir -p /home/vagrant/.ssh && echo '#{ssh_key}' > /home/vagrant/.ssh/id_rsa && chmod 600 /home/vagrant/.ssh/id_rsa && chown vagrant /home/vagrant/.ssh/id_rsa"
    else
      # Else, throw a Vagrant Error. Cannot successfully startup on Windows without an SSH Key!
      raise Vagrant::Errors::VagrantError, "\n\nERROR: SSH Key not found at ~/.ssh/id_rsa (required on Windows)."
    end

    # Run ansible using vagrant as host
    config.vm.provision :shell, path: "provisioning/windows.sh"
  else

    config.vm.synced_folder "./www", "/var/www/", type: "nfs"
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "provisioning/site.yml"
      ansible.limit = "all"
    end
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
