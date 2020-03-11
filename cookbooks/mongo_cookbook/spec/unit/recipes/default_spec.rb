#
# Cookbook:: node_cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
      platform 'ubuntu', '16.04'

      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end
      it 'should install mongodb-org' do
        expect(chef_run).to add_apt_repository "mongodb-org"
      end

      it 'should install mongodb-org' do
        expect(chef_run).to upgrade_package "mongodb-org"
      end

      it 'should install mongodb-org' do
        expect(chef_run).to upgrade_package "mongodb-org"
      end

      it 'should create a mongod.service templates in /lib/systemd/system/mongod.service' do
        expect(chef_run).to create_template '/lib/systemd/system/mongod.service'
        #.with_variables(proxy_port: 3000)
      end

      it 'should create a mongod.conf templates in /etc/mongod.conf' do
        expect(chef_run).to create_template '/etc/mongod.conf'
    end
  end
end
