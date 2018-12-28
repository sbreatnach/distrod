# -*- mode: ruby -*-
# vi: set ft=ruby :

module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end

Vagrant.configure(2) do |config|

  config.vm.define "ubuntu_bionic" do |ubuntu_bionic|
    ubuntu_bionic.vm.box = "generic/ubuntu1804"
    ubuntu_bionic.vm.provision "shell", path: "vm_base_provision.sh"
  end

  # SSH access over local host port
  config.vm.network "forwarded_port", guest: 22, host: 8453

  # Provider-specific configurations
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.cpus = 2
    vb.customize ["modifyvm", :id,
                  "--vram", "64",
                  "--usb", "on"]
    if OS.linux? then
       vb.customize ["modifyvm", :id,
                     "--audio", "pulse"]
    end
    if OS.mac? then
       vb.customize ["modifyvm", :id,
                     "--audio", "coreaudio"]
    end
  end

  config.vm.provider "hyperv" do |hyperv|
    hyperv.memory = "2048"
    hyperv.cpus = 2
  end
end
