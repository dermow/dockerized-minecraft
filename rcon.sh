#! /bin/bash

source .env

sudo docker run --rm outdead/rcon ./rcon -a $MC_RCON_SRV:$MC_RCON_PORT -p $MC_RCON_PW "$1"
