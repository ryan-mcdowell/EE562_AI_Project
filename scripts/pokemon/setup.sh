#!/bin/bash

rm -rf ../../datasets/pokemon_pix2pix_dataset

kaggle datasets download -d norod78/sketch2pokemon
mv -f sketch2pokemon.zip ../../datasets/

cd ../../datasets/
unzip sketch2pokemon.zip
rm -f sketch2pokemon.zip
cp -f ../scripts/pokemon/organize.sh ../scripts/pokemon/make_dirs.sh pokemon_pix2pix_dataset

cd pokemon_pix2pix_dataset
./make_dirs.sh
./organize.sh

cd ../../
python datasets/combine_A_and_B.py --fold_A ./datasets/pokemon_pix2pix_dataset/A --fold_B ./datasets/pokemon_pix2pix_dataset/B --fold_AB ./datasets/pokemon_pix2pix_dataset/AB
