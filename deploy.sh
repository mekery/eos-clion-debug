#! /bin/sh

# ==============================================================================
# Description: EOS Contract Deployment
# Author: Micle Bu, micle@oriovo.com
# Created On: 2018.04.28
# Updated On: 2018.04.28
# ==============================================================================
PROMPT=Oriovo

## Configuration
## -----------------------------------------------------------------------------
key='EOS5ZA87Rz26TZg1zYZptJebtUwv7Reh4ZhPUsfsF3yUX3mrUM4KV'
user='debug.code'
contract='debug'
build='cmake-build-release'

## Account
## Create a specific account to deploy contract
## -----------------------------------------------------------------------------
echo "\n---------------------------------------- Account ----------------------------------------"
accounts=`cleos get accounts $key`
hit=`echo $accounts | grep $user`

if [ -z "$hit" ]; then
    cleos create account eosio $user $key $key
else
    echo "$PROMPT: accont $user is existed."
fi

## Deploy
## -----------------------------------------------------------------------------
echo "\n---------------------------------------- Contract ----------------------------------------"
echo "$PROMPT: deploying contract ..."
cleos set contract $user $build/$contract -p $user

## Run
## -----------------------------------------------------------------------------
echo "\n---------------------------------------- Actions ----------------------------------------"
echo "$PROMPT: Running actions ..."
cleos push action $user foo '["micle", "test", 100]' -p $user