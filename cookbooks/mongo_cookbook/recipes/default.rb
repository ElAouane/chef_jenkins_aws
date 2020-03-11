include_recipe 'apt'
include_recipe 'sc-mongodb::default'


apt_update 'update' do
  action :update
end

apt_repository 'mongodb-org' do
  uri 'https://repo.mongodb.org/apt/ubuntu'
  distribution 'xenial/mongodb-org/3.2'
  components ['multiverse']
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "EA312927"
end

package 'mongodb-org' do
  options '--allow-unauthenticated'
  action :upgrade
end

file '/etc/mongod.conf' do

end

file '/lib/systemd/system/mongod.service' do

end


mongodb_instance "mongodb" do
  port node['mongodb']['port']
  bindIp node['mongodb']['bindIp']
end

service "mongod" do
  action [:enable, :start]
end
