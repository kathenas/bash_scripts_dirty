#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Convert matroska container video files to quicktime container mp4. 
#
for in_filename in *.mkv *.MKV; do
    ffmpeg -i "$in_filename" -codec copy "${in_filename%.*}.mp4"
done
