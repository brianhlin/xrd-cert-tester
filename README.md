XRootD #1678 Reproducer
=======================

This container is designed to reproduce issues with XRootD's host refreshing code.

1.   Build the container:

            podman build -t xrd-cert-tester:el7-5.6.7 .

1.   Start the container:

            podman run -d --name tester xrd-cert-tester:el7-5.6.7

1.   Enter the container:

            podman exec -it tester /bin/bash


1.   Inside the container, compare the host cert on disk vs the host cert served by XRootD:

            check-certs.sh

1.   Inside the container, generate new certs and compare what's served vs what's on disk:

            refresh-certs.sh --force
            check-certs.sh

1.   Exit and clean up the container:

            podman stop tester && podman rm tester
