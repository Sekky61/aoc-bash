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

# Define template directory
template_directory="template"

# Check if day number is provided
if [ -z "$day_number" ]; then
  echo "Usage: $0 <day_number> (e.g. 01)"
  exit 1
fi

# Create a directory for the new day
day_directory="Day-${day_number}"
mkdir -p "${day_directory}"

# Create input.txt file
touch "${day_directory}/input.txt"

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
