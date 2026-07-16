#!/bin/bash
set -e

v0_9_10_to_v0_9_11="https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/Updates/0.9.10-to-0.9.11.fnanczupdate"
v0_9_11_to_v0_9_12="https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/0.9.12update/0.9.11-to-0.9.12.fnanczupdate"

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
    sudo apk add wget xdelta3 unzip
elif command -v emerge &> /dev/null; then
    sudo emerge net-misc/wget dev-util/xdelta3 app-arch/unzip
else
    echo "\e[31mError: Supported package manager not found (apt, dnf, pacman, zypper, apk or emerge)\e[0m"
    echo "You have to manually install the dependencies (wget, unzip and xdelta3)"
    read -n 1 -s -p "Press any key to continue..."
    exit 1
  fi 
fi

if [[ -f "assets/versioninfo.txt" && -f "assets/game.unx" ]]; then
  version=$(head -n 1 "assets/versioninfo.txt")
else
  echo -e "\e[31mError: Game Files not found\e[0m"
  read -n 1 -s -p "Press any key to continue..."
  exit 1
fi


if [[ "$version" == "0.9.12" ]]; then
   echo -e "\033[34mYou are already on latest version\033[0m"
   read -n 1 -s -p "Press any key to continue..."
# Version v0.9.11 Update
elif [[ "$version" == "0.9.11" ]]; then
   echo -e "\033[34mUpdating the game files...\033[0m"
      if wget "$v0_9_11_to_v0_9_12" --no-cache; then
         if mv "assets/game.unx" "assets/data.win"; then
           if xdelta3 -d -s "assets/data.win" "0.9.11-to-0.9.12.fnanczupdate" "assets/game.unx"; then
              rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
              rm "assets/data.win" 2>/dev/null
              if wget https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/0.9.12update/fnancz_2_yoyorunner_v0.9.12.fnancz --no-cache; then
                 if xdelta3 -d -s Five_Nights_at_NCZ_2 fnancz_2_yoyorunner_v0.9.12.fnancz Five_Nights_at_NCZ_2_yoyo; then
                    rm fnancz_2_yoyorunner_v0.9.12.fnancz
                    rm Five_Nights_at_NCZ_2
                    mv Five_Nights_at_NCZ_2_yoyo Five_Nights_at_NCZ_2
                    echo -e "\033[0;34mCompiler switching for v0.9.12 complete\033[0m"
                 else
                    echo -e "\e[31mError while applying the new compiler, the game will won't run properly\e[0m"
                    rm fnancz_2_yoyorunner_v0.9.12.fnancz
                    rm Five_Nights_at_NCZ_2_yoyo
                    read -n 1 -s -p "Press any key to continue..."
                    exit 1
                 fi
              else
                echo -e "\e[31mError: Unable to download update files. Please check your internet connection and try again.\e[0m"
                read -n 1 -s -p "Press any key to continue..."
                exit 1
              fi
              echo -e "0.9.12" > "assets/versioninfo.txt"
              echo -e "\033[34mUpdate files have been applied. The game was updated to latest version successfully (v0.9.12)\033[0m"
              read -n 1 -s -p "Press any key to continue..."
              exit 0
           fi
         else
           echo -e "\e[31mError: permission denied\e[0m"
           rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
           read -n 1 -s -p "Press any key to continue..."
           exit 1
        fi 
      else
        echo -e "\e[31mError: Unable to download update files. Please check your internet connection and try again\e[0m"
        read -n 1 -s -p "Press any key to continue..."
        exit 1
      fi

# Version v0.9.10 Update
elif [[ "$version" == "0.9.10" ]]; then
   echo -e "\033[34mUpdating the game files...\033[0m"
   if wget "$v0_9_10_to_v0_9_11" --no-cache && wget "$v0_9_11_to_v0_9_12" --no-cache; then
     if mv "assets/game.unx" "assets/data.win"; then
           if xdelta3 -d -s "assets/data.win" "0.9.10-to-0.9.11.fnanczupdate" "assets/data1.win"; then
              mv "assets/data.win" "assets/uselessdatafile.win" 2>/dev/null
              if xdelta3 -d -s "assets/data1.win" "0.9.11-to-0.9.12.fnanczupdate" "assets/game.unx"; then
                 rm "assets/data1.win" 2>/dev/null
                 rm "0.9.10-to-0.9.11.fnanczupdate" 2>/dev/null
                 rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
                 rm "assets/uselessdatafile.win" 2>/dev/null
                 echo -e "0.9.12" > "assets/versioninfo.txt"
                 if wget https://github.com/AmrThePigeon/FNANCZAE2_Script_Builder/releases/download/0.9.12update/fnancz_2_yoyorunner_v0.9.12.fnancz --no-cache; then
                   if xdelta3 -d -s Five_Nights_at_NCZ_2 fnancz_2_yoyorunner_v0.9.12.fnancz Five_Nights_at_NCZ_2_yoyo; then
                      rm fnancz_2_yoyorunner_v0.9.12.fnancz
                      rm Five_Nights_at_NCZ_2
                      mv Five_Nights_at_NCZ_2_yoyo Five_Nights_at_NCZ_2
                      echo -e "\033[0;34mCompiler switching for v0.9.12 complete\033[0m"
                  else
                    echo -e "\e[31mError while applying the new compiler, the game will won't run properly\e[0m"
                    rm fnancz_2_yoyorunner_v0.9.12.fnancz
                    rm Five_Nights_at_NCZ_2_yoyo
                    exit 1
                   fi
                 else
                   echo -e "\e[31mError: Unable to download update files. Please check your internet connection and try again.\e[0m"
                   exit 1
                 fi
                 echo -e "\033[34mUpdate files have been applied. The game was updated to latest version successfully (v0.9.12)\033[0m"
                 read -n 1 -s -p "Press any key to continue..."
                 exit 0
              else
                rm "0.9.10-to-0.9.11.fnanczupdate" 2>/dev/null
                rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
                rm "assets/data1.win" 2>/dev/null
                mv "assets/uselessdatafile.win" "assets/game.unx"
                echo -e "\e[31mAn error occurred while applying the 2nd update file\e[0m"
                read -n 1 -s -p "Press any key to continue..."
                exit 1
              fi
           else
             rm "0.9.10-to-0.9.11.fnanczupdate" 2>/dev/null
             rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
             rm "assets/data1.win" 2>/dev/null
             mv "assets/data.win" "assets/game.unx"
             echo -e "\e[31mAn error occurred while applying the first update file\e[0m"
             read -n 1 -s -p "Press any key to continue..."
             exit 1
           fi
        else
          echo -e "\e[31mError: permission denied\e[0m"
          rm "0.9.10-to-0.9.11.fnanczupdate" 2>/dev/null
          rm "0.9.11-to-0.9.12.fnanczupdate" 2>/dev/null
          read -n 1 -s -p "Press any key to continue..."
          exit 1
     fi 
    else
      echo -e "\e[31mError: Unable to download update files. Please check your internet connection and try again\e[0m"
      read -n 1 -s -p "Press any key to continue..."
      exit 1
   fi

#elif [[ "$version" == "0.9.9" ]]; then
#   echo -e "\033[34mUpdating the game files...\033[0m"
#   if wget #Download of v0.9.10 xdelta command here && wget #Download command of v0.9.11 xdelta here; then
#     if mv "assets/game.unx" "assets/data.win"; then
#           if xdelta3 -d -s "assets/data.win" #xdeltafile0.9.10 "assets/data1.win"; then
#              mv "assets/data.win" "assets/uselessdatafile.win" 2>/dev/null
#              if xdelta3 -d -s "assets/data1.win" #xdeltafile0.9.11 "assets/game.unx"; then
#                 rm "assets/data1.win" 2>/dev/null
#                 rm "#xdeltafile0.9.10" 2>/dev/null
#                 rm "#xdeltafile0.9.11" 2>/dev/null
#                 rm "assets/uselessdatafile.win" 2>/dev/null
#                 echo -e "0.9.11" > "assets/versioninfo.txt"
#                 echo -e "\033[34mUpdate files have been applied. The game was updated to latest version successfully (v0.9.11)\033[0m"
#                 read -n 1 -s -p "Press any key to continue..."
#                 exit 0
#              else
#                rm "#xdeltafile0.9.10" 2>/dev/null
#                rm "#xdeltafile0.9.11" 2>/dev/null
#                rm "assets/data1.win" 2>/dev/null
#                mv "assets/uselessdatafile.win" "assets/game.unx"
#                echo -e "\e[31mAn error occurred while applying the 2nd update file\e[0m"
#                read -n 1 -s -p "Press any key to continue..."
#                exit 1
#              fi
#           else
#             rm "#xdeltafile0.9.10" 2>/dev/null
#             rm "#xdeltafile0.9.11" 2>/dev/null
#             rm "assets/data1.win" 2>/dev/null
#             mv "assets/data.win" "assets/game.unx"
#             echo -e "\e[31mAn error occurred while applying the first update file\e[0m"
#             read -n 1 -s -p "Press any key to continue..."
#             exit 1
#           fi
#        else
#          echo -e "\e[31mError: permission denied\e[0m"
#          rm "#xdeltafile0.9.10" 2>/dev/null
#          rm "#xdeltafile0.9.11" 2>/dev/null
#          read -n 1 -s -p "Press any key to continue..."
#          exit 1
#     fi 
#    else
#      echo -e "\e[31mError: Unable to download update files. Please check your internet connection and try again\e[0m"
#      read -n 1 -s -p "Press any key to continue..."
#      exit 1
#   fi

# This part of the script was commented out because of that the version 0.9.9 no longer obtainable, I might need this later for later updates.
else 
   echo -e "\e[31mError: Your version is unsupported for updates\e[0m"
   read -n 1 -s -p "Press any key to continue..."
   exit 1
fi
