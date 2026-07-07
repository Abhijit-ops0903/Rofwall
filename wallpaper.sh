#!/bin/bash

##################################################
# Configuration
##################################################

ORIGINALS="$HOME/Pictures/Wallpapers/Originals"
THUMBNAILS="$HOME/Pictures/Wallpapers/Thumbnails"

declare -A WALLPAPERS

##################################################
# Build Menu
##################################################

build_lookup() {

    for img in "$ORIGINALS"/*; do

        [ -f "$img" ] || continue

        filename="$(basename "$img")"
        name="${filename%.*}"

	thumb="$THUMBNAILS/$name.png"

	if [[ ! -f "$thumb" ]]; then
    echo "Generating thumbnail for $filename..."

    magick "$img" \
        -thumbnail 320x180^ \
        -gravity center \
        -extent 320x180 \
        "$thumb" > /dev/null 2>&1
	fi

        WALLPAPERS["$name"]="$img"

    done

}

build_menu() {

    for img in "$ORIGINALS"/*; do

        [ -f "$img" ] || continue

        filename="$(basename "$img")"
        name="${filename%.*}"

        thumb="$THUMBNAILS/$name.png"


        printf "%s\0icon\x1f%s\n" \
            "$name" \
            "$thumb"

    done

}

##################################################
# Show Menu
##################################################
build_lookup

selection=$(
    build_menu |rofi \
    -theme "$HOME/.config/rofi-wallpaper/theme.rasi" \
    -dmenu \
    -p "󰍉" \
    -show-icons \
    -format s 
)

##################################################
# Find Original Wallpaper
##################################################

wallpaper="${WALLPAPERS[$selection]}"
##################################################
# Output
##################################################

if [[ -n "$wallpaper" ]]; then
   awww img "$wallpaper" \
    --transition-type grow \
    --transition-pos center \
    --transition-duration 1 \
    --transition-fps 60 
fi
