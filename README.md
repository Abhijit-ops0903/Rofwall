# Rofwall

A simple wallpaper picker for Hyprland using Rofi and awww.

The picker displays wallpapers from a folder as a searchable gallery with image thumbnails. Selecting a wallpaper applies it immediately using `awww`.

This project was designed and implemented with the assistance of AI.

## Features

* Searchable wallpaper gallery
* Thumbnail previews
* Automatic thumbnail generation for new wallpapers
* Applies wallpapers using `awww`
* Custom Rofi theme
* Lightweight shell scripts

## Screenshot

<img width="1521" height="500" alt="2026-07-07-171503_hyprshot" src="https://github.com/user-attachments/assets/8354eb2d-7283-4fd0-a89b-5d6907a1424c" />


## Requirements

* Rofi
* awww
* ImageMagick
* Bash

## Directory Structure

```text
Pictures/
└── Wallpapers/
    ├── Originals/
    └── Thumbnails/

.config/
└── rofi-wallpaper/
    ├── wallpaper.sh
    ├── generate-thumbs.sh
    └── theme.rasi
```

## Usage

1. Place your wallpapers inside:

   ```text
   ~/Pictures/Wallpapers/Originals
   ```

2. Generate thumbnails (only needed the first time or if you want to regenerate all thumbnails):

   ```bash
   ~/.config/rofi-wallpaper/generate-thumbs.sh
   ```

3. Make sure the `awww` daemon is running:

   ```bash
   awww-daemon
   ```

4. Launch the wallpaper picker:

   ```bash
   ~/.config/rofi-wallpaper/wallpaper.sh
   ```

5. Select a wallpaper and press Enter to apply it.

New wallpapers added to the `Originals` folder will have thumbnails generated automatically when the picker is launched.

## License

This project is released under the MIT License.
