#!/bin/bash

# Advent of Code 2023 - Day 03 - Part 2

# Your solution code here

file_input="input.txt"

# get width of a line
# $0 is the current input line
# +1 newline has to be counted
width=$(awk '{print length($0) + 1; exit}' <$file_input)

# get offsets from beggining of a file in bytes
num_offsets=$(rg --byte-offset --only-matching '\d+' $file_input)
# collect the same positions for symbols (multiple ranges, not dot)
gear_offsets=$(rg --byte-offset --only-matching '\*' $file_input)

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

# return all nearby numbers given a symbol positon
find_number() {
    local line="$1"
    local offset="$2"

    # number line is: line:offset:end:number
    # -F is another way to set field separator
    awk -F  ':' -v line=$line -v offset=$offset \
            '$1 >= (line-1) && $1 <= (line+1) && \
            ( ( $3 >= offset && $3 <= (offset+2) ) || ( $2 >= (offset-1) && $2 <= (offset+1) ) )' <<<$nums
}

nums=$(transform_line "$num_offsets")
symbols=$(transform_line "$gear_offsets")

# filter numbers. keep those, that have a symbol nearby
# for each number, check if there is a symbol nearby
# split by colon
acc=0
while IFS=: read line start stop; do
    matches=$(find_number $line $start)
    lines_count=$(wc -l <<<$matches)
    if [[ ($lines_count == 2) ]] ; then
        # extract both numbers
        nums_inner=$( grep -o -E '[0-9]+$' <<<$matches)
        # now, numarr is an array
        IFS=$'\n' read -d '' -r -a numarr <<<"$nums_inner"
        acc=$(($acc + (${numarr[0]} * ${numarr[1]}) ))
    fi
done <<< "$symbols"

echo "$acc"
