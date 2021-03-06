#!/bin/bash

# -----------------------------------------------------------------------------
# Copyright Siemens AG, 2013-2015. Part of the SW360 Portal Project.
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
#
# script automatically generating keys for password-free login onto 
# the vagrantbox
#
# initial author: birgit.heydenreich@tngtech.com
# 
# -----------------------------------------------------------------------------

set -e
echo "-[shell provisioning] Installing couchdb-lucene"

/bin/tar xvzf /vagrant_shared/packages/couchdb-lucene.tar.gz -C /tmp
cp --remove-destination /vagrant_shared/couchdb-lucene.ini /tmp/couchdb-lucene-1.0.2/src/main/resources/
pushd /tmp/couchdb-lucene-1.0.2
patch -p1 </vagrant_shared/couchdb-lucene.patch
mvn clean install war:war
popd
cp --remove-destination /tmp/couchdb-lucene-1.0.2/target/couchdb-lucene-*.war /opt/apache-tomcat-7.0.67/webapps/couchdb-lucene.war
