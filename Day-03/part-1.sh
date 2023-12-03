#!/bin/bash

# Advent of Code 2023 - Day 03 - Part 1

# Your solution code here

file_input="input.txt"

# get width of a line
# $0 is the current input line
# +1 newline has to be counted
width=$(awk '{print length($0) + 1; exit}' <$file_input)

# get offsets from beggining of a file in bytes
num_offsets=$(rg --byte-offset --only-matching '\d+' $file_input)
# collect the same positions for symbols (multiple ranges, not dot)
symbol_offsets=$(rg --byte-offset --only-matching '[#-\-/:-@]' $file_input)

# transform the offset, which is in the form offset:number, into line:begin:end:number
# FS is field separator
transform_line() {
    local input_file="$1"
    awk -v width=$width \
            'BEGIN {FS=":"} {\
            line_offset = $1 % width;\
            number_width = length($2)
            line_number = $1 / width;\
            printf "%d:%d:%d:%s\n", line_number+1, line_offset, line_offset+number_width, $2 \
            }' <<<$input_file
}

# return true, if there is a symbol nearby
find_symbol() {
    local line="$1"
    local start="$2"
    local end="$3"

    # symbol line is: line:offset
    # -F is another way to set field separator
    matches=$(awk -F  ':' -v line=$line -v start=$start -v end=$end \
            '$1 >= (line-1) && $1 <= (line+1) && $2 >= (start-1) && $2 <= (end)' <<<$symbols)
    matches_len=${#matches}
    return $matches_len
}

nums=$(transform_line "$num_offsets")
symbols=$(transform_line "$symbol_offsets")

# filter numbers. keep those, that have a symbol nearby
# for each number, check if there is a symbol nearby
# split by colon
acc=0
while IFS=: read line start stop num; do
    find_symbol $line $start $stop
    if [[ !($? == 0) ]] ; then
        acc=$(($acc + $num))
    fi
done <<< "$nums"

# sum the numbers

echo "$acc"
