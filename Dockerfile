FROM hub.opensciencegrid.org/opensciencegrid/xrootd-standalone:3.6-release

COPY refresh-certs.sh /usr/local/bin/

RUN yum install -y git python3 && \
    git clone https://github.com/opensciencegrid/osg-ca-generator /src && \
    /usr/local/bin/refresh-certs.sh && \
    # this is oss.localroot
    mkdir -p /xrootd-standalone  && \
    # fully override OSG defaults
    rm /etc/xrootd/config.d/50-osg-http.cfg

COPY check-certs.sh /usr/local/bin/
COPY 99-cert-tester.cfg /etc/xrootd/config.d/

WORKDIR /var/spool/xrootd