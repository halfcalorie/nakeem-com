#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
if ! [ -L /usr/share/nginx ]; then
  rm -rf /usr/share/nginx
  ln -fs /vagrant /usr/share/nginx
fi
/etc/init.d/nginx restart

