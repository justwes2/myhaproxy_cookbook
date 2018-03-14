#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['haproxy']['members'] = [{
    "hostname" => "ec2-35-171-163-19.compute-1.amazonaws.com",
    "ipaddress" => "35.171.163.19",
    "port" => 80,
    "ssl_port" => 80
  },{
    "hostname" => "ec2-52-202-234-230.compute-1.amazonaws.com",
    "ipaddress" => "52.202.234.230",
    "port" => 80,
    "ssl_port" => 80
    }]

include_recipe 'haproxy::manual'
