#! /bin/sh

#Log everything in /tmp/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#If nginx.conf file exists in /code/nginx-conf dir
#overwrite the default nginx.conf file with the user provided config
if [ -e /code/nginx-conf/nginx.conf ]
then
    cp -f /code/nginx-conf/nginx.conf /etc/nginx/nginx.conf
else
 echo "Could not find /code/nginx-conf/nginx.conf, going to use the default nginx.conf "
fi

cp -rf /code/* /usr/share/nginx/html

#Cleaning up after ourselves
rm -rf /code
#rm -rf /conf