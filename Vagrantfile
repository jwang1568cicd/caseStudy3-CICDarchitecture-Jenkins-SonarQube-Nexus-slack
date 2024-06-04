Vagrant.configure("2") do |config|
config.vm.define "nexus" do |nexus| 
        nexus.vm.box = "centos/7" 
        nexus.vm.hostname = "nexus" 
        nexus.vm.network "private_network", ip: "172.16.11.2" 
        config.vm.provision "shell", inline: "ifup eth1", run: "always" 
  end 

  config.vm.define "sonar" do |sonar| 
        sonar.vm.box = "geerlingguy/ubuntu2004" 
        sonar.vm.hostname = "sonar" 
        sonar.vm.network "private_network", ip: "172.16.11.3" 
  end 

  config.vm.define "jenkins" do |jenkins| 
        jenkins.vm.box = "geerlingguy/ubuntu2004" 
        jenkins.vm.hostname = "jenkins" 
        jenkins.vm.network "private_network", ip: "172.16.11.5" 
  end

  config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true
      # vb.grub_menu_key = "c"

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.cpus = "2"
  end
end
