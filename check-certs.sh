#!/bin/bash

echo -e "XRootD cert\n========="
openssl s_client -showcerts -connect localhost:1094 | openssl x509 -noout -dates

echo -e "Cert on disk\n========="
openssl x509 -in /etc/grid-security/xrd/xrdcert.pem -noout -dates
