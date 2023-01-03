#!/bin/bash
#build llvm 16
yay --mflags "--nocheck" --sudoloop -S llvm-minimal-git lib32-llvm-minimal-git

#Download snapshots of mesa-git and lib32-mesa-git
xdg-open https://aur.archlinux.org/cgit/aur.git/snapshot/mesa-git.tar.gz
xdg-open https://aur.archlinux.org/cgit/aur.git/snapshot/lib32-mesa-git.tar.gz
echo "Waiting for Packages to download"
sleep 10

#extracting snapshots
cd ~/Downloads
tar xf ~/Downloads/mesa-git.tar.gz
tar xf ~/Downloads/lib32-mesa-git.tar.gz

#prepairing for build
mkdir ./build
mv ~/Downloads/mesa-git ./build/mesa-git
mv ~/Downloads/lib32-mesa-git ./build/lib32-mesa-git
rm ~/Downloads/mesa-git.tar.gz
rm ~/Downloads/lib32-mesa-git.tar.gz

#Build mesa-git
cd ./build/mesa-git
MESA_WHICH_LLVM=1 makepkg -si

#Build lib32-mesa-git
cd ../lib32-mesa-git
MESA_WHICH_LLVM=1 makepkg -si

#done!
echo "Reboot system to have a working graphics card!"

