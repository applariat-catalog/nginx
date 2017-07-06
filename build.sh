#! /bin/sh
# appLariats generic nginx build script
# Requirements - A valid nginx.conf file exists within the /code/conf/ path
# Copies the nginx.conf file from the /code/conf/ and copies it into /etc/nginx/nginx.conf

#Log everything in /tmp/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#make sure nginx.conf exists in /conf dir
#overwrite the default nginx.conf file with the user provided config
#optionally replace conf/nginx.conf with your own to customize nginx
if [ -e /conf/nginx.conf ]
then
    cp -f /conf/nginx.conf /etc/nginx/nginx.conf
else
 echo "ERROR! did not find nginx.conf file in /conf folder"
 exit 1
fi

cp -rf /code/* /usr/share/nginx/html

#Cleaning up after ourselves
rm -rf /code
rm -rf /conf