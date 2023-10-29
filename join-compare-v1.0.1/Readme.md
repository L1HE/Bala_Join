
# 一、环境配置
## grpc安装(集群依次安装)
```
# 配置环境变量（.bashrc)
echo "export MY_INSTALL_DIR=$HOME/.local" >> ~/.bashrc
echo "export PATH="$MY_INSTALL_DIR/bin:$PATH"" >> ~/.bashrc

# 创建安装目录
mkdir -p $MY_INSTALL_DIR

# 安装cmake和相关库
sudo apt install -y build-essential autoconf libtool pkg-config

# 解压grpc源码文件
unzip grpc.zip

# 编译并安装grpc到本地
cd grpc
mkdir -p cmake/build
pushd cmake/build
cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../..
make -j4
make install
popd
```
详细参考https://grpc.io/docs/languages/cpp/quickstart/
</br>
</br>

## pssh安装（主节点安装）
pssh主要用来管理集群，该项目用到的功能：
* 复制文件到所有集群
* 集群执行某一个相同的命令
```
# 安装pssh包，使用简化命令
sudo apt-get install pssh
echo "alias pssh=parallel-ssh" >> ~/.bashrc && . ~/.bashrc
echo "alias pscp=parallel-scp" >> ~/.bashrc && . ~/.bashrc
echo "alias prsync=parallel-rsync" >> ~/.bashrc && . ~/.bashrc
echo "alias pnuke=parallel-nuke" >> ~/.bashrc && . ~/.bashrc
echo "alias pslurp=parallel-slurp" >> ~/.bashrc && . ~/.bashrc
source ~/.bashrc

# 检查安装
pssh --version
```
</br>

## 集群配置（主节点配置）
* cluster.txt内修改主机名，每行一个主机，尽量使用root用户
* 免密配置
```
ssh-keygen
ssh-copy-id root@hostname   # hostname为cluster.txt中的ip地址，重复执行该命令
```
</br>


