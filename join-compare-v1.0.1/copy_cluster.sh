#!/bin/bash

# 压缩当前目录
cp cluster.txt ../
cd ../
tar -cvzf /tmp/tmp.tgz join-compare-v1.0.1
# 压缩包复制到集群
parallel-scp -h cluster.txt /tmp/tmp.tgz ~/
# 解压缩文件
parallel-ssh -h cluster.txt -i "tar -xzvf tmp.tgz && rm -f tmp.tgz"
rm -f /tmp/tmp.tgz
rm -f cluster.txt