#!/bin/sh -e

rm -f /dev/shm/myshmpipe
./myshmpipe $(cat SIZE)
