# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
MACHINES = {
  :"bash" => {
              :box_name => "generic/centos8s",
              :box_version => "4.3.4",
              :cpus => 1,
              :memory => 1024,
              :ip_addr => '192.168.56.10',
            }
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define boxname do |box|
      box.vm.box = boxconfig[:box_name]
      box.vm.box_version = boxconfig[:box_version]
      box.vm.host_name = boxname.to_s
      box.vm.network "private_network", ip: boxconfig[:ip_addr]
      box.vm.provider "virtualbox" do |v|
        v.memory = boxconfig[:memory]
        v.cpus = boxconfig[:cpus]
      end
      box.vm.provision "file", source: "log_handler.sh", destination: "log_handler.sh"
      box.vm.provision "file", source: "send_mail.sh", destination: "send_mail.sh"
      box.vm.provision "file", source: "0send_mail.cron", destination: "0send_mail.cron"
      box.vm.provision "shell", inline: <<-SHELL
      sudo -i
      mv log_handler.sh /root/log_handler.sh
      mv send_mail.sh /root/send_mail.sh
      mv 0send_mail.cron /etc/cron.hourly/0send_mail.cron
      yum install -y mailx sendmail
      chmod u+x /etc/cron.hourly/0send_mail.cron
    SHELL
    end
  end
end
