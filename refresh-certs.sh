#!/bin/bash

mkdir -p /etc/grid-security/xrd

PYTHONPATH=/src/lib python3 /src/bin/osg-ca-generator --host "$@"

for ftype in cert key; do
    cp /etc/grid-security/{host$ftype.pem,xrd/xrd$ftype.pem}
done

chown xrootd: -R /etc/grid-security/xrd/
