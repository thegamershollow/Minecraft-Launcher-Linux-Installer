#!/bin/bash

# Download the Minecraft launcher file for Linux
wget https://launcher.mojang.com/download/Minecraft.tar.gz

# Unarchive the tar and remove it
tar -xzf Minecraft.tar.gz -C /tmp
rm Minecraft.tar.gz
# Change directory to the downloaded and extracted minecraft launcher folder
cd /tmp/minecraft-launcher

# Launch the executable
./minecraft-launcher &

# Create a .desktop file for Minecraft
DESKTOP_FILE="$HOME/.local/share/applications/minecraft.desktop"
echo "[Desktop Entry]" > "$DESKTOP_FILE"
echo "Version=1.0" >> "$DESKTOP_FILE"
echo "Type=Application" >> "$DESKTOP_FILE"
echo "Name=Minecraft" >> "$DESKTOP_FILE"
echo "Exec=$HOME/.minecraft/launcher/minecraft-launcher" >> "$DESKTOP_FILE"
echo "Icon=$HOME/.minecraft/launcher/icons/minecraft256.png" >> "$DESKTOP_FILE"  # Adjust the icon path if necessary
echo "Categories=Game;" >> "$DESKTOP_FILE"
echo "Terminal=false" >> "$DESKTOP_FILE"

# Make the .desktop file executable
chmod +x "$DESKTOP_FILE"

echo "Install Complete"

# remove tmp minecraft dir
sleep 10
rm -rf /tmp/minecraft-launcher
