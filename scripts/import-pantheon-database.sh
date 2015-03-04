#!/bin/bash -xe
drush @pantheon.cf.dev sql-dump > /tmp/drupal-database.sql
sed -i '1d' /tmp/drupal-database.sql
cd /var/www/html
drush sql-cli < /tmp/drupal-database.sql
