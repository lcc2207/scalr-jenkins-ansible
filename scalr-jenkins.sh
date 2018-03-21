#!/bin/bash
apt-get update; apt-get install -y python-pip git

# install ansible
pip install ansible

# clone repo
git clone https://github.com/lcc2207/scalr-jenkins-ansible.git
cd scalr-jenkins-ansible/

# pull down required ansible roles
ansible-galaxy install --roles-path . geerlingguy.jenkins

echo Pa55w0rd > ./vault

# execute the jenkins install playbook
ansible-playbook -i localhost jenkins.yml --vault-id ./vault
