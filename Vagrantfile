  

Vagrant.configure("2") do |config|
  config.vm.define "httpd" do |httpd|
    httpd.vm.box = "jaca1805/debian12"
    httpd.vm.network "private_network", ip: "192.168.33.10"
    httpd.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "2"
    end
    # httpd.vm.provision "shell", path: "httpd.sh"
  end
  config.vm.define "db" do |db|
    db.vm.box = "jaca1805/debian12"
    db.vm.network "private_network", ip: "192.168.33.11"
    db.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "2"
    end
    # db.vm.provision "shell", path: "db.sh"
  end

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "jaca1805/debian12"
    ansible.vm.network "private_network", ip: "192.168.33.5"
    ansible.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "2"
    end
    ansible.vm.provision "shell", path: "ansible.sh"
    ansible.vm.synced_folder "./config", "/home/vagrant/config"
  end

end