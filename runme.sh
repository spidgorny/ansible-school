#!/usr/bin/env bash
# if ! $ip then
  # return

set -e
set -x

ip=$1
sudo=$2
ssh-copy-id -i id_rsa adminer@$ip
ansible-playbook -i hostlist playbook-apt.yaml -v --extra-vars "ansible_become_pass='$sudo'"
ssh-copy-id -i id_rsa user@$ip
ansible-playbook -i hostlist user.yaml -v
