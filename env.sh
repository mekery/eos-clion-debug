#! /bin/sh

# ==============================================================================
# Description: EOS Development Environment
# Author: Micle Bu, micle@oriovo.com
# Created On: 2018.04.28
# Updated On: 2018.04.28
# ==============================================================================
PROMPT=Oriovo

## Configuration
## -----------------------------------------------------------------------------
key='EOS5ZA87Rz26TZg1zYZptJebtUwv7Reh4ZhPUsfsF3yUX3mrUM4KV'
wallet_password='PW5Hx2ff2pUrsZLUkMuhfFKnsqio8rTrZPnzN77x9YEV9CW21S8Uu'

## Mongo
## -----------------------------------------------------------------------------
~/opt/mongodb/bin/mongod -f ~/opt/mongodb/mongod.conf &

## Single Node
## -----------------------------------------------------------------------------
echo "\n---------------------------------------- Single Node ----------------------------------------"
nodeosid=`pgrep nodeos`

echo "$PROMPT: starting nodeos ..."
if [ -z $nodeosid ]
then
    nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::chain_api_plugin --plugin eosio::account_history_api_plugin
else
    echo "$PROMPT: nodeos is already running."
fi

## Wallet and Account
## -----------------------------------------------------------------------------
echo "\n---------------------------------------- Wallet and Account ----------------------------------------"
echo "$PROMPT: check wallet and account ..."
cleos wallet unlock --password $wallet_password
cleos wallet list
cleos get accounts $key

echo "$PROMPT: EOS.IO development environment is ready."