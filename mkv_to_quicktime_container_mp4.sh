#!/bin/bash

#
# Convert matroska container video files to quicktime container mp4. 
#
for in_filename in *.mkv *.MKV; do
    ffmpeg -i "$in_filename" -codec copy "${in_filename%.*}.mp4"
done
