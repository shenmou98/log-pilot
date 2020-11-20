



- 使用方法：
    - 主要是在原版的基本上加上了java堆栈信息打印在一行的内容（filebeat版本），即主要修改了filebeat文件  assets/filebeat/filebeat.tpl
    - 使用时clone代码， 并使用下边的 docker build 命令build镜像即可。
    - 之后参考[阿里文档](https://help.aliyun.com/document_detail/86552.html?spm=a2c4g.11186623.6.779.1d045ddacyXCZQ) 配置daemonset log-pilot.
    - 配置java规格在一行参考[文档](https://www.cnblogs.com/chenjinxi/p/13340693.html)

- 代码：
    ```
    # 如果出现网络问题，可以尝试加上 --network=host
    docker build -t registry-vpc.cn-shanghai.aliyuncs.com/hauto/log-pilot:v0.9.7-filebeat-multiline-`date +%F` -f Dockerfile.filebeat . --network=host

    docker login --username=terui@hauto registry.cn-shanghai.aliyuncs.com

    ```

- 可能的问题，
    - build 的时候 ```apk add --no-cache make git```一直报问题，像是网络问题； 经排查加上 --network=host 就可以了。问题可能是docker内部使用了google的dns之类的原因。参考文档[docker制作镜像无法访问外网](https://blog.csdn.net/qq_35774477/article/details/107519750),  [可能dns相关 - 彻底解决docker build时安装软件失败问题](https://blog.csdn.net/weixin_34146986/article/details/87984563)

    - docker push 镜像的时候报  denied: requested access to the resource is denied, 解决方式， 先 docker login 自己的仓库；