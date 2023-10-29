#Environment Configuration
## Installation of grpc (Install sequentially across the cluster)
```
# Configure environment variables (.bashrc)
echo "export MY_INSTALL_DIR=$HOME/.local" >> ~/.bashrc
echo "export PATH="$MY_INSTALL_DIR/bin:$PATH"" >> ~/.bashrc

# Create installation directory
mkdir -p $MY_INSTALL_DIR

# Install cmake and related libraries
sudo apt install -y build-essential autoconf libtool pkg-config

# Unzip the grpc source code file
unzip grpc.zip

# Compile and install grpc locally
cd grpc
mkdir -p cmake/build
cd cmake/build
cmake -DgRPC_INSTALL=ON \
      -DgRPC_BUILD_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
      ../..
make -j4
make install
cd ../../..
```
Refer to https://grpc.io/docs/languages/cpp/quickstart/ for more details.
</br>
</br>

## Installation of pssh (Install on the master node)
pssh is mainly used to manage the cluster. The functionalities used in this project include:
* Copying files to all the clusters
* Executing a specific command across the cluster
```
# Install pssh package and use simplified commands
sudo apt-get install pssh
echo "alias pssh=parallel-ssh" >> ~/.bashrc && . ~/.bashrc
echo "alias pscp=parallel-scp" >> ~/.bashrc && . ~/.bashrc
echo "alias prsync=parallel-rsync" >> ~/.bashrc && . ~/.bashrc
echo "alias pnuke=parallel-nuke" >> ~/.bashrc && . ~/.bashrc
echo "alias pslurp=parallel-slurp" >> ~/.bashrc && . ~/.bashrc
source ~/.bashrc

# Check the installation
pssh --version
```
</br>

## Cluster Configuration (Configure on the master node)
* Modify the hostnames in cluster.txt, one host per line, and it is preferable to use the root user.
* Configure passwordless access
```
ssh-keygen
ssh-copy-id root@hostname   # Replace 'hostname' with the IP address from cluster.txt, and repeat this command.
```
</br>