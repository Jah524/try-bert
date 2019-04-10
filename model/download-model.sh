#!/bin/bash

wget "https://drive.google.com/uc?export=download&id=1jjZmgSo8C9xMIos8cUMhqJfNbyyqR0MY" -O wiki-ja.model
wget "https://drive.google.com/uc?export=download&id=1uzPpW38LcS4YS431GgdG0Hsj4gNgE5X1" -O wiki-ja.vocab
wget "https://drive.google.com/uc?export=download&id=1LB00MDQJjb-xLmgBMhdQE3wKDOLjgum-" -O model.ckpt-1400000.index
wget "https://drive.google.com/uc?export=download&id=1V9TIUn5wc-mB_wabYiz9ikvLsscONOKB" -O model.ckpt-1400000.meta

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1F4b_u-5zzqabA6OfLxDkLh0lzqVIEZuN" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1F4b_u-5zzqabA6OfLxDkLh0lzqVIEZuN" -o model.ckpt-1400000.data-00000-of-00001
