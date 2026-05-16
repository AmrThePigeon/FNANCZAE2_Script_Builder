scriptlocation=$(pwd -L)
scriptdeletion() {
rm -f "$scriptlocation/fnancz2-installer1.sh"
}
trap scriptdeletion EXIT

echo -e "\e[31mP.S: you must give full path of the zip without any shortcut\e[0m"
echo -e "Press [ENTER] if the game zip file was downloaded in $HOME/Downloads directory."
read -r -p "Game zip file path [Defaulted=Downloads]:" path
gamename="Five Nights at NCZ 2"

cd "$HOME/Downloads" 2>/dev/null
cd "$path" 2>/dev/null # kinda stupid way that handles the operation but eh works for now
currentdir=$(pwd -L)

if [[ -f "FNaNCZ v0.9.10.zip" || -f "FNaNCZ+v0.9.10.zip" ]]; then
     mv "FNaNCZ v0.9.10.zip" "FNaNCZ 2 v0.9.10.zip" 2>/dev/null
fi

gamezip2=$(ls -v -r 'FNaNCZ+2+v'* 2>/dev/null | head -n 1)
if [ -f "$gamezip2" ]; then
    mv "$gamezip2" "${gamezip2//+/ }"
fi
gamezip=$(ls -v -r 'FNaNCZ 2 v'* 2>/dev/null | head -n 1)
if [ ! -f "$gamezip" ]; then
    echo -e "\e[31mError: the game zip file doesn't exist in $(pwd -L)!\e[0m"
    exit 1
fi

if [ -d "$gamename" ]; then
    echo -e "\e[31mError: '$gamename' folder already exists at this location!\e[0m"
    exit 1
fi

mkdir "$gamename"
if [ ! -d "$gamename" ]; then
    echo -e "\e[31mLooks like I don't have permission to do that. Try the script again on a directory with full read & write access.\e[0m"
fi

versionnumber=${gamezip#FNaNCZ 2 v}
versionnumber=${versionnumber%.zip}

cp "$gamezip" "$gamename"
cd "$gamename"
unzip "$gamezip" 
rm "$gamezip"
mkdir "assets"
touch "assets/versioninfo.txt"
echo -e "$versionnumber" > "assets/versioninfo.txt"
rm "FNANCZ 2.exe"
mv "data.win" "assets"

if [ -f "6am-animation.mp4" ]; then
    mv "6am-animation.mp4" "6am_animation.mp4"

fi
mv "6am_animation.mp4" "assets"
mv "options.ini" "assets"
mv "assets/data.win" "assets/game.unx"
rm NekoPresence_x64.dll
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/GameRunner.zip --no-cache
unzip GameRunner.zip
rm GameRunner.zip
mv libNekoPresence_x64_linux_arm64-v8a.so assets
mv icon.png assets
mv liblibnekopresence_linux_arm64-v8a.so assets
unzip lib.zip
rm lib.zip
chmod +x Five_Nights_at_NCZ_2
chmod +x run.sh

if [ ! -f "Five_Nights_at_NCZ_2" ]; then
     echo -e "\e[31m'Five_Nights_at_NCZ_2' file not found\e[0m"
fi

if [ ! -f "run.sh" ]; then
     echo -e "\e[31m'run.sh' file not found\e[0m"
fi

if [ ! -f "lib/libcrypto.so.1.0.0" ]; then
     echo -e "\e[31m'lib/libcrypto.so.1.0.0' file not found\e[0m"
fi

if [ ! -f "lib/libcurl-gnutls.so.4" ]; then
     echo -e "\e[31m'lib/libcurl-gnutls.so.4' file not found\e[0m"
fi

if [ ! -f "lib/libgcrypt.so.11" ]; then
     echo -e "\e[31m'lib/libgcrypt.so.11' file not found\e[0m"
fi

if [ ! -f "lib/libGLU.so.1" ]; then
     echo -e "\e[31m'lib/libGLU.so.1' file not found\e[0m"
fi

if [ ! -f "lib/libhogweed.so.4" ]; then
     echo -e "\e[31m'lib/libhogweed.so.4' file not found\e[0m"
fi

if [ ! -f "lib/libidn.so.11" ]; then
     echo -e "\e[31m'lib/libidn.so.11' file not found\e[0m"
fi

if [ ! -f "lib/libnettle.so.6" ]; then
     echo -e "\e[31m'lib/libnettle.so.6' file not found\e[0m"
fi

if [ ! -f "lib/librtmp.so.0" ]; then
     echo -e "\e[31m'lib/librtmp.so.0' file not found\e[0m"
fi

if [ ! -f "lib/libssl.so.1.0.0" ]; then
     echo -e "\e[31m'lib/libssl.so.1.0.0' file not found\e[0m"
fi

if [ ! -f "assets/6am_animation.mp4" ]; then
     echo -e "\e[31m'assets/6am_animation.mp4' file not found\e[0m"
fi

if [ ! -f "assets/game.unx" ]; then
     echo -e "\e[31m'assets/game.unx' file not found\e[0m"
fi

if [ ! -f "assets/icon.png" ]; then
     echo -e "\e[31m'assets/icon.png' file not found\e[0m"
fi

if [ ! -f "assets/liblibnekopresence_linux_arm64-v8a.so" ]; then
     echo -e "\e[31m'assets/liblibnekopresence_linux_arm64-v8a.so' file not found\e[0m"
fi

if [ ! -f "assets/libNekoPresence_x64_linux_arm64-v8a.so" ]; then
     echo -e "\e[31m'assets/libNekoPresence_x64_linux_arm64-v8a.so' file not found\e[0m"
fi

if [ ! -f "assets/options.ini" ]; then
     echo -e "\e[31m'assets/options.ini' file not found\e[0m"
fi

if [[ -f "Five_Nights_at_NCZ_2" && -f "run.sh" && -f "lib/libcrypto.so.1.0.0" && -f "lib/libcurl-gnutls.so.4" && -f "lib/libgcrypt.so.11" && -f "lib/libGLU.so.1" && -f "lib/libhogweed.so.4" && -f "lib/libidn.so.11" && -f "lib/libnettle.so.6" && -f "lib/librtmp.so.0" && -f "lib/libssl.so.1.0.0" && -f "assets/6am_animation.mp4" && -f "assets/game.unx" && -f "assets/icon.png" && -f "assets/liblibnekopresence_linux_arm64-v8a.so" && -f "assets/libNekoPresence_x64_linux_arm64-v8a.so" && -f "assets/options.ini" ]]; then
     echo -e "\033[0;34mCongrats, looks like the game has been installed properly. Check for 'Five Nights at NCZ 2' Directory in there.\033[0m"
     if [[ "$gamezip" == "FNaNCZ 2 v0.9.10.zip" ]]; then
     read -r -p "Game version v0.9.10 detected, do you want to apply the storage reduction mod? (You need to have the xdelta3 package installed) [y/N]:" answer2
          if [[ "$answer2" == "Y" || "$answer2" == "y" ]]; then
          echo -e "\033[0;34mApplying the mod...\033[0m"
          wget "https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/FNaNCZ_2_v0.9.10_(Storage_Optimization_Mod).zip" --no-cache
          unzip "FNaNCZ_2_v0.9.10_(Storage_Optimization_Mod).zip"
          mv "assets/game.unx" "assets/data.win"
     if xdelta3 -d -s "assets/data.win" "(fnancz2v0.9.10)-storageoptimizationmod.xdelta" "assets/game.unx"; then
         echo -e "\033[0;34mThe mod was installed. Have fun\033[0m"
          rm -f "assets/data.win" 2>/dev/null
          mv "music_n_sfx" "assets" 2>/dev/null
          rm -f "FNaNCZ_2_v0.9.10_(Storage_Optimization_Mod).zip" 2>/dev/null
          rm -f "(fnancz2v0.9.10)-storageoptimizationmod.xdelta" 2>/dev/null
          rm -rf "music_n_sfx" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
          else
          echo -e "\e[31mAn error occurred while applying the mod file\e[0m"
          rm -rf "music_n_sfx"
          rm -f "(fnancz2v0.9.10)-storageoptimizationmod.xdelta"
          rm -f "FNaNCZ_2_v0.9.10_(Storage_Optimization_Mod).zip" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
          exit 1
     fi
          
          rm -f "assets/data.win" 2>/dev/null
          mv "music_n_sfx" "assets" 2>/dev/null
          rm -f "FNaNCZ_2_v0.9.10_(Storage_Optimization_Mod).zip" 2>/dev/null
          rm -f "(fnancz2v0.9.10)-storageoptimizationmod.xdelta" 2>/dev/null
          rm -rf "music_n_sfx" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
     else
     echo -e "\033[0;34mCancelled Mod installation. Have fun\033[0m"
          fi
    fi
         if [[ "$gamezip" == "FNaNCZ 2 v0.9.11.zip" ]]; then
     read -r -p "Game version v0.9.11 detected, do you want to apply the storage reduction mod? (You need to have the xdelta3 package installed) [y/N]:" answer2
          if [[ "$answer2" == "Y" || "$answer2" == "y" ]]; then
          echo -e "\033[0;34mApplying the mod...\033[0m"
          wget "https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/FNaNCZ_2_v0.9.11_(Storage_Optimization_Mod).zip" --no-cache
          unzip "FNaNCZ_2_v0.9.11_(Storage_Optimization_Mod).zip"
          mv "assets/game.unx" "assets/data.win"
     if xdelta3 -d -s "assets/data.win" "(fnancz2v0.9.11)-storageoptimizationmod.xdelta" "assets/game.unx"; then
         echo -e "\033[0;34mThe mod was installed. Have fun\033[0m"
          rm -f "assets/data.win" 2>/dev/null
          mv "music_n_sfx" "assets" 2>/dev/null
          rm -f "FNaNCZ_2_v0.9.11_(Storage_Optimization_Mod).zip" 2>/dev/null
          rm -f "(fnancz2v0.9.11)-storageoptimizationmod.xdelta" 2>/dev/null
          rm -rf "music_n_sfx" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
          else
          echo -e "\e[31mAn error occurred while applying the mod file\e[0m"
          rm -rf "music_n_sfx"
          rm -f "(fnancz2v0.9.11)-storageoptimizationmod.xdelta"
          rm -f "FNaNCZ_2_v0.9.11_(Storage_Optimization_Mod).zip" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
          exit 1
     fi
          
          rm -f "assets/data.win" 2>/dev/null
          mv "music_n_sfx" "assets" 2>/dev/null
          rm -f "FNaNCZ_2_v0.9.11_(Storage_Optimization_Mod).zip" 2>/dev/null
          rm -f "(fnancz2v0.9.11)-storageoptimizationmod.xdelta" 2>/dev/null
          rm -rf "music_n_sfx" 2>/dev/null
          mv "assets/data.win" "assets/game.unx" 2>/dev/null
     else
     echo -e "\033[0;34mCancelled Mod installation. Have fun\033[0m"
          fi
    fi
else
     echo -e "\e[31mOops! Looks like the game hasn't been installed properly. Retry using the script on a directory with full access to read & write permissions.\e[0m"
     read -r -p "Are you sure you want to keep the game directory? [y/N]:" answer1
     if [[ "$answer1" == "Y" || "$answer1" == "y" ]]; then
     echo -e "\033[0;34mThe game directory is not going to be deleted\033[0m"
     else
          echo -e "\e[31mDeleting the game directory...\e[0m"
          rm -rf "$currentdir/Five Nights at NCZ 2"
          fi
fi
