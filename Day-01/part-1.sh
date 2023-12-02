#!/bin/bash

# Advent of Code 2023 - Day 01 - Part 1

# accumulator
acc=0

# for each line
while IFS= read -r line; do
    # in variable line find the digits
    # -o only matching
    # -m 1 limit the output to first matched line
    # -E for extended regex syntax
    # text needs to be double quoted for variables to be filled 

    # head to get the first match
    #
    all_digits=$(echo "$line" | grep -o '[0-9]')
    first_digit=$(echo "$all_digits" | head -n 1)
    last_digit=$(echo "$all_digits" | tail -n 1)
    n="$first_digit$last_digit"
    acc=$(($acc + $n))
done < input.txt

echo $acc
