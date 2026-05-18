#!/bin/bash
if ! command -v "xdelta3" &> /dev/null; then
  if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y xdelta3
elif command -v dnf &> /dev/null; then
    sudo dnf install -y xdelta3
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy xdelta3
elif command -v zypper &> /dev/null; then
    sudo zypper install -y xdelta3
else
    echo "Error: Supported package manager not found (apt, dnf, pacman, or zypper)."
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
elif [[ "$version" == "0.9.10" ]]; then
   echo -e "\033[34mUpdating the game files...\033[0m"
if wget https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/Updates/0.9.10-to-0.9.11.xdelta; then 
   if mv "assets/game.unx" "assets/data.win"; then
      if xdelta3 -d -s "assets/data.win" #xdeltafile "assets/game.unx"; then
      rm "assets/data.win" 2>/dev/null
      echo -e "Update Finished!"
      fi
   fi
fi 
elif [[ "$version" == "0.9.9" ]]; then
   echo -e "\033[34mUpdating the game files...\033[0m"
if #Download of v0.9.10 xdelta command here && #Download command of v9.11 xdelta here; then 
   unzip #update zip containing the xdelta of v0.9.10
   unzip #update zip containing the xdelta of v0.9.11
   if mv "assets/game.unx" "assets/data.win"; then
      if xdelta3 -d -s "assets/data.win" #xdeltafile0.9.10 "assets/data1.win"; then
           rm "assets/data.win" 2>/dev/null
         if xdelta3 -d -s "assets/data1.win" #xdeltafile0.9.11 "assets/game.unx"; then
           rm "assets/data1.win" 2>/dev/null
           echo -e "Update Finished!"
           fi
         fi 
      fi
   fi
fi 
else 
echo -e "\e[31mError: Your version is unsupported for updates\e[0m"
exit 1
  fi
   else
   echo -e "\e[31mError: permission denied\e[0m"
fi

# Do not use this script. I'm still working on it and it's not finished
