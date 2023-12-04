#!/bin/bash

# Set the base directory where the script is located
BASE_DIR="/content/EE562_AI_Project/scripts/pokemon"

# Change to the script's directory
cd "$BASE_DIR"

# Remove existing dataset
rm -rf "../../datasets/pokemon_pix2pix_dataset"

# Download and move the dataset
kaggle datasets download -d norod78/sketch2pokemon
mv -f sketch2pokemon.zip "../../datasets/"

# Unzip the dataset
cd "../../datasets/"
unzip sketch2pokemon.zip
rm -f sketch2pokemon.zip
mv -f pokemon_pix2pix_dataset "$BASE_DIR/../datasets/"

# Change to the dataset directory
cd "$BASE_DIR/../datasets/pokemon_pix2pix_dataset"
./make_dirs.sh
./organize.sh

# Go back to the original directory and run the Python script
cd "$BASE_DIR/../datasets"
python "combine_A_and_B.py" --fold_A "pokemon_pix2pix_dataset/A" --fold_B "pokemon_pix2pix_dataset/B" --fold_AB "pokemon_pix2pix_dataset/AB"
