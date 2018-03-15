#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# node.default['haproxy']['members'] = [{
#     "hostname" => "ec2-35-171-163-19.compute-1.amazonaws.com",
#     "ipaddress" => "35.171.163.19",
#     "port" => 80,
#     "ssl_port" => 80
#   },{
#     "hostname" => "ec2-52-202-234-230.compute-1.amazonaws.com",
#     "ipaddress" => "52.202.234.230",
#     "port" => 80,
#     "ssl_port" => 80
#     }]

all_web_nodes = search('node',"role:web_server AND chef_environment:#{node.chef_environment}")

members = []

all_web_nodes.each do |web_node|
  member = {
    'hostname' => web_node['cloud']['public_hostname'],
    'ipaddress' => web_node['cloud']['public_ipv4'],
    'port' => 80,
    'ssl_port' => 80
  }
  members.push(member)
end

node.default['haproxy']['members'] = members

include_recipe 'haproxy::manual'
