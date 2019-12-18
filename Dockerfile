#
# AUTHOR            Frank,H.L.Lai <frank@leadstec.com>
# DOCKER-VERSION    17.03
# Copyright         (C) 2017 Leads Technologies Ltd. All rights reserved.
#
# Description       Dockerfile for Golang image
#
FROM       reg.leadstec.com/alpine:latest
MAINTAINER Frank,H.L.Lai <frank@leadstec.com>
LABEL leadstec-neo4j-build="1.6.2-{{PIPELINE_BUILD_NUMBER}}"

# set environment variables
ENV GOLANG_VERSION="1.6.2" \
    GOLANG_SRC_URL="http://repo.lxpt.cn/artifactory/ext-release/golang/go1.6.2.src.tar.gz" \
    GOLANG_SRC_SHA256="787b0b750d037016a30c6ed05a8a70a91b2e9db4bd9b1a2453aa502a63f1bccc" \
    GOLANG_BOOTSTRAP_VERSION="1.4.3" \
    GOLANG_BOOTSTRAP_URL="http://repo.lxpt.cn/artifactory/ext-release/golang/go1.4.3.src.tar.gz" \
    GOLANG_BOOTSTRAP_SHA1="486db10dc571a55c8d795365070f66d343458c48"

RUN set -ex && \
    apk --update add git && \
    apk add --no-cache --virtual .build-deps bash ca-certificates gcc musl-dev openssl && \
    mkdir -p /usr/local/bootstrap && \
    wget -q ${GOLANG_BOOTSTRAP_URL} -O golang.tar.gz && \
    echo "${GOLANG_BOOTSTRAP_SHA1}  golang.tar.gz" | sha1sum -c - && \
    tar -C /usr/local/bootstrap -xzf golang.tar.gz && \
    rm golang.tar.gz && \
    cd /usr/local/bootstrap/go/src && \
    ./make.bash && \
    export GOROOT_BOOTSTRAP=/usr/local/bootstrap/go && \
    wget -q "$GOLANG_SRC_URL" -O golang.tar.gz && \
    echo "$GOLANG_SRC_SHA256  golang.tar.gz" | sha256sum -c - && \
    tar -C /usr/local -xzf golang.tar.gz && \
    rm golang.tar.gz && \
    cd /usr/local/go/src && \
    ./make.bash && \
    rm -rf /usr/local/bootstrap /usr/local/go/pkg/bootstrap && \
    apk del .build-deps

# copy install/start scripts
COPY scripts /scripts
RUN bash /scripts/setup/install
RUN rm -fr /scripts/setup
