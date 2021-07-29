#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have ffmpeg installed and available for use.
#
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg could not be found."
    echo "Please check you have ffmpeg installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Convert matroska container (mkv) video files to quicktime container mp4. 
#
for in_filename in *.[mM][kK][vV]; do
    ffmpeg -i "$in_filename" -codec copy "${in_filename%.*}.mp4"
done
