execute "update dist" do
  command "sudo su ; apt-get update ; apt-get upgrade -y ; apt-get dist-upgrade -y"
end
