'''
main.py

Calls the random_sum() function from random-sum.c and prints the result
Author: Ryan McHenry
'''

import ctypes

c_module = ctypes.CDLL('./random-sum.so')

random_sum = c_module.random_sum
random_sum.restype = ctypes.c_int

print(random_sum())
