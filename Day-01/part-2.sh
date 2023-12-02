#!/bin/bash

# Advent of Code 2023 - Day 01 - Part 2

# accumulator
acc=0

# map of words to numbers
declare -A numbers=( ["one"]="1" ["two"]="2" ["three"]="3" ["four"]="4" ["five"]="5" ["six"]="6" ["seven"]="7" ["eight"]="8" ["nine"]="9")

# take input, transform all words
# -e - script
# /g - global
# /s - replace
filtered=$(sed -e 's/one/one1one/g' input.txt \
    | sed -e 's/two/two2two/g' \
    | sed -e 's/three/three3three/g' \
    | sed -e 's/four/four4four/g' \
    | sed -e 's/five/five5five/g' \
    | sed -e 's/six/six6six/g' \
    | sed -e 's/seven/seven7seven/g' \
    | sed -e 's/eight/eight8eight/g' \
    | sed -e 's/nine/nine9nine/g' )

echo "${filtered}"

# for each line
# IFS is empty string
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
done <<< "$filtered"
# In Bash, the <<< operator is used for a here-string

echo "$acc"
