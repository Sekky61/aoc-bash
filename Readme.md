# Advent of Code 2023 using Bash

This repository contains my solutions for the Advent of Code 2023 challenges, implemented in Bash. Each day's solutions are organized into separate directories.

## Directory Structure

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

2. Navigate to the specific day's directory:

```bash
cd Day-01
```

3. Run the solution scripts:

```bash
bash part-1.sh
bash part-2.sh
```

## Automated Day Setup

1. Run the script with the desired day number:

```bash
./create.sh <day_number>
```

2. The script creates a directory (Day-<day_number>), an empty input.txt file, and populates part-1.sh and part-2.sh with templates.

3. Navigate to the day's directory and start solving the challenges!
