#!/bin/sh

set -e  # turn errors on

if [ $# -eq 0 ]
 then  # if there is no argument...
    echo "No upstream specified. Usage example: docker run -p 80:80 phistrom/nginx_django_proxy pythonapp:8000";
    exit 1;
else
    if [ "$2" != "" ]  # optional 2nd parameter is public port
      then
        export PUBLIC_PORT=$2;
    fi

    sed -r -i.bak 's/^error_log\s+.+;$/error_log stderr;/g' /etc/nginx/nginx.conf
    sed -i.bak s/PUBLIC_PORT/$PUBLIC_PORT/g /etc/nginx/conf.d/default.conf;

    sed -i.bak s/UPSTREAM_SERVER/$1/g /etc/nginx/conf.d/default.conf;
    exec nginx -g 'daemon off;'
fi
