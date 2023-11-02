
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Nginx File Upload Size Limit Exceeded Incident
---

This incident type occurs when the Nginx server encounters a file upload request that exceeds the size limit configured for the server. As a result, the server may fail to upload the file, return an error message to the user, or in some cases, crash. This type of incident can impact file sharing and other operations that depend on file uploads to the server.

### Parameters
```shell
export FILE_PATH="PLACEHOLDER"

export NEW_MAX_SIZE="PLACEHOLDER"

export NGINX_CONF_PATH="PLACEHOLDER"
```

## Debug

### Check the Nginx version
```shell
nginx -v
```

### Check the Nginx configuration file for the upload size limit
```shell
cat /etc/nginx/nginx.conf | grep client_max_body_size
```

### Check the Nginx error logs for any relevant error messages
```shell
tail -f /var/log/nginx/error.log
```

### Check the size of file to be uploaded
```shell
ls -lh ${FILE_PATH}
```

### Check the server's disk usage and available space
```shell
df -h
```

### Check the server's memory usage
```shell
free -m
```

### Check the server's CPU usage
```shell
top
```

## Repair

### Increase the maximum file upload size limit of Nginx server to accommodate larger files.
```shell
bash

#!/bin/bash



# Define the new maximum file upload size limit

NEW_MAX_SIZE=${NEW_MAX_SIZE}



# Define the path to the Nginx configuration file

NGINX_CONF=${NGINX_CONF_PATH}



# Update the Nginx configuration file to set the new maximum file size limit

sed -i 's/client_max_body_size [0-9]*m;/client_max_body_size ${NEW_MAX_SIZE}m;/g' $NGINX_CONF



# Restart the Nginx server to apply the changes

sudo systemctl restart nginx




```