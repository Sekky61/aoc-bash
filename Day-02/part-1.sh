#!/bin/bash

# Advent of Code 2023 - Day 02 - Part 1

# Your solution code here

acc=0

declare -a colors=(red green blue)

# -A means assoociative array
# -a means array
declare -A limits=( ["red"]="12" ["green"]="13" ["blue"]="14" )

# for each line
while IFS= read -r line; do

    id=$(echo "$line" | rg "Game (\d+)" -or '$1')
    accept=true

    for color in "${colors[@]}"
    do
        limit=${limits[$color]}
        echo "color $color limit $limit"
        numbers=$(echo "$line" | rg "([0-9]+) $color" -or '$1')

        # if current $0 is bigger than x, update x
        num_max=$(echo "$numbers" | awk '$0>x{x=$0};END{print x}')

        # if red_max <= limit, add game
        # square brackets here call the test util
        if [ $num_max -gt $limit ]
        then
            accept=false
        fi
    done

    if [ $accept = "true" ]
    then
        acc=$(($acc + $id))
    fi

done < input.txt

echo $acc
