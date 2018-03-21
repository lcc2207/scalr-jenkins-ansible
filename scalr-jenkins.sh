#!/bin/bash
apt-get update; apt-get install -y python-pip

# install ansible
pip install ansible

# pull down required ansible roles
ansible-galaxy install --roles-path . geerlingguy.jenkins

# execute the jenkins install playbook
ansible-playbook -i localhost jenkins.yml
