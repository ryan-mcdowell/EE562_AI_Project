#!/bin/bash

# Move testA images to ./A/test
mv ./testA/*_A.jpg ./A/test/

# Move trainA images to ./A/train
mv ./trainA/*_A.jpg ./A/train/

# Move testB images to ./B/test
mv ./testB/*_B.jpg ./B/test/

# Move trainB images to ./B/train
mv ./trainB/*_B.jpg ./B/train/

# Remove "_A" from filenames in ./A/test and ./A/train
for file in ./A/test/*.jpg; do
  mv "$file" "${file/_A/}"
done

for file in ./A/train/*.jpg; do
  mv "$file" "${file/_A/}"
done

# Remove "_B" from filenames in ./B/test and ./B/train
for file in ./B/test/*.jpg; do
  mv "$file" "${file/_B/}"
done

for file in ./B/train/*.jpg; do
  mv "$file" "${file/_B/}"
done
