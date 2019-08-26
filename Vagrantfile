# -*- mode: ruby -*-
# vi: set ft=ruby :

$linux_provisioning_script = <<-SCRIPT
echo "Installing VBox Guest Additions..."
yum -y update 
yum -y install gcc dkms kernel-devel-$(uname -r) kernel-headers make bzip2
wget -c http://download.virtualbox.org/virtualbox/6.0.6/VBoxGuestAdditions_6.0.6.iso -O /opt/VBoxGuestAdditions.iso
mount /opt/VBoxGuestAdditions.iso -o loop /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
echo "... Done."
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.define "centos7" do |centos7|
    centos7.vm.box = "geerlingguy/centos7"
    centos7.vm.hostname = 'centos7'
    centos7.vm.box_check_update = true
    centos7.vm.network "private_network", ip: "192.168.33.50"
    centos7.vm.synced_folder ".", "/vagrant"
    centos7.vm.provider "virtualbox" do |v|
      v.gui = false
      v.customize ["modifyvm", :id, "--memory", 5000]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--vram", 128]
      v.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    end
    # centos7.vm.provision "shell", inline: $linux_provisioning_script
  end
end

