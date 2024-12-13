## * Consumes a greater amount of essence from a creature drained by the player.
## * 
## * Last modified: December 11th, 2024 (AydenTFoxx)


# Revoke trigger
advancement revoke @s only goldark:paths/vempyre/take_blood/humanoid_kill


# Add score to player
scoreboard players add @s goldark.ability_clock 8

# Grant saturation
effect give @s saturation 4 0 true


# Display audiovisual feedback
particle dust_color_transition{ from_color: 5374723, to_color: 2031873, scale: 0.7 } ~ ~1 ~ 0.3 0.4 0.3 0.8 20 force
playsound particle.soul_escape player @s ~ ~ ~ 0.8 0.7