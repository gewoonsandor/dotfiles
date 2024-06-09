#!/bin/bash

rofi \
	-show window \
	-theme $HOME/.config/rofi/alttab.rasi \
	-kb-row-down 'Alt+Tab' \
	-kb-row-up 'Alt+ISO_Left_Tab' \
	-kb-accept-entry '!Alt-Tab,!Alt-Alt_L,!Alt_L'
