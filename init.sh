#!/bin/bash -eux
cd `dirname $0`

# Download Mattermost-LDAP
git clone https://github.com/Crivaledaz/Mattermost-LDAP/

# Create config files
cp Mattermost-LDAP/config_init.sh.example Mattermost-LDAP/config_init.sh
cp Mattermost-LDAP/oauth/config_db.php.example Mattermost-LDAP/oauth/config_db.php
cp Mattermost-LDAP/oauth/LDAP/config_ldap.php.example Mattermost-LDAP/oauth/LDAP/config_ldap.php

# Apply patch
patch -p0 < Mattermost-LDAP.patch

# Move files to Dockerfile folders.
mv Mattermost-LDAP/oauth app/
mv Mattermost-LDAP/init_postgres.sh db/
rm -rf Mattermost-LDAP
