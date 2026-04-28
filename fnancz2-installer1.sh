echo -e "\e[31mP.S: you must give full path of the zip not a shortcut\e[0m"
read -r -p "Where is the path that you have the zip of the game downloaded? Defaulted=Downloads:" path
cd "$HOME/Downloads"
cd "$path" # kinda stupid way that handles the operation but eh works for now
gamezip=$(ls -v -r 'FNANCZ_2 v'* | head -n 1)
gamename="Five Nights at NCZ 2"
if [ -d "$gamename" ]; then
    echo -e "\e[31mError: '$gamename' folder already exists at this location!\e[0m"
    exit 1
fi

mkdir "$gamename"
cp "$gamezip" "$gamename"
cd "$gamename"
unzip "$gamezip" 
rm "$gamezip"
mkdir "assets"
rm "FNANCZ_2.exe"
mv "data.win" "assets"
mv "6am_animation.mp4" "assets"
mv "options.ini" "assets"
mv "assets/data.win" "assets/game.unx"
rm NekoPresence_x64.dll
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/Five_Nights_at_NCZ_2
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/lib.zip
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/run.sh
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/liblibnekopresence_linux_arm64-v8a.so
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/icon.png
mv icon.png assets
mv libNekoPresence_x64_linux_arm64-v8a.so assets
unzip lib.zip
rm lib.zip
chmod +x Five_Nights_at_NCZ_2
chmod +x run.sh
