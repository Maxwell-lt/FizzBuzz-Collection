#!/usr/bin/env python3
# One line monstrosity of FizzBuzz in Python
print(*map(lambda x: 'FizzBuzz' if (not (x % 3) and not (x % 5)) else 'Fizz' if not (x % 3) else 'Buzz' if not (x % 5) else x, range(1,101)), sep='\n')
