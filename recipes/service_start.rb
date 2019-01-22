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


bash "service_start" do
		code <<-EOH
		service etcd start
		EOH
end


