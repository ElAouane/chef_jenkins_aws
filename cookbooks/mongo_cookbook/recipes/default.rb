
apt_update 'update' do
  action :update
end

apt_repository 'mongodb-org' do
  uri "https://repo.mongodb.org/apt/ubuntu"
  distribution "xenial/mongodb-org/3.2"
  components ['multiverse']
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "EA312927"
end

package "mongodb-org" do
  options '--allow-unauthenticated'
  action :upgrade
end


template '/etc/mongod.conf' do
  variables port: node['mongodb']['port'], bind_ip: node['mongodb']['bind_ip']
  source 'mongod.conf.erb'
  mode '777'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end

template '/lib/systemd/system/mongod.service' do
  source 'mongod.service.erb'
  mode '0600'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end

service "mongod" do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end




# Chef Configuration Lab

## Timings
