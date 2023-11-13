Vagrant.configure("2") do |config|
  config.vm.define "vm1" do |vm1|
      vm1.vm.box = "spox/ubuntu-arm"
      vm1.vm.box_version = "1.0.0"
      vm1.vm.network "public_network", ip: "192.168.56.11"
      vm1.vm.synced_folder "localfiles/", "/home/vagrant/localfiles"
      #vm1.vm.provision "shell", inline: "sudo apt-get install net-tools" #для тестів
      vm1.vm.network "forwarded_port", guest: 80, host: 80
      #vm1.vm.provision "shell", path: "script.sh"
      vm1.vm.provider :vmware_desktop do |vmware|
        # vmware.gui = true #для тестів
        vmware.cpus = 2
        vmware.vmx["ethernet0.virtualdev"] = "vmxnet3"
        vmware.ssh_info_public = true
        vmware.linked_clone = false
      end
  end


  config.vm.define "vm2" do |vm2|
      vm2.vm.box = "spox/ubuntu-arm"
      vm2.vm.box_version = "1.0.0"
      vm2.vm.network "public_network", ip: "192.168.56.12"
      #vm2.vm.provision "shell", path: "database.sh"
      vm2.vm.provider :vmware_desktop do |vmware|
        #vmware.gui = true
        vmware.cpus = 2
        vmware.vmx["ethernet0.virtualdev"] = "vmxnet3"
        vmware.ssh_info_public = true
        vmware.linked_clone = false
      end
    end
end
