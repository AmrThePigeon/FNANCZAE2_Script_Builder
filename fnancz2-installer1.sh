scriptlocation=$(pwd -L)
scriptdeletion() {
rm -f "$scriptlocation/fnancz2-installer1.sh"
}
trap scriptdeletion EXIT

echo -e "\e[31mP.S: you must give full path of the zip without any shortcut\e[0m"
echo -e "Press [ENTER] if the game is installed in $HOME/Downloads directory."
read -r -p "Game zip file path [Defaulted=Downloads]:" path
gamename="Five Nights at NCZ 2"

cd "$HOME/Downloads" 2>/dev/null
cd "$path" 2>/dev/null # kinda stupid way that handles the operation but eh works for now
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
cp "$gamezip" "$gamename"
cd "$gamename"
unzip "$gamezip" 
rm "$gamezip"
mkdir "assets"
rm "FNANCZ 2.exe"
mv "data.win" "assets"
mv "6am_animation.mp4" "assets"
mv "options.ini" "assets"
mv "assets/data.win" "assets/game.unx"
rm NekoPresence_x64.dll
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/Five_Nights_at_NCZ_2 --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/lib.zip --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/run.sh --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/liblibnekopresence_linux_arm64-v8a.so --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE2_Script_Builder/refs/heads/main/icon.png --no-cache
mv icon.png assets
mv liblibnekopresence_linux_arm64-v8a.so assets
unzip lib.zip
rm lib.zip
chmod +x Five_Nights_at_NCZ_2
chmod +x run.sh
