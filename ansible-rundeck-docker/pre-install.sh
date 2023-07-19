#!/bin/bash

# this script creates random passwords
# and updates the .env file

# create a new environment file

# random password for Database connection
RANDOMPASSWORD=`date +%s | sha256sum | base64 | head -c 32`

# the hostname which we can use in order to access rundeck
# from the outside.
# we set this to the hostname of the docker host
GRAILS_HOST_NAME=`hostname`

(cat >.env) <<EOF
# a random password for database connection
RUNDECK_DATABASE_USERNAME=rundeck
RUNDECK_DATABASE_PASSWORD=$RANDOMPASSWORD
RUNDECK_DATABASE_DRIVER=org.postgresql.Driver
RUNDECK_GRAILS_URL=http://${GRAILS_HOST_NAME}:4440
RUNDECK_DATABASE_URL=jdbc:postgresql://postgres/rundeck?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true
RUNDECK_SECURITY_HTTPHEADERS_PROVIDER_CSP_ENABLED=false
POSTGRES_DB=rundeck
POSTGRES_USER=rundeck
POSTGRES_PASSWORD=$RANDOMPASSWORD
PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org
PGADMIN_DEFAULT_PASSWORD=$RANDOMPASSWORD
VSCODE_PASSWORD=$RANDOMPASSWORD
EOF

RANDOMPASSWORD="nothing here"
