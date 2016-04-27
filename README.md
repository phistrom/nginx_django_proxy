# NGINX Django Proxy

## Usage
Forward requests on port 80 to an upstream host called "my_upstream_server" listening on port 8000.

`docker run -it --rm -p 80:80 phistrom/nginx_django_proxy my_upstream_server:8000`

or to specify a port other than 80 to listen on

`docker run -it --rm -p 9090:9090 phistrom/nginx_django_proxy my_upstream_server:8000 `**`9090`**

## Why is it called Django?
It can forward to any upstream really, I just put the proxy settings for a Django upstream. You can change the **default.conf** file in this repo to be something else. There are placeholders in the file that get replaced by `sed` in the entrypoint script.
