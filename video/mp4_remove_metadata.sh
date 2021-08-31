#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have ffmpeg installed and available for use.
#
if ! [ -x "$(command -v ffmpeg)" ]
then
    echo "ffmpeg could not be found."
    echo "Please check you have ffmpeg installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Remove any metadata from mp4 file.
#
for in_filename in *.[mM][pP][4]
do
    ffmpeg -i "$in_filename" -map_metadata -1 -vcodec copy "_${in_filename%.*}.mp4"
    # Remove original input file.
    rm -f "${in_filename%.*}.mp4"
    # Rename converted file to original filename.
    mv -f "_${in_filename%.*}.mp4" "${in_filename%.*}.mp4"
done
