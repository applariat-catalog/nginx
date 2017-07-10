#! /bin/sh
# appLariat generic entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

#Run nginx in non-daemon mode
exec nginx -g "daemon off;"