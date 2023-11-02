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