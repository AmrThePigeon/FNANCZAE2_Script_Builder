#!/bin/bash

scriptlocation=$(pwd -L)
scriptdeletion() {
rm -f "$scriptlocation/fnancz2-updater.sh"
}
trap scriptdeletion EXIT

if [[ -f fnancz2-updater.sh ]]; then
  rm -f fnancz2-updater.sh
fi

if [[ -d "assets" && -f "assets/game.unx" ]]; then
   if wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/fnancz2-updater.sh --no-cache; then
      chmod +x fnancz2-updater.sh
      ./fnancz2-updater.sh
   else
         echo -e "\e[31mError: Unable to download the updater script. Please check your internet connection and try again\e[0m"
         read -n 1 -s -p "Press any key to continue..."
         exit 1
   fi
else
  echo -e "\e[31mError: Game Files not found\e[0m"
  read -n 1 -s -p "Press any key to continue..."
  exit 1
fi  
