# InSpec test for recipe mongo_cookbook::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


describe package('mongodb-org') do
  it { should be_installed }
  its('version') { should cmp > '3.2.*' }
end

describe port('0.0.0.0', 27017) do
  it { should be_listening }
end

describe service "mongod" do
  it { should be_running}
  it { should be_enabled}
end
