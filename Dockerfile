#
# Author            Frank,H.L.Lai <frank@leadstec.com>
# Docker Version    19.03
# Website           https://www.leadstec.com
# Copyright         (C) 2020 LEADSTEC Systems. All rights reserved.
#
ARG arch=
FROM leadstec.tencentcloudcr.com/leadstec/alpine${arch}:3.12.0
ARG version=1.13.14
ARG build=dev

LABEL version="${version}-${build}" \
    description="GoLang image for VCubi platform" \
    maintainer="Frank,H.L.Lai <frank@leadstec.com>"

# set environment variables
ENV GOLANG_VERSION="${version}"

# install packages
RUN apk --update add git make go && \
    rm -fr /tmp/* && rm /var/cache/apk/*

# copy install/start scripts
COPY scripts /scripts
RUN bash /scripts/setup/install
RUN rm -fr /scripts/setup
