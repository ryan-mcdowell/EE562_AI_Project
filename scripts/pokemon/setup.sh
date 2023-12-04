#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Remove existing dataset
rm -rf "$SCRIPT_DIR/../../datasets/pokemon_pix2pix_dataset"

# Download and move the dataset
kaggle datasets download -d norod78/sketch2pokemon
mv -f "$SCRIPT_DIR/sketch2pokemon.zip" "$SCRIPT_DIR/../../datasets/"

# Unzip the dataset
cd "$SCRIPT_DIR/../../datasets/"
unzip sketch2pokemon.zip
rm -f sketch2pokemon.zip
cp -f "$SCRIPT_DIR/organize.sh" "$SCRIPT_DIR/make_dirs.sh" pokemon_pix2pix_dataset

# Change to the dataset directory
cd "$SCRIPT_DIR/pokemon_pix2pix_dataset"
./make_dirs.sh
./organize.sh

# Go back to the original directory and run the Python script
cd "$SCRIPT_DIR/../.."
python "$SCRIPT_DIR/datasets/combine_A_and_B.py" --fold_A "$SCRIPT_DIR/datasets/pokemon_pix2pix_dataset/A" --fold_B "$SCRIPT_DIR/datasets/pokemon_pix2pix_dataset/B" --fold_AB "$SCRIPT_DIR/datasets/pokemon_pix2pix_dataset/AB"
