# Copyright (C) 2020 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM alpine:3.14
LABEL maintainer "Bryan J Rodriguez <bryan.j.rodriguez@intel.com>"

RUN apk add --no-cache \
    bash \
    dhcpcd \
    inotify-tools \
    tini \
    wireless-tools \
    iwd \
    dbus \
    openresolv

COPY init.sh /usr/local/bin/init.sh
COPY iwd.conf.template /opt/iwd.conf.template
COPY iwd.main.template /opt/iwd.main.template

WORKDIR /

ENV COUNTRY=us \
    SSID='' \
    PSK=''

ENTRYPOINT ["tini", "--"]
CMD ["/usr/local/bin/init.sh"]
