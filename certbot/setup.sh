#!/usr/bin/expect
set timeout 5
spawn certbot -c /var/certbot/xwrhome/xwrhome.conf certonly
expect "(A)gree/(C)ancel: " { send "a\n" }
interact
