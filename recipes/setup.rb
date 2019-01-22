#
# Cookbook Name:: etcd
# Recipe:: setup
#
# Copyright 2017, Outfront Media
#
# All rights reserved - Do Not Redistribute
#

directory "/var/etcd" do
   mode	0755
  recursive true
end

binary = "etcd-v#{node['etcd']['version']}-linux-amd64.tar.gz"

bash "Download etcd" do
  code <<-EOH
  wget https://github.com/coreos/etcd/releases/download/v#{node['etcd']['version']}/#{binary} -O /opt/#{binary}
  tar -xzvf /opt/#{binary} -C /opt/
  cd /opt/etcd-v#{node['etcd']['version']}-linux-amd64
  mv /opt/etcd-v#{node['etcd']['version']}-linux-amd64/etcd /usr/local/bin/
  mv /opt/etcd-v#{node['etcd']['version']}-linux-amd64/etcdctl /usr/local/bin/
  EOH
end

  





