# Copyright (C) 2020 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM docker.io/gitea/gitea:1.15.3
LABEL maintainer "Bryan J Rodriguez <bryan.j.rodriguez@intel.com>"

RUN apk --no-cache add bash && \
    apk --no-cache -U upgrade

COPY init.sh /usr/local/bin/init.sh

ENTRYPOINT [ "/usr/local/bin/init.sh" ]
