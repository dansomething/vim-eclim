#!/bin/sh

V="2.8.0"
curl --silent -L https://github.com/ervandew/eclim/releases/download/$V/eclim_$V.bin > eclim.bin && sh ./eclim.bin --yes --vimfiles=skip "$@"
