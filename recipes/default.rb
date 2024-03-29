#
# Cookbook:: test_1
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_file '/bin/jq' do
  source node['test_1']['jq_url']
  mode '0755'
end

template '/var/tmp/test_1_details.sh' do
  source 'details.sh.erb'
  variables(
    name: node['test_1']['name'],
    channel: node['test_1']['channel'],
    install_version: node['test_1']['install_version'],
    automate_name: node['test_1']['automate_name']
  )
end
