remote_file "/etc/ntp.conf" do
  source "templates/ntp.conf"
end

service "ntp" do
  action :restart
end
