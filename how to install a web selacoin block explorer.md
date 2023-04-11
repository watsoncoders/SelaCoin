Tutorial - Install a Selacoin block explorer on Ubuntu Server 18.04
Install a block explorer on Ubuntu Server 18.04 with the following tutorial.

Update your Ubuntu server with the following command:

sudo apt-get update && sudo apt-get upgrade -y

Install the required dependencies with the following command:

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev -y

Install the additional dependencies with the following command:

sudo apt-get install libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler unzip software-properties-common libkrb5-dev mongodb nodejs npm git nano cmake screen -y

Install Berkeley DB with the following command:

sudo apt-get update && sudo apt-get install libdb-dev libdb++-dev -y

Download the Linux daemon for your wallet with the following command:

wget "https://github.com/wattson-coder/SelaCoin/raw/main/SourceCode%20Zipped/selacoin-daemon-linux.tar.gz" -O selacoin-daemon-linux.tar.gz

Extract the tar file with the following command:

tar -xzvf selacoin-daemon-linux.tar.gz

Type the following command to install the daemon and tools:

sudo mv selacoind /usr/bin/

Type the following command to open your home directory:

cd $HOME

Create the data directory for your coin with the following command:

mkdir $HOME/.selacoin

Open nano.

nano $HOME/.selacoin/selacoin.conf -t

Paste the following text into nano.

rpcuser=rpc_selacoin
rpcpassword=dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
daemon=1
addnode=38.242.204.79

Save the file with the keyboard shortcut ctrl + x.

Type the following command to start your daemon:

selacoind

Type the following command to open MongoDB:

mongo

Type the following command to create a MongoDB database named “explorerdb”:

use explorerdb

Type the following command to create a MongoDB user named “selacoin”:

db.createUser( { user: "selacoin", pwd: "414uq3EhKDNhghjgjhDZIMszvHrDMytCnzFevRgtAv", roles: [ "readWrite" ] } )

Type the following command to close MongoDB:

exit

Type the following command to clone iquidus-explorer:

git clone https://github.com/iquidus/explorer explorer

Type the following command to install iquidus-explorer:

cd explorer && npm install --production

Type the following command to create the file settings.json:

cp ./settings.json.template ./settings.json

Open nano.

nano settings.json -t

Modify the following values in the file settings.json

title - “IQUIDUS” -> “SelaCoin”.

address - Change the value “127.0.0.1” with the IPv4 address of your server.

coin - “Darkcoin” -> “SelaCoin”.

symbol - “DRK” -> “SELA”.

password - “3xp!0reR” -> “414uq3EkhkhgkgkjgMszvHrDMytCnzFevRgtAv”.

use_rpc - “false” -> “true”.

port - “9332” -> “25521”.

user - “darkcoinrpc” -> “rpc_selacoin”.

pass - 123gfjk3R3pCCVjHtbRde2s5kzdf233sa” -> “dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2”.

confirmations - “40” -> “5”.

api - “true” -> “false”.

markets - “true” -> “false”.

twitter - “true” -> “false”.

Save the file with the keyboard shortcut ctrl + x.

Type the following command to open a screen session:

screen

Type the following commands to start your block explorer:

cd $HOME/explorer
npm start

Press the keyboard shortcut ctrl + a + d to disconnect from your screen session.

Type the following command to open crontab:

crontab -e

Press the Page Down key on your keyboard PgDown.

Paste the following text into crontab.

@reboot selacoind
*/1 * * * * cd /root/explorer && /usr/bin/nodejs scripts/sync.js index update > /dev/null 2>&1
*/5 * * * * cd /root/explorer && /usr/bin/nodejs scripts/peers.js > /dev/null 2>&1

Save the crontab with the keyboard shortcut ctrl + x

Confirm that you want to save the crontab with the keyboard shortcut y + enter

And thats it :)

note - some users reported getting errors for 2 librarires - the liboost and openssl 


the solution is simple : for liboost 1_65_1 : 
1. cd $home 
2. wget https://boostorg.jfrog.io/artifactory/main/release/1.65.1/source/boost_1_65_1.tar.gz
3. sudo apt update
4. tar xvf boost_1_65_1.tar.gz
5. cd boost_1_65_1/
6. sudo apt install build-essential python3-dev g++ autotools-dev libicu-dev libbz2-dev -y
7.  sudo ./bootstrap.sh --prefix=/usr/
8. ./b2
9. sudo ./b2 install

alot of patiance cause it takes a long time to compile for any coin..


