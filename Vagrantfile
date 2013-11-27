# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Machine setup
  config.vm.box = "precis64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "10.33.33.13"
  config.vm.synced_folder "../../Cookbooks", "/opt/cookbooks"

  # Update packages
  config.vm.provision :shell, :inline => "sudo apt-get update -y"

  # Provision using Berkshelf
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.vm.provision :shell, :inline => "gem install chef --no-rdoc --no-ri --conservative"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[nmap]"
    ]
  end
end
