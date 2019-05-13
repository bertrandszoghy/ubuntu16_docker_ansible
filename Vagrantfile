
$script = <<SCRIPT
set -x
/vagrant/setup.sh

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  
  config.vm.provider "virtualbox"
  config.vm.provision "shell", privileged: false, inline: $script
end