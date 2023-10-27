#!/bin/bash

git clone https://github.com/flameshot-org/flameshot.git
cd flameshot
mkdir build && cd build
cmake -DUSE_WAYLAND_GRIM=true -DUSE_WAYLAND_CLIPBOARD=true ../
make -j$(nproc)
sudo mv ./src/flameshot /usr/bin/flameshot
cd ../../
rm -rf ./flameshot/ 
