#!/bin/bash

# build llvm 16
yay --mflags "--nocheck" --sudoloop -S llvm-minimal-git lib32-llvm-minimal-git

# Download snapshots of mesa-git and lib32-mesa-git
wget https://aur.archlinux.org/cgit/aur.git/snapshot/mesa-git.tar.gz
wget https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-mesa-git.tar.gz

# extracting snapshots
cd ~/Downloads
tar xf mesa-git.tar.gz
tar xf lib32-mesa-git.tar.gz

# prepairing for build
mkdir build
mv mesa-git build/mesa-git
mv lib32-mesa-git build/lib32-mesa-git
rm mesa-git.tar.gz
rm lib32-mesa-git.tar.gz

# Build mesa-git
cd build/mesa-git
MESA_WHICH_LLVM=1 makepkg -si

# Build lib32-mesa-git
cd ../lib32-mesa-git
MESA_WHICH_LLVM=1 makepkg -si

# done!
echo "Reboot system to have a working graphics card!"
