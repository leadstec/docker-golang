# Golang image for VCubi Platform

![Golang](https://img.shields.io/badge/Golang-1.13.14,_latest-blue)
![x86_64](https://img.shields.io/badge/x86_64-supported-brightgreen)
![aarch64](https://img.shields.io/badge/aarch64-supported-brightgreen)

## How to Use

### Pull image
    # from Docker Hub
    docker pull leadstec/golang:[tag]
    docker pull leadstec/golang-aarch64:[tag]
    # from Tencent CR
    docker pull leadstec.tencentcloudcr.com/leadstec/golang:[tag]
    docker pull leadstec.tencentcloudcr.com/leadstec/golang-aarch64:[tag]

### Build image
    docker-compose build golang

### LCS Schema & ENV

| ENV Variable              | Description               | Default | Accept Values |
|---------------------------|---------------------------|---------|---------------|
|  |                       |    |               |

## Image Structure Test
    container-structure-test test --image leadstec/golang:tag --config tests/golang.yaml

## CHANGELOG

**2020/10/03**
* Update: Golang 1.13.14 by apk

**1.6.2**
* 基于alpine 3.5（LCS 1.4）
* 支持Image Schema
* 支持LCS Tools

**1.4.2**

* Production Ready
* 支持captool机制


