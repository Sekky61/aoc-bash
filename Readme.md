# Advent of Code 2023 using Bash

This repository contains my solutions for the Advent of Code 2023 challenges, implemented in Bash.
More specifically, using Bash and unix utilities. 

## Directory Structure

Each day's solutions are organized into separate directories.

```
/Day-XX
├── input.txt
├── part-1.sh
└── part-2.sh
```

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/Sekky61/aoc-bash.git
cd aoc-bash
```

2. Navigate to the specific day's directory (a needed step):

```bash
cd Day-01
```

3. Run the solution scripts:

```bash
bash part-1.sh
bash part-2.sh
```

## Automated Day Setup

1. Create the file `cookies.txt` in the root directory and paste your session cookie from the AoC website into it.

2. Run the script with the desired day number:

```bash
./create.sh <day_number>
```

3. The script creates a directory (Day-<day_number>), an empty input.txt file, and populates part-1.sh and part-2.sh with templates.

4. Navigate to the day's directory and start solving the challenges!
