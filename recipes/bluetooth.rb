%w{
bluez
bluez-utils
bluetooth
}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "bluetooth scan" do
  command "hcitool scan"
end

# command "pairing REUDO RBK-3200BTi" do
#   execute "sudo bluez-simple-agent hci0 EC:EA:03:26:27:A4"
# end

execute "auto connect REUDO RBK-3200BTi" do
  command "sudo bluez-test-device trusted EC:EA:03:26:27:A4 yes; bluez-test-input connect EC:EA:03:26:27:A4"
end
