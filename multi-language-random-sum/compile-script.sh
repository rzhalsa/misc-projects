#!/bin/bash

# run this script using ./compile-script.sh in your Linux CLI to generate the random-sum.so
# file needed by main.py

gcc -c -std=c11 -o random-sum.o random-sum.c -Wall -Wextra
gcc random-sum.o -shared -o random-sum.so -Wall -Wextra
rm random-sum.o
