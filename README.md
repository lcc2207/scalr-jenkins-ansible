# scalr-jenkins-ansible

To use this playbook you will need to create a vars.yml vars_files

## vars.yml - contents
---
scarlserver: yourscalr.server.com
key_id: xxxxx
secret_key_id: xxxx
accountId: 1
envId: 1


# Ansible Vaulting the vars.yml file.

ansible-vault create vars.yml
