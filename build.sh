#! /bin/sh
# appLariats generic nginx build script
# Requirements - A valid nginx.conf file exists within the /src/conf/ path
# Copies the nginx.conf file from the /src/conf/ and copies it into /etc/nginx/nginx.conf

#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#Check for nginx.conf file and throw exception if not present
if [ -e /src/conf/nginx.conf ]
then
    cp -f /src/conf/nginx.conf /etc/nginx/nginx.conf
fi

cp -rf /src/* /usr/share/nginx/html