#!/bin/sh

# Run the playbooks

if ! [ -x "$(command -v ansible-playbook)" ]; then
	echo "Please install ansible"
	exit 1
fi

export ANSIBLE_HOSTS=servers_hosts
ansible-playbook update-servers.yml
