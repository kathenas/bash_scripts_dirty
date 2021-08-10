#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have mpg123 installed and available for use.
#
if ! command -v mpg123 &> /dev/null
then
    echo "mpg123 could not be found."
    echo "Please check you have mpg123 installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Convert audio file (mp3) to wave (wav). 
#
for in_filename in *.[mM][pP][3]
do
    # Yes, mpg123 has some messed up logic. Output file first and input file last in the command.
    mpg123 -w "${in_filename%.*}.wav" "$in_filename"
done
