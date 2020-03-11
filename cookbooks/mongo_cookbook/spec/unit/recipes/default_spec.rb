
require 'spec_helper'


describe 'mongo_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should add mongo to the sources list' do
      expect( chef_run ).to add_apt_repository('mongodb-org')
    end

    it 'should install mongod' do
      expect( chef_run ).to upgrade_package 'mongodb-org'
    end

    it 'should update the mongod service config' do
      expect(chef_run).to create_template('/lib/systemd/system/mongod.service')
      template = chef_run.template('/lib/systemd/system/mongod.service')
      expect(template).to notify('service[mongodb]')
    end

    it 'should create a mongod file' do
      expect(chef_run).to create_file('/etc/mongod.conf')
    end
    it 'should create a mongod service file' do
      expect(chef_run).to create_file('/lib/systemd/system/mongod.service')
    end
    it 'should install mongo-db' do
      expect(chef_run).to install_apt_package "mongodb-org"
    end

    it 'should enable "mongod" service' do
      expect(chef_run).to enable_service 'mongodb'
    end

    it 'should start "mongod" service' do
      expect(chef_run).to start_service 'mongodb'
    end
  end
end
