#/bin/bash

# Create a new project

# first argument is the day number
if [ -z "$1" ]
then
    echo "Please provide a day number (e.g. 01)"
    exit 1
fi

# Get the day number as an argument
day_number=$1

# if it is zero padded, remove the zero
if [[ $day_number == 0* ]]
then
    day_number_without_zero=${day_number#0}
    day_number_with_zero=$day_number
fi

# Define template directory
template_directory="template"
year="2023"

# Check if day number is provided
if [ -z "$day_number" ]; then
  echo "Usage: $0 <day_number> (e.g. 01)"
  exit 1
fi


# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Error downloading input for Day ${day_number}. Please check your session cookie and try again."
  exit 1
fi

# Create a directory for the new day
day_directory="Day-${day_number}"
mkdir -p "${day_directory}"

# Create input.txt file
touch "${day_directory}/input.txt"

# Download input for the day from Advent of Code
input_url="https://adventofcode.com/${year}/day/${day_number_without_zero}/input"
# for some reason, cookiefile does not work
AOC_SESSION_COOKIE=$(cat cookies.txt)
echo "Downloading input from ${input_url}"
curl -o "${day_directory}/input.txt" -b "${AOC_SESSION_COOKIE}" "${input_url}"

# Copy template files (part-1.sh and part-2.sh) to the new day directory
cp "${template_directory}/part-1.sh" "${day_directory}/part-1.sh"
cp "${template_directory}/part-2.sh" "${day_directory}/part-2.sh"

# Replace placeholders in the template files with the actual day number
sed -i "s/{day_number}/${day_number}/g" "${day_directory}/part-1.sh"
sed -i "s/{day_number}/${day_number}/g" "${day_directory}/part-2.sh"

# Make solution files executable
chmod +x "${day_directory}/part-1.sh"
chmod +x "${day_directory}/part-2.sh"

# Print success message
echo "Day ${day_number} prepared successfully in ${day_directory}!"
