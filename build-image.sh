#!/usr/bin/env bash
#
# build docker image
#

build()
{
    echo -e "building image: log-pilot:latest\n"

    # docker build -t log-pilot:latest -f Dockerfile.$1 .
    # registry.cn-shanghai.aliyuncs.com/hauto/log-pilot:v0.9.7-filebeat-multiline
    # docker build -t registry.cn-xxxxxx.com/base-images/log-pilot:v0.9.7-filebeat-multiline -f Dockerfile.$1 .
    docker build -t registry.cn-shanghai.aliyuncs.com/hauto/log-pilot:v0.9.7-filebeat-multiline-`date +%F` -f Dockerfile.$1 .
}

case $1 in
fluentd)
    build fluentd
    ;;
*)
    build filebeat
    ;;
esac
