#!/bin/bash

# Advent of Code 2023 - Day 02 - Part 2

# Your solution code here

declare -a colors=(red green blue)
acc=0

# for each line
while IFS= read -r line; do

    id=$(rg "Game (\d+)" -or '$1' <<<$line)
    min_game=1

    for color in "${colors[@]}"
    do
        numbers=$(rg "([0-9]+) $color" -or '$1' <<<$line)
        # if current $0 is bigger than x, update x
        num_max=$(awk '$0>x{x=$0};END{print x}' <<<$numbers)
        min_game=$(($num_max * $min_game))
    done

    acc=$(($acc + $min_game))
done < input.txt

echo $acc
