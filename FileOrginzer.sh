#!/bin/bash

# || OR opreator
# -p for mkdir to avoid errores if the dir exits
# Using while loop to let the user enter valid path

while true; do
    read -p "What is the path to orgnized your files?:" path
    if [ -d "$path" ]; then
        break
    else
        echo "Error: The path is invalid"
    fi
done

ts=$(date "+%d-%m-%Y") #timestamp
touch "organizer_log_$ts.txt"

for file in "$path"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        if [ "$extension" == "mp3" ] || [ "$extension" == "wav" ]; then
            mkdir -p "$path/Music"
            mv "$file" "$path/Music/"
            echo "Moved $file to $path/Music/" >> organizer_log_$ts.txt

        elif [ "$extension" == "png" ] || [ "$extension" == "jpg" ] || [ "$extension" == "jpeg" ]; then
            mkdir -p "$path/Photos"
            mv "$file" "$path/Photos/"
            echo "Moved $file to $path/Photos/" >> organizer_log_$ts.txt

        elif [ "$extension" == "mkv" ] || [ "$extension" == "mp4" ] || [ "$extension" == "mov" ]; then
            mkdir -p "$path/Videos"
            mv "$file" "$path/Videos/"
            echo "Moved $file to $path/Videos/" >> organizer_log_$ts.txt

        elif [ "$extension" == "pdf" ]; then
            mkdir -p "$path/PDF"
            mv "$file" "$path/PDF/"
            echo "Moved $file to $path/PDF/" >> organizer_log_$ts.txt

        elif [ "$extension" == "zip" ] || [ "$extension" == "tar" ]; then
            mkdir -p "$path/TAR-Files"
            mv "$file" "$path/TAR-Files/"
            echo "Moved $file to $path/TAR-Files/" >> organizer_log_$ts.txt

        elif [ "$extension" == "xlsx" ] || [ "$extension" == "docx" ] || [ "$extension" == "txt" ] || [ "$extension" == "doc" ]; then
            mkdir -p "$path/Documents"
            mv "$file" "$path/Documents/"
            echo "Moved $file to $path/Documents/" >> organizer_log_$ts.txt

        else
            mkdir -p "$path/Other"
            mv "$file" "$path/Other/"
            echo "Moved $file to $path/Other/" >> organizer_log_$ts.txt

        fi
    fi
done
