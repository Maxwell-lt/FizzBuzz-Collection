#!/usr/bin/env python3
# Simple FizzBuzz in Python

for i in range(1,101):
    if not (i % 3):
        print("Fizz", end='')
    if not (i % 5):
        print("Buzz", end='')
    if (i % 3) and (i % 5):
        print(i, end='')
    print("\n")
