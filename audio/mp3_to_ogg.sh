#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have mpg123 installed and available for use.
#
if ! [ -x "$(command -v mpg123)" ]
then
    echo "mpg123 could not be found."
    echo "Please check you have mpg123 installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Check we have oggenc installed and available for use.
#
if ! [ -x "$(command -v oggenc)" ]
then
    echo "oggenc could not be found."
    echo "Please check you have oggenc installed on your system."
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

#
# Settings for the conversion. Edit as required.
#
set_bitrate=160
set_sample_rate=44100

#
# Convert audio file (wav) to ogg vorbis (ogg). 
#
for in_filename in *.[wW][aA][vV]
do
    # Set Variable Bit Rate (VBR) to 'set_bitrate' kbps target bitrate.
    oggenc "$in_filename" --resample "$set_sample_rate" -b "$set_bitrate" -o "${in_filename%.*}.ogg"
done

#
# Create folder 'original_mp3' and then move all (mp3) files into that folder.
#
mkdir -p original_mp3

for in_filename in *.[mM][pP][3]
do
    mv -f "$in_filename" original_mp3/
done

#
# Create folder 'intermediate_wav' and then move all (wav) files into that folder.
#
mkdir -p intermediate_wav

for in_filename in *.[wW][aA][vV]
do
    mv -f "$in_filename" intermediate_wav/
done
