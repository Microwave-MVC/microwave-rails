VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Configure cached packages to be shared between instances of the same base box.
  # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "microwave-rails-app-box"
    vb.memory = 2048

    # vb.customize ["modifyvm", :id, "--memory", "2048"]
    # vb.customize ["modifyvm", :id, "--cpus", "2"]
 
    # Allow the VM to display the desktop environment 
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
    # vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    # vb.customize ["modifyvm", :id, "--ioapic", "on"]
    # vb.customize ["modifyvm", :id, "--vram", "128"]
    # vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
  end

  config.vm.network "forwarded_port", guest: 3000, host: 4000
  config.vm.network "forwarded_port", guest: 9292, host: 5000
  config.vm.synced_folder "./", "/home/vagrant/microwave-workspace"

  config.berkshelf.berksfile_path = "cookbook/Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbook"
    chef.run_list = ["microwave-rails-chef"]
  end
end
