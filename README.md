# scalr-jenkins-ansible

# requirements
- OS Ubuntu 16.04
- vars.yml (more information below)
- ansible version 2.4.0
- scalr global variable that contains the ansible vault password
  (in this example the variable name is $jenkins_demo)

# Scalr script
the **scalr-jenkins.sh** is the script that needs to be added to Scalr Scripts

# vars.yml - contents
```yaml
---
scarlserver: yourscalr.server.com
key_id: xxxxx
secret_key_id: xxxx
accountId: 1
envId: 1
```

# Ansible Vaulting the vars.yml file.

ansible-vault create vars.yml
