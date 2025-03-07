## * Converts the calling entity into a Werewoof.
## * 
## * Last modified: December 29th, 2024 (AydenTFoxx)


# You be Woof, exit.
execute if entity @s[tag=goldark.paths.werewoof] run return run tellraw @s { "text": "You are already a Werewoof.", "color": "red" }


# Display audiovisual feedback
particle minecraft:soul_fire_flame ~ ~0.5 ~ .1 .2 .1 0.05 20 force
playsound entity.wolf.growl hostile @a[distance=..256] ~ ~ ~ 1 0.5 0.2

# Grant root advancement "Path: Werewoof"
advancement grant @s[type=player] only goldark:paths/werewoof/root

# Add tag, now is Woof
tag @s add goldark.paths.werewoof