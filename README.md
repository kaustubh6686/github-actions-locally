# github-actions-locally
Repo to facilitate running github actions locally 

## ACT Examples
### Help
```
act --help
```
### List Jobs
```
act -l
```
### Run a Job (dry run)
```
act -j <workflow-name> -n
```
### Run a Job
```
act -j <workflow-name>
```
### Run a Workflow
```
act -W '.github/workflows/simple-matrix.yml'
act -W '.github/workflows/deploy-to-asg-using-ssm-send-command.yml'
```
### Run Workflow with event payload
```
act --workflows '.github/workflows/deploy-to-asg-using-ssm-send-command.yml' -e 'payload/event.json' --var-file 'payload/.vars' --env-file 'payload/.env' --secret-file 'payload/.secrets' --detect-event --container-architecture linux/amd64
```


## ACT Usage Documentation
https://nektosact.com/usage/index.html