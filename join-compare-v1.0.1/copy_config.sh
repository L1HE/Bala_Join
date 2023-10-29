#!/bin/bash

# 压缩包复制到集群
parallel-scp -h cluster.txt config/join-compare.ini ~/join-compare-v1.0.1/config/