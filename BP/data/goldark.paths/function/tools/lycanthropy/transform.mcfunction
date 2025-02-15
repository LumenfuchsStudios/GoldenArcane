## * Transforms the calling entity into their Wolf form.
## * 
## * Last modified: February 11th, 2025 (AydenTFoxx)


# You be no Woof, exit.
execute unless entity @s[tag=goldark.paths.werewoof] run return run tellraw @s { "text": "You are not a Werewoof.", "color": "red" }

# You be transformed, exit.
execute if entity @s[tag=goldark.path_transformed] run return run tellraw @s { "text": "You are already transformed.", "color": "red" }


# Display audio feedback (transformation already has plenty visuals)
playsound entity.wolf.ambient neutral @a[distance=..16] ~ ~ ~ 1 0.8

# Transform to Wolf morph
function goldark.paths:paths/werewoof/morph/transform