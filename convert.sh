#!/bin/sh

for file in /input/*.mov; do
  if [ -f "$file" ]; then
    output_file=/output/$(basename "$file" .mov).mp4
    # ffmpeg -i "$file" -c:v libx264 -c:a aac "$output_file" && rm -f "$file"
    # ffmpeg -i "$file" -vcodec h264 -acodec aac $output_file
    ffmpeg -i "$file" -c:v libx264 -c:a aac -vf format=yuv420p -movflags +faststart $output_file
  fi
done
