#!/bin/bash

# Ask for user input
read -p "Enter background color: " bg_color
read -p "Enter font color: " font_color
read -p "Enter image width: " img_width
read -p "Enter image height: " img_height
read -p "Enter font size (small, medium, large): " font_size
read -p "Display dimensions? (yes/no): " display_dims
read -p "Enter text line 1: " text_line_1
read -p "Enter text line 2: " text_line_2

# Set font size
case $font_size in
  small) font_size=20 ;;
  medium) font_size=40 ;;
  large) font_size=60 ;;
  *) font_size=40 ;; # default to medium if not specified
esac

# Create the image
convert -size ${img_width}x${img_height} xc:${bg_color} -gravity center -pointsize $font_size -fill ${font_color} -annotate +0-10 "$text_line_1" -annotate +0+10 "$text_line_2" placeholder.png

# Optionally add dimensions
if [ "$display_dims" == "yes" ]; then
  convert placeholder.png -gravity center -pointsize 10 -fill ${font_color} -annotate +0+60 "(${img_width}x${img_height})" placeholder.png
fi

echo "Placeholder image created!"
