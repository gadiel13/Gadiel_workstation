#!/usr/bin/env bash
#incomplete script!
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "${RED}!!This script only tested in Linux Mate!!\n${NC}"
echo "This script add shortcuts in linux press crtl+c to cancel"
read x
# sudo nano /usr/share/applications/NOME-DO-SEU-PROGRAMA.desktop
PROGRAMS=(
    "Godot"
    "Sunvox"
    "sublime_text"
)
DESCRIPTIONS=(
    "Engine tool game dev."
    "Node music generator."
    "General hypertext editor."
)
PATHSFILES=(
    "$HOME/softwares/Godot_v3.1.2-stable_x11.64"
    "$HOME/softwares/sunvox/sunvox/linux_x86_64/sunvox"
    "$HOME/softwares/sublime_text_3/sublime_text"
)
# Download icons
#wget "https://github.com/godotengine/godot/raw/master/icon.png" -P "$HOME/softwares/icons/icon-godot/"
#wget "https://www.warmplace.ru/soft/sunvox/logo4_small.jpg" -P "$HOME/softwares/icons/icon-sunvox/"


ICONSFILES=(
    "$HOME/softwares/icons/icon-godot/icon.png"
    "$HOME/softwares/icons/icon-sunvox/logo4_small.jpg"
    "$HOME/softwares/sublime_text_3/Icon/128x128/sublime-text.png"
)


count=0
#dirSoftwares="$HOME/softwares/atalhos/"
dirSoftwares="/usr/share/applications/"

for icon in ${ICONSFILES[@]}; do
    chmod 444 $icon
    echo $icon
done
echo "==========================================="
# give acess prgrams
for program in ${PATHSFILES[@]}; do
    chmod u+x $program
    echo $program
done

for e in ${PROGRAMS[@]}; do

    dirFile="$dirSoftwares$e.desktop"
    echo $dirFile
    if test -f $dirFile; then
      echo "$e exist : deleting"
      rm $dirFile
    fi


    echo "[Desktop Entry]" >> $dirFile

    echo "Encoding=UTF-8" >> $dirFile
    echo "Name=$e"  >> $dirFile
    echo "Comment=${DESCRIPTIONS[$count]}" >> $dirFile
    echo "Exec=\"${PATHSFILES[$count]}\"" >> $dirFile
    echo "Icon=${ICONSFILES[$count]}" >> $dirFile
    echo "Terminal=false" >> $dirFile
    echo "Type=Application" >> $dirFile
    echo "Categories=GNOME;Application;Development;" >> $dirFile
    echo "StartupNotify=true" >> $dirFile

    #write file shortcut
    #echo shotcutFile >>  "/usr/share/applications/$e.desktop"
    #echo $shortcutFile >> "$HOME/softwares/atalhos/$e.desktop"
    #echo '\n' >> "$HOME/softwares/atalhos/$e.desktop"
    chmod  +rwx $dirFile

  echo "$e - Shortcute setted";

  ((count=count+1))
done
