# death-counter-for-obs
Creates a semi-automatic death counter for OBS with AHK 2.0

# Requirements
- AutoHotkey v2.0

# How to use
Extract the files in the any folder of your choice, but keep in mind that you will need to make them stay there for the OBS link that we'll do later on. 

In the "deathCounter.txt" file you can write whatever you want, as long as there's only one numeric value, which is your death counter (default: 0). Whatever you write in that file, will be seen on OBS. 

Open OBS, add a new Text source where needed and tick the "Read from a file" checkbox. Press the "Browse" button and look for the deathCounter.txt file and select that. Do all the modifies you want inside OBS (eg: font, weight, size) and press "Ok". Put it wherever you want and leave it be.

Now, when you're ready to go live, open the deathCounter.ahk script:
- If you want to add a death, press the + button on your keyboard.
- If you want to remove a death, press the - button on your keyboard.
- If you want to reset your deaths to zero, press the * button on your keyboard.
- If you want to close the AHK script, press the esc button on your keyboard.

# Useful stuff
You can write text even after the death counter itself in the deathCounter.txt file, as long as there's no other numbers in it, it should work fine.

The death counter requires a second or so to update since the script basically deletes and recreates the .txt files from which OBS reads the counter from, but it's fast enough to be used. 

You could try implementing an image recognition for your deaths and make the script do everything by itself, but I wanted to make it as generic, simple and fast as possible.

You can change the keybinds you have to press to do each action modifying the deathCounter.ahk file. In the far bottom of it you'll find all the keybinds with proper comments.
