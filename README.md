# scalr-jenkins-ansible

# Requirements
- OS Ubuntu 16.04
- vars.yml (more information below)
- ansible version 2.4.0
- scalr global variable that contains the ansible vault password
  (in this example the variable name is $jenkins_demo)

# Scalr script
The **scalr-jenkins.sh** is the script that needs to be added to Scalr Scripts

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


# farm template example
```json
{
    "_meta": {
        "schema_version": "v1beta0-7.8.0"
    },
    "farm": {
        "name": "prod-docker-cicd",
        "description": "",
        "project": {
            "id": "xxxxxxx"
        },
        "timezone": "America\/New_York",
        "launchOrder": "simultaneous",
        "variables": []
    },
    "roles": [
        {
            "alias": "base-ubuntu1604-hvm",
            "role": {
                "name": "base-ubuntu1604-hvm"
            },
            "cloudPlatform": "ec2",
            "cloudLocation": "us-west-1",
            "instanceType": {
                "id": "t2.medium"
            },
            "launchIndex": 0,
            "advancedConfiguration": {
                "disableAgentIptablesManagement": false,
                "disableAgentNtpManagement": false,
                "rebootAfterHostInit": false
            },
            "scaling": {
                "considerSuspendedServers": "running",
                "enabled": true,
                "maxInstances": 2,
                "minInstances": 1,
                "rules": [],
                "scalingBehavior": "launch-terminate"
            },
            "networking": {
                "networks": [
                    {
                        "id": "vpc-9483dcf1"
                    }
                ],
                "subnets": [
                    {
                        "id": "subnet-d7c5988e"
                    }
                ]
            },
            "cloudFeatures": {
                "type": "AwsCloudFeatures",
                "ebsOptimized": false
            },
            "variables": [
                {
                    "name": "RequiredVariable",
                    "value": "ec2option"
                }
            ],
            "orchestration": {
                "rules": [
                    {
                        "trigger": {
                            "event": {
                                "id": "HostUp"
                            },
                            "triggerType": "SpecificEventTrigger"
                        },
                        "target": {
                            "targetType": "TriggeringServerTarget"
                        },
                        "action": {
                            "actionType": "ScalrScriptAction",
                            "scriptVersion": {
                                "script": {
                                    "name": "demo apache docker"
                                },
                                "version": -1
                            }
                        },
                        "timeout": 180,
                        "runAs": "",
                        "order": 10,
                        "blocking": true,
                        "enabled": true
                    }
                ]
            },
            "storage": []
        }
    ]
}



```
