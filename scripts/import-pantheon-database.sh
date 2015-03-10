#!/bin/bash -xe
/usr/local/bin/terminus site backup create --site=$1 --env=dev --element=db
/usr/local/bin/terminus site backup get --site=$1 --env=dev --element=database --to-directory=/tmp --latest
database_name=`ls /tmp/*.sql.gz`
gunzip < $database_name | mysql -u $2 -p$3 $4
cd /var/www/html
drush cc all
