#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y
sudo apt --fix-broken

#Diretórios
DIR_DOWNLOADS="$HOME/Downloads/fromscript"
DIR_SOFTWARES="$HOME/softwares"
DIR_FLUTTER="$DIR_SOFTWARES/flutter"
DIR_ANDROID="$DIR_SOFTWARES/android"
#Urls a baixar
URLS_WGET=(

  #Voxelshop 
  "https://github.com/simlu/voxelshop/releases/download/1.8.26/voxelshop-bin.zip"
  #flutter
  "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.9.1+hotfix.6-stable.tar.xz"
  #marktext
  "https://github.com/marktext/marktext/releases/download/v0.15.0/marktext-0.15.0-x86_64.AppImage" 
  #anaconda
  "https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh"
  
  #atom
  "https://atom.io/download/deb" 
  #navegador minimalista
  "https://github.com/minbrowser/min/releases/download/v1.7.0/Min_1.7.0_amd64.deb" 

  "http://downloads.raspberrypi.org/rpd_x86/images/rpd_x86-2019-10-01/2019-09-25-rpd-x86-buster.iso"

  "http://tinycorelinux.net/10.x/x86/release/Core-10.1.iso"

  "https://github.com/electron/fiddle/releases/download/v0.12.0/electron-fiddle_0.12.0_amd64.deb"
# Download Sublimetext3
"https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
)

#instalar com pip
SOFT_PIP=(
  pelican
  kivy
  jupyterthemes
  gdown
  pyinstaller
  virtualenv
  youtube-dl
  pipreqs
  pymodore
  twine
)

#instalar com npm -g
SOFT_NPM=(
  ionic
  n
  expo-cli
  totalcross-cli
  @quasar/cli
)


# PROGRAMAS -> primeiro as libs que são dependências
SOFT_APT=(

  swig # SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages
  g++ # GNU c++ compiler 
  libx11-dev # X Window System for devs
  libxcursor-dev # X cursor management library
  cmake # Family of tools designed to build
  ninja-build # Ninja is a small build system with a focus on speed.
  build-essential # The build-essential package is a reference for all the packages needed to compile a Debian package
  
  libvulkan1 # The Loader implements the main VK library.
  libvulkan1:amd64 
  libgnutls30:amd64 # Implements the Transport Layer Security 
  libldap-2.4-2:amd64 # Lightweight Directory Access Protocol
  libgpg-error0:amd64 # Defines common error values for all GnuPG components
  libxml2:amd64 # XML C parser and toolkit developed for the Gnome
  libasound2-plugins:amd64 # Contains extension for libs ALSA
  libsdl2-2.0-0:amd64 # Simple DirectMedia Layer 2 is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics ...
  libfreetype6:amd64 # High-quality and portable Font engine.
  libdbus-1-3:amd64 # Is a message bus system, simple way for aplications talk to one another.
  libsqlite3-0:amd64 # Is a C library that implements an in-process SQL database engine.
  libc6:amd64 # Version 2 of the GNU C Library .
  libncurses5:amd64 # Hig flexible and efficient API for prompt, text, color, etc.
  libstdc++6:amd64 # Contains lib adictional runtime programs in C++ compiled with a GNU compilator.
  lib32z1 # zlib is a libary implemeting the deflat compression method found in gzip and PKZIP.
  libbz2-1.0:amd64 # bzip2 is a freely available, patent free, high-quality data compressor.
  liballegro4.4 # Allegro is a cross-platform library mainly aimed at video game and multimedia programming.
  libdevil1c2 # Developer's Image Library (DevIL) is a programmer's toolkit which can load, save and convert a wide variety of image formats.
  libphysfs1 #The PhysicsFS filesystem abstraction library provides a simple C interface to aid game programmers in utilizing game assets packaged in many different types of archive files. 
  cmake #CMake is an open-source, cross-platform family of tools designed to build, test and package software.
  libdbus-1-dev # dev lib of libdbus above.
  libgtk-3-dev # dev lib of GTK, that is a free and open-source cross-platform widget toolkit for creating graphical user interfaces.
  libnotify-dev # dev lib for sends desktop notifications to a notification daemon.
  libgnome-keyring-dev # dev lib of gnome-keyring, that is a daemon in the session, similar to ssh-agent, and other applications can use it to store passwords and other sensitive information. 
  libasound2-dev # dev lib of libasound2, This package contains the ALSA library and its standard plugins, as well as the required configuration files. 
  libcap-dev # dev lib of Libcap, that implements the user-space interfaces to the POSIX 1003.1e capabilities available in Linux kernels. 
  libcups2-dev # dev lib of cups, the Common UNIX Printing System.
  libxtst-dev #  dev lib of libXtst, that provides an X Window System client interface to the Record extension to the X protocol. 
  libxss1 # deb lib of libXss, that provides an X Window System client interface to the MIT-SCREEN-SAVER extension to the X protocol. 
  libnss3-dev # dev lib of Network Security Service libraries.
  libssl-dev # dev lib of Security Socket Layer.

  gcc-multilib # Is useful for cross-compiling, that is, compiling a program to run on a different processor architectures.
  g++-multilib #  This is the GNU C++ compiler, a fairly portable optimizing compiler for C++.
  gperf # gperf is a program that generates perfect hash functions for sets of key words. 
  bison # Bison is a general-purpose parser generator that converts a grammar description for an LALR(1) context-free grammar into a C program to parse that grammar.
  python-dbusmock # With python-dbusmock you can easily create mock objects on D-Bus.

  clang #The Clang project provides a language front-end and tooling infrastructure for languages in the C language family (C, C++, Objective C/C++, OpenCL, CUDA...

  ffmpeg #FFmpeg. A complete, cross-platform solution to record, convert and stream audio and video. 
  
  portaudio19-dev #a free, cross-platform, open-source, audio I/O library.

  xz-utils # XZ Utils is general-purpose data compression software with a high compression ratio.

  checkinstall #CheckInstall is a computer program eases the installation and uninstallation of software compiled from source by making use of package management systems.
 
  gconfig2 

  upx # UPX is an advanced executable file compressor, fundamental lib to Kivy.

  
  # Browsers
  firefox # Fast Fox browser.
  tor # Privacy tor browser.

  # Social media
  telegram-desktop # Instant messager.
  discord #

  # Dev tools
  git # Version control sytem.

  # General Image design tools
  krita # Bitmap digital paint tool.
  inkscape # Vector tool.
  pikopixel.app # Application for drawing & editing pixel-art images & icons. 
  # General 3D tools
  blender # General 3D tool

  # Video editing
  kdenlive
  #Audio/music tools
  audacity #
  lmms
  milkytracker

  # Dev Aplications
  
  nano # Text editor

  # LAMP
  apache
  mysql # Databass
  php5

  # General Programmings Languages #
  
  # Java
  default-jre #java mais recente
  openjdk-8-jre #java 8

  # Python
  python2 
  python3
  dart #Dart is a client-optimized language for fast apps on any platform.
  python-all-dev #
  jupyter-notebook
  #spyder # Python IDE for scientists


  # Package Managers
  python3-pip # python 3 package manager.
  snapd # Manage an Ubuntu system with snappy. 
  npm # Node package manager.
  synaptic # Grafical linux package 
  apt-transport-https # apt transporter https
  flatpak #
  snapd # 
  wget #
  software-properties-common #Provides some useful scripts for adding and removing PPAs:
  ppa-purge # unistall programs installed by the PPA.

  #Others
  buttercup-desktop #Buttercup for desktop is a beautifully-simple password manager designed to help manage your credentials.
  libreoffice # office package for docs, tables, slidshow.
  scribus # aplication to page layout Publishing.
  okular # Universal document viewer.     
  font-manager
  virtualbox # Virtual Machine
  # megasync # Mega synronizer files.
  unzip #Program to compress of infoZIP.
  gufw #gufw is an easy and intuitive way to manage your Linux firewall.
  preload #preload monitors applications that users run, and by analyzing this data, predicts what applications users might run, and fetches those binaries and their dependencies into memory for faster startup times. 
  clamav # antivirus
  gnupg # GNU Privacy Guard 
  xclip # xclip is a command line utility that is designed to run on any system with an X11 implementation.
  retroarch #RetroArch is an open source, multi-platform frontend for the libretro API. It can be used as a modular multi emulator system, game engine, media player and 3D technical demonstration.
  vlc # 

  # Remote aplications
  filezilla # ftp/ssh tranfer tool
  putty # SSH aplication
  curl # (Client URL) to verify  URLS.

  #Project tools
  dia #to draw projects

  #Game Engines/Frameworks
  #love #2D game development framework based on Lua and OpenGL 
  
  # Anrdroid Envi
  android-sdk # 
  android-sdk-platform-23 #
  
  r-base # R is a free software environment for statistical computing and graphics.
  r-base-dev # dev lib of r-base.
  libatlas3-base # ATLAS is an approach for the automatic generation and optimization of numerical software.

  #games
  Minecraft
  Steam
  # Stream tools
  obs-studio
  #System tools
  xsensors
  neofetch


)


# Tirando travas do apt
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

#arquitetura 32 bits
sudo dpkg --add-architecture amd64
sudo apt -y update

## Download e instalaçao de programas externos ##
mkdir $DIR_SOFTWARES
mkdir $DIR_FLUTTER
mkdir $DIR_ANDROID
mkdir $DIR_ANACONDA
mkdir $DIR_DOWNLOADS

#fazendo downloads
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update -y
sudo apt install adoptopenjdk-8-hotspot -y

cd $DIR_DOWNLOADS

for e in ${URLS_WGET[@]}; do
  wget -c "$e"
  echo "$e - BAIXADO";
done

#acertando o nome do pacote deb
mv deb atom.deb

# Instalar programas apt
for e in ${SOFT_APT[@]}; do
  if ! dpkg -l | grep -q $e; then # Só instala se já não estiver instalado
    sudo apt -f -y install $e
  else
    echo "$e - INSTALADO"
  fi
done

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.github.libresprite.LibreSprite
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community

#instalando os .deb
for e in ./*.deb; do
  sudo dpkg -i $e
done
sudo rm -R ./*.deb

# Instalar programas pip
for e in ${SOFT_PIP[@]}; do
  pip3 install $e
done

# Instalar programas npm
for e in ${SOFT_NPM[@]}; do
  sudo npm install -g $e
done

# Download piskel
gdown 'https://drive.google.com/uc?export=download&id=1EFo7Ye_rl7bGNr4iehXIgFg4gn2IcWDX'
# Download Sunvox
gdown "https://www.warmplace.ru/soft/sunvox/sunvox-1.9.5d.zip"

# Download Godot Engine
gdown "https://downloads.tuxfamily.org/godotengine/3.0.1/Godot_v3.0.1-stable_x11.64.zip"



#descompactações
for e in ./*.zip; do
  unzip $e
done

for e in ./*.tar; do
  tar -xvf $e
done

for e in ./*.tar.gz; do
  tar -xvzf $e
done

for e in ./*.tar.bz2; do
  tar -xvjf $e
done

for e in ./*.tar.xz; do
  tar -xf $e
done

sudo rm ./*.tar*
sudo rm ./*.zip

#renomeando pasta piskel
mv ./Piskel* ./piskel


#Configurando retro arch
ROMS = $SOFTWARES_DIR/roms
mkdir $ROMS



sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

snap install code --classic
snap install hugo

#node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

#meteor
curl https://install.meteor.com/ | sh

#trocando java
sudo update-alternatives --config java

#instalando insomnia
sudo snap install insomnia
sudo snap install goxel
sudo snap install hugo

#installing programs general
sudo snap install cpod

#tornando instaladores com mais passos executáveis
sudo chmod 777 ./*.run
sudo chmod 777 ./*.sh
sudo chmod 777 ./*.AppImage

#movendo Appimages para pasta de downloads
sudo mv ./* $DIR_SOFTWARES

#trocando o tema do jupyter
jt -t chesterish

mkdir $HOME/pyenvs

FINAL_MSG="Finished"
#definindo path
PROFILE_PATH="$HOME/.profile"
STRING_SPACE = ' '
PATH_ELEMENTS=(
  'DIR_SOFTWARES="${HOME}/softwares"'
  'ANDROID_HOME =/usr/lib/android-sdk'
  'PATH="${PATH}:/usr/lib/dart/bin"'
  'PATH="${PATH}:$DIR_SOFTWARES/flutter/bin"'
  'PATH="${PATH}:${ANDROID_HOME}/tools"'
  'PATH=${PATH}:${ANDROID_HOME}/tools/bin'
  'PATH="${PATH}:${ANDROID_HOME}/platform-tools"'
  ''
  '#softwares a invocar'
  'lampp=/opt/lampp/lampp'
  'marktext=$DIR_SOFTWARES/marktext*'
  'pycharm=$DIR_SOFTWARES/pycharm-anaconda/bin/pycharm.sh'
  'piskel=$DIR_SOFTWARES/piskel/piskel'
  'roms=${DIR_SOFTWARES}/roms'
  'pyenvs=${HOME}/pyenvs'
  'ytdl="youtube-dl --extract-audio --audio-format mp3"'
  'libresprite="flatpak run com.github.libresprite.LibreSprite"'
)


if [ -f $PROFILE_PATH ]; then
  for e in ${PATH_ELEMENTS[@]}; do
    echo'export' $e >> $PROFILE_PATH
  done
  source $PROFILE_PATH
  flutter precache
else
  TMP_PATH = insert_in_path.txt

  for e in ${PATH_ELEMENTS[@]}; do
    echo 'export' $e >> $TMP_PATH
  done

  FINAL_MSG = ".profile not found, config your path with the paths in $HOME/TMP_PATH"
fi

#Atualizando sistema e limpando o lixo que tiver ficado
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

cd $DIR_SOFTWARES

sudo chmod 777 ./Anaconda*
sudo ./Anaconda*

sudo chmod 777 ./xampp*
sudo ./xampp

cd android-studio/bin
sudo chmod 777 ./studio.sh
./studio.sh


echo FINAL_MSG
echo "All softwares and instalers are in $DIR_SOFTWARES"

