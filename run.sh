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


if [ "$1" = "reboot_now" ]; then
	FLAGS="$FLAGS reboot_now=1"
fi


ansible-playbook $dirname/update-servers.yml -e "$FLAGS"
