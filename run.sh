#!/bin/sh

# Run the playbooks

if ! [ -x "$(command -v ansible-playbook)" ]; then
	echo "Please install ansible"
	exit 1
fi
dirname=$(dirname -- "$0")
export ANSIBLE_HOSTS=$dirname/servers_hosts


echo "Check status"
ansible all -m ping --user=root

ansible-playbook $dirname/update-servers.yml
