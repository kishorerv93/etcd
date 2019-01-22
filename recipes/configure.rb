#
# Cookbook Name:: etcd
# Recipe:: configure
#
# Copyright 2017, Outfront Media
#
# All rights reserved - Do Not Redistribute
#
#
#use curl instead of etcdctl for seting and getting keys when configured has cluster:
#set: curl -L -X PUT http://ip_addr:2379/v2/keys/hello -d value="world"
#get: curl -L http://ip_addr:2379/v2/keys/hello
#
#check members
#curl http://ip_addr:2379/v2/members
#


etcdnodes = search(:node, 'layers:etcd',
	:filter_result => { 'private_ip' => ['etcd*'], 'hostname' => ['etcd*'] })

template "/etc/init.d/etcd" do
        source "etcd.conf.erb"
		owner 'root'
		group 'root'
		mode '0755'
		variables(
        :nodes => etcdnodes
    )	
end
bash "remove_unwanted_entry_and_service_start" do
		code <<-EOH
		sed -i s/forremove,//g /etc/init.d/etcd
		sleep 5
		service etcd start
		EOH
end


