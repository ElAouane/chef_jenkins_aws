# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip: "192.168.10.110"
    app.vm.synced_folder "app", "/home/ubuntu/app"
    app.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
    end
    app.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end


  config.vm.define "server1" do |server1|
    server1.vm.box = "ubuntu/bionic64"
    server1.vm.network "private_network", ip: "192.168.10.150"
    server1.vm.synced_folder "environment/db", "/home/ubuntu/environment"
    server1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end
end
