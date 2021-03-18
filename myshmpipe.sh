#!/bin/bash -e

. common.sh

rm -f /dev/shm/myshmpipe
./myshmpipe ${SHM_SIZE_MB}000000
