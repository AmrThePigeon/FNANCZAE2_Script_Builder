#!/bin/bash
if ! command -v "xdelta3" &> /dev/null && ! command -v "unzip" &> /dev/null && ! command -v "wget" &> /dev/null; then
  if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y xdelta3 unzip wget
elif command -v dnf &> /dev/null; then
    sudo dnf install -y xdelta3 unzip wget
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy xdelta3 unzip wget
elif command -v zypper &> /dev/null; then
    sudo zypper install -y xdelta3 unzip wget
elif command -v apk &> /dev/null; then
    sudo apk add wget xdelta unzip
elif command -v emerge &> /dev/null; then
    sudo emerge net-misc/wget app-arch/xdelta app-arch/unzip
else
    echo "\e[31mError: Supported package manager not found (apt, dnf, pacman, zypper, apk or emerge)\e[0m"
    echo "You have to manually install the dependencies (wget, unzip and xdelta3)"
    xmessage "Error: Supported package manager not found (apt, dnf, pacman, zypper, apk or emerge), You have to manually install the dependencies (wget, unzip and xdelta3)"
    exit 1
  fi 
fi

if [[ -f "assets/versioninfo.txt" && -f "assets/game.unx" ]]; then
  version=$(head -n 1 "assets/versioninfo.txt")
else
  echo -e "\e[31mError: Game Files not found\e[0m"
  exit 1
fi


if [[ "$version" == "0.9.11" ]]; then
   echo -e "\033[34mYou are already on latest version\033[0m"
   xmessage "You are already on latest version"
elif [[ "$version" == "0.9.10" ]]; then
   echo -e "\033[34mUpdating the game files...\033[0m"
     if wget https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/Updates/0.9.10-to-0.9.11.xdelta; then 
        if mv "assets/game.unx" "assets/data.win"; then
           if xdelta3 -d -s "assets/data.win" "0.9.10-to-0.9.11.xdelta" "assets/game.unx"; then
              rm "0.9.10-to-0.9.11.xdelta" 2>/dev/null
              rm "assets/data.win" 2>/dev/null
              echo -e "\033[34mUpdate files have been applied. The game was updated to latest version successfully (v0.9.11)\033[0m"
              echo -e "0.9.11" > "assets/versioninfo.txt"
              xmessage "Update files have been applied. The game was updated to latest version successfully (v0.9.11)"
              exit 1
           fi
        fi
     fi 
#elif [[ "$version" == "0.9.9" ]]; then (Version 0.9.9 no longer obtainable)
#   echo -e "\033[34mUpdating the game files...\033[0m"
#     if #Download of v0.9.10 xdelta command here && #Download command of v9.11 xdelta here; then 
#        unzip #update zip containing the xdelta of v0.9.10
#        unzip #update zip containing the xdelta of v0.9.11
#        if mv "assets/game.unx" "assets/data.win"; then
#           if xdelta3 -d -s "assets/data.win" #xdeltafile0.9.10 "assets/data1.win"; then
#              rm "assets/data.win" 2>/dev/null
#              if xdelta3 -d -s "assets/data1.win" #xdeltafile0.9.11 "assets/game.unx"; then
#                 rm "assets/data1.win" 2>/dev/null
#                 echo -e "\033[34mUpdate files have been applied. The game was updated to latest version successfully (v0.9.11)\033[0m"
#              fi
#           fi
#        else
#          echo -e "\e[31mError: permission denied\e[0m"
#        fi
#     fi 
else 
   echo -e "\e[31mError: Your version is unsupported for updates\e[0m"
   xmessage "Error: Your version is unsupported for updates"
   exit 1
fi

# Do not use this script. Im still working on it and its not finished
