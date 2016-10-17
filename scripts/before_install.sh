#!/bin/bash
# set -ex

sudo -u ec2-user /bin/bash -c 'curl -sL https://goo.gl/U6jSSr | bash -s ijin'

if [ "$DEPLOYMENT_GROUP_NAME" == "production" ]
then
    rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
    yum -y install newrelic-php5
    NR_INSTALL_KEY=xxxxxxxxxxxxxxx newrelic-install install
fi
