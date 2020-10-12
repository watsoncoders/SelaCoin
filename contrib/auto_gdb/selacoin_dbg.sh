#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.selacoincore/selacoind.pid file instead
selacoin_pid=$(<~/.selacoincore/testnet3/selacoind.pid)
sudo gdb -batch -ex "source debug.gdb" selacoind ${selacoin_pid}
