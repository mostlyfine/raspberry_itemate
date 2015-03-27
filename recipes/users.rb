node['users'].each do |u|
  u_id = u['id']
  home_dir = u['home']

  user u_id do
    home home_dir
    password u['password']
  end

  if u['ssh-keys']
    directory "#{home_dir}/.ssh" do
      owner u_id
      group u_id
      mode '0700'
    end

    file "#{home_dir}/.ssh/authorized_keys" do
      content u['ssh-keys'].join("\n")
      owner u_id
      group u_id
      mode '0600'
    end
  end

  execute "add sudo group #{u_id}" do
    command "gpasswd -a #{u_id} sudo"
  end
end
