# Golang image for VCubi Platform

![Version](https://img.shields.io/badge/Golang-1.13.15-blue)
![Arch](https://img.shields.io/badge/amd64,_arm64-brightgreen)
![Workflow](https://github.com/leadstec/docker-golang/workflows/ci/badge.svg)

The project contains Golang image for VCubi platform, based on LCS container management daemon.

Image on [DockerHub](https://hub.docker.com/r/leadstec/golang)

LEADSTEC: [Official website](https://www.leadstec.com)

## How to Use
    # Pull image
    docker pull leadstec/golang:latest

    # Build image
    docker-compose build .
    
    # Image Structure Test
    container-structure-test test --image leadstec/golang:tag --config tests/golang.yaml

## LCS Schema & ENV

| ENV Variable              | Description               | Default | Accept Values |
|---------------------------|---------------------------|---------|---------------|
|  |                       |    |               |

