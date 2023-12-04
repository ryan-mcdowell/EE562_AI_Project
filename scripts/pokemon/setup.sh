#!/bin/bash

# Set the base directory where the script is located
BASE_DIR="/content/EE562_AI_Project/scripts/pokemon"

# Change to the script's directory
cd "$BASE_DIR"

# Remove existing dataset
rm -rf "$BASE_DIR/../../datasets/pokemon_pix2pix_dataset"

# Download and move the dataset
kaggle datasets download -d norod78/sketch2pokemon
mv -f sketch2pokemon.zip "$BASE_DIR/../../datasets/"

# Unzip the dataset
cd "$BASE_DIR/../../datasets/"
unzip sketch2pokemon.zip
rm -f sketch2pokemon.zip
cp -f "$BASE_DIR/organize.sh" "$BASE_DIR/make_dirs.sh" pokemon_pix2pix_dataset

# Change to the dataset directory
cd "$BASE_DIR/pokemon_pix2pix_dataset"
./make_dirs.sh
./organize.sh

# Go back to the original directory and run the Python script
cd "$BASE_DIR/../.."
python "$BASE_DIR/datasets/combine_A_and_B.py" --fold_A "$BASE_DIR/datasets/pokemon_pix2pix_dataset/A" --fold_B "$BASE_DIR/datasets/pokemon_pix2pix_dataset/B" --fold_AB "$BASE_DIR/datasets/pokemon_pix2pix_dataset/AB"
