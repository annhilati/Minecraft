##################################################
#                 Used variables
##################################################

# idnamespace : It is recommended to use the namespace of the datapack or another suitable term here. Omit it and the following colon to assign the bossbar to the default namespace "minecraft"
# idname : Give the bossbar a name
# name : Insert a json text component to be displayed in the boss bar
# id : Combination of the idnamespace and the idname, seperated by a colon
# color : Choose the color of the bossbar itself from "blue" "green" "pink" "purple" "red" "white" and "yellow"
# style : Choose the style of the bossbar itself from "notched_6" "notched_10" "notched_12" "notched_20" and "progress"
# max : Maximum Health, the player can have. Normally, this has to be 20 (2x hearts), except when the player has more health through health boost effect
# player : The player, whose health should be synchronized with the bossbar

##################################################
#            Setting up the bossbar
##################################################
# this commands only have to be executed once

# Create bossbar
bossbar add *idnamespace*:*idname* *Name*

# Color and style
bossbar set *id* color *color*
bossbar set *id* style *style*

# Mathmatical tuning
bossbar set *id* max *max*

##################################################
#              Update the bossbar
##################################################
# this commands have to be executed with smallest possible spacing

#Updating players health
execute store result bossbar *id* value run data get entity @e[type=player,name=*player*] Health

#Detecting players death and removing bossbar
execute as *player* if entity @s[nbt={Health:0f}] run bossbar remove *id*
