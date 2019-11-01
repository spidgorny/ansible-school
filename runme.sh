#!/usr/bin/env bash
# if ! $ip then
  # return

ssh-copy-id -i id_rsa adminer@$ip
ansible-playbook -i hostlist playbook-apt.yaml -K
ssh-copy-id -i id_rsa user@$ip
ansible-playbook -i hostlist user.yaml
