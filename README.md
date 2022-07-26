

https://sela-coin.com/ aims to continue on SelaCoin chain.


### SelaCoin is a peer-to-peer Internet currency that enables instant, near-zero cost payments to anyone in the world - at lower costs than any other cryptocurrency existing today. SelaCoin is an open source, global payment processing solution that is fully decentralized without any central authorities, unlike other token based crypto currencies. Advanced and complicated mathematics code inbuild into the source code secures the entire SelaCoin network and empowers it’s users to control their own finances. SelaCoin also features lightening-fast transaction confirmation times - at 4 confirmations; thus improves the entire blockchain storage efficiency more than other cryptocurrencies, and of course better in all respects to the current fiat-based currencies. With substantial industry support, trade volume and liquidity, SelaCoin is a proven medium of commerce complementary to Bitcoin.

### Common Questions :
## How To Start Solo Mining SelaCoins?
Use these instructions to mine for selacoins.

Open your Sela wallet, and make sure your wallet is connected with a node using the addnode=%some ip% in the coin app data /selacoin/selacoin.conf 
file.
You will know your wallet is connected when you see the icon Wallet connections in the lower corner of your wallet.

The message “Synchronizing with network…” will disappear once you mine your first block on the selacoin network.

Close your wallet and create the file selacoin.conf in the folder “%APPDATA%\selacoin\”.

Paste the following text into selacoin.conf and save the file.
```
rpcuser=rpc_selacoin
rpcpassword=2519d4ef50064515486153139
rpcallowip=127.0.0.1
rpcport=25521
listen=1
server=1
```
Download cpuminer from https://github.com/pooler/cpuminer/releases/tag/v2.5.0 and extract the zip file.

Create a .bat file named mine.bat and paste the following text into mine.bat.
```
minerd --url=http://127.0.0.1:25521--userpass=rpc_selacoin:2519d4ef50064515486153139 
```
Save the file inside the extracted cpuminer folder.

Open your wallet and execute mine.bat to start mining your first Sela block.



### How to connect your SelaCoin Wallet to a node?
Close your wallet and create the file selacoin.conf in the folder “%APPDATA%\selacoin\”.

Paste the following text into selacoin.conf and save the file.

``` addnode=REPLACE_WITH_IP_OR_HOSTNAME ```

Replace the text “REPLACE_WITH_IP_OR_HOSTNAME” with an IP

 address or hostname.

these are just some of the public nodes we have so far :
```
161.97.185.151

161.35.253.52

167.172.3.171

```
so an example selacoin.con would include the nodes this way :
```
addnode=161.97.185.151

addnode=167.172.3.171

addnode=161.35.253.52
```

### How to setup a node on Ubuntu Server 18.04?
Install Ubuntu Server 18.04 on a VPS – I recommend using Digital Ocean 

#### here is a promo code giving you 100$ to start your own node with Digital Ocean

#### https://m.do.co/c/7474750982e8

Update your Ubuntu machine.
```
sudo apt-get update
sudo apt-get upgrade
```

Install the required dependencies.
```
sudo apt-get install libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libdb-dev libdb++-dev libminiupnpc-dev


sudo wget "https://github.com/wattson-coder/SelaCoin/blob/main/builds/selacoin-source.tar.gz" -O selacoin-daemon-linux.tar.gz
```
Extract the tar file.
```
tar -xzvf selacoin-daemon-linux.tar.gz
```

Install the daemon.
```
sudo mv selacoind /usr/bin/

```
Create the config file.
```
mkdir $HOME/.selacoin
nano $HOME/.selacoin/selacoin.conf
```


Paste the following lines in selacoin.conf.
```
rpcuser=rpc_selacoin
rpcpassword=69c863e3356d3dae95df454a1
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
staking=0
daemon=1
```

Start your node with the following command.
```
selacoind
```

make note of the ipv4 adress of the server / droplet – that is your node IP address

How to setup a node on CentOS 7?
Update your CentOS machine.
```
yum update -y
```

Install the EPEL repository.
```
yum install -y epel-release
```

Install the required dependencies.

``` yum install -y gcc-c++ boost-devel libdb4-cxx libdb4-cxx-devel openssl-devel miniupnpc-devel wget unzip
```

Install Berkeley DB from source code.
```
cd $HOME
wget https://download.oracle.com/berkeley-db/db-4.8.30.zip
unzip db-4.8.30.zip
cd db-4.8.30
cd build_unix/
../dist/configure --prefix=/usr/local --enable-cxx
make
make install
```

Create a directory for the source code.
```
cd $HOME
mkdir source_code
cd source_code
wget "https://sela-coin.com/download/selacoin-source.tar.gz" -O selacoin-source.tar.gz
```

Extract the tar file.
```
tar -xzvf selacoin-source.tar.gz
```

Execute the following commands to compile the daemon.
```
cd src/
make -f makefile.unix RELEASE=1
```

The compiling will take about 60 minutes depending on your system.

Install the daemon.
```
cp selacoind /usr/bin/
```

Create the config file.
```
mkdir $HOME/.selacoin
nano $HOME/.selacoin/selacoin.conf
```

Paste the following lines in selacoin.conf.
```
rpcuser=rpc_selacoin
rpcpassword=69c863e3356d3dae95df454a1
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
staking=0
daemon=1
```

Start your selacoin node with the following command.
```
selacoind
```

How do I cross-compile a SelaCoin wallet for Windows?
Use the following instructions to cross-compile the selacoin wallet for Windows using Ubuntu Server 18.04.

## 1) Update your Ubuntu machine.
```
sudo apt-get update
sudo apt-get upgrade
```
## 2) Install the required dependencies for MXE.
```
sudo apt-get install p7zip-full autoconf automake autopoint bash bison
sudo apt-get install bzip2 cmake flex gettext git g++ gperf libgtk2.0-dev ntltool libffi-dev libtool libtool-bin
sudo apt-get install libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils lzip python-pip g++-multilib libc6-dev-i386
```
## 3) Clone the MXE repository
```
cd /mnt
sudo git clone https://github.com/mxe/mxe.git
```
## 4) Compile Boost
```
cd /mnt/mxe
sudo make MXE_TARGETS="i686-w64-mingw32.static" boost
```
## 5) Compile QT5
```
cd /mnt/mxe
sudo make MXE_TARGETS="i686-w64-mingw32.static" qttools
```
## 6) Download and unpack Berkeley DB.
```
cd /mnt
sudo wget https://download.oracle.com/berkeley-db/db-4.8.30.tar.gz
sudo tar zxvf db-4.8.30.tar.gz
```
## 7) Create bash script to install Berkeley DB.
```
cd /mnt/db-4.8.30
sudo touch compile-db.sh
sudo chmod ugo+x compile-db.sh
```
## 8) Edit the newly created bash file compile-db.sh.
```
sudo nano compile-db.sh
```
## 9) Paste the following in the file compile-db.sh
```
#!/bin/bash
MXE_PATH=/mnt/mxe
sed -i "s/WinIoCtl.h/winioctl.h/g" src/dbinc/win_db.h
mkdir build_mxe
cd build_mxe

CC=$MXE_PATH/usr/bin/i686-w64-mingw32.static-gcc \
CXX=$MXE_PATH/usr/bin/i686-w64-mingw32.static-g++ \
../dist/configure \
--disable-replication \
--enable-mingw \
--enable-cxx \
--host x86 \
--prefix=$MXE_PATH/usr/i686-w64-mingw32.static

make
make install
```
## 10) Compile Berkeley DB.
```
sudo ./compile-db.sh
```
## 11) Download and unpack miniupnp.
```
cd /mnt
sudo wget http://miniupnp.free.fr/files/miniupnpc-1.9.tar.gz
sudo tar zxvf miniupnpc-1.9.tar.gz
```
## 12) Create bash script to install miniupnp.
```
cd /mnt/miniupnpc-1.9
sudo touch compile-upnp.sh
sudo chmod ugo+x compile-upnp.sh
```
## 13) Edit the file compile-upnp.sh.
```
sudo nano compile-upnp.sh
```
## 14) Paste the following in the file compile-upnp.sh
```
#!/bin/bash
MXE_PATH=/mnt/mxe
CC=$MXE_PATH/usr/bin/i686-w64-mingw32.static-gcc \
AR=$MXE_PATH/usr/bin/i686-w64-mingw32.static-ar \
CFLAGS="-DSTATICLIB -I$MXE_PATH/usr/i686-w64-mingw32.static/include" \
LDFLAGS="-L$MXE_PATH/usr/i686-w64-mingw32.static/lib" \
make libminiupnpc.a
mkdir $MXE_PATH/usr/i686-w64-mingw32.static/include/miniupnpc
cp *.h $MXE_PATH/usr/i686-w64-mingw32.static/include/miniupnpc
cp libminiupnpc.a $MXE_PATH/usr/i686-w64-mingw32.static/lib
```
## 15) Compile miniupnp.
```
sudo ./compile-upnp.sh
```
## 16) Install OpenSSL.
```
cd /mnt/mxe
sudo make openssl1.0 MXE_PLUGIN_DIRS=plugins/selas/openssl1.0/
```
## 17) Create a directory for the selacoin source code.
```
cd ~/
mkdir source_code
cd source_code
wget "https://sela-coin.com/download/selacoin-source.tar.gz" -O selacoin-source.tar.gz
```
## 18) Extract the tar file.
```
tar -xzvf selacoin-source.tar.gz
```
## 19) Create bash script to compile your windows wallet.
```
touch compile-blockchain.sh
chmod ugo+x compile-blockchain.sh
```
## 20) Edit the file compile-blockchain.sh.
```
sudo nano compile-blockchain.sh
```
## 21) Paste the following in the file compile-blockchain.sh.
```
#!/bin/bash
export PATH=/mnt/mxe/usr/bin:$PATH
MXE_INCLUDE_PATH=/mnt/mxe/usr/i686-w64-mingw32.static/include
MXE_LIB_PATH=/mnt/mxe/usr/i686-w64-mingw32.static/lib

i686-w64-mingw32.static-qmake-qt5 \
RELEASE=1 \
BOOST_LIB_SUFFIX=-mt \
BOOST_THREAD_LIB_SUFFIX=_win32-mt \
BOOST_INCLUDE_PATH=$MXE_INCLUDE_PATH/boost \
BOOST_LIB_PATH=$MXE_LIB_PATH \
OPENSSL_INCLUDE_PATH=$MXE_INCLUDE_PATH/openssl \
OPENSSL_LIB_PATH=$MXE_LIB_PATH \
BDB_INCLUDE_PATH=$MXE_INCLUDE_PATH \
BDB_LIB_PATH=$MXE_LIB_PATH \
MINIUPNPC_INCLUDE_PATH=$MXE_INCLUDE_PATH \
MINIUPNPC_LIB_PATH=$MXE_LIB_PATH \
QMAKE_LRELEASE=/mnt/mxe/usr/i686-w64-mingw32.static/qt5/bin/lrelease SelaCoin-qt.pro

make -f Makefile.Release
```
## 22) Now Compile your SelaCoin Windows wallet using the following command :
```
./compile-blockchain.sh
```
**** The compiling will take about 60 minutes depending on your system hardware.*******

***** Your compiled wallet named selacoin-qt.exe can be found in the folder “release” when compiling is finished.******



