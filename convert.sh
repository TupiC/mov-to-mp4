#!/bin/sh

PARAMS="-c:v libvpx-vp9 -crf 40 -b:v 2M -movflags +faststart -vf scale=-1:1080 -an"

for file in /input/*.mp4; do
  if [ -f "$file" ]; then
    BASENAME=$(basename "$file" .mp4)
    
    SAFE_PARAMS=$(echo "$PARAMS" | tr ' ' '_')
    
    OUTPUT_FILE="/output/${BASENAME}_${SAFE_PARAMS}.webm"
    
    echo "Processing file: $file"
    echo "Output file: $OUTPUT_FILE"
    
    ffmpeg -i "$file" $PARAMS "$OUTPUT_FILE"
  fi
done
