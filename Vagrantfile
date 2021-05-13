Vagrant.configure("2") do |config|

  	config.vm.box = "ubuntu/trusty64"
  	config.vm.provider "virtualbox" do |v|
	v.memory = 1024
	end

	config.vm.define "wordpress" do |m|
	config.vm.network "public_network", ip: "192.168.43.14"
	end

	config.vm.define "mysql" do |m|
	config.vm.network "public_network", ip: "192.168.43.15"
	end
end
