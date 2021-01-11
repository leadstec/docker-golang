#
# Author            Frank,H.L.Lai <frank@leadstec.com>
# Docker Version    20.10
# Website           https://www.leadstec.com
# Copyright         (C) 2021 LEADSTEC Systems. All rights reserved.
#
FROM leadstec/alpine:3.12.3

LABEL description="GoLang image for VCubi platform" \
    maintainer="Frank,H.L.Lai <frank@leadstec.com>"

# set environment variables

# install packages
RUN apk --update add git make go && \
    rm -fr /tmp/* && rm /var/cache/apk/*

# copy install/start scripts
COPY scripts /scripts
RUN bash /scripts/setup/install
RUN rm -fr /scripts/setup
