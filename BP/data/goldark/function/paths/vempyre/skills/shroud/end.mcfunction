## * Reveals the user and removes effects granted by the skill.
## * 
## * Last modified: December 12th, 2024 (AydenTFoxx)


# Clear effects
effect clear @s slowness
effect clear @s resistance

effect clear @s invisibility
effect clear @s strength

# Reset attribute
attribute @s knockback_resistance base reset


# Display audiovisual feedback
playsound entity.ravager.death player @s ~ ~ ~ 0.8 0.5

particle smoke ~ ~1 ~ .2 .5 .2 0.1 30 force
particle gust ~ ~1 ~ .0 .0 .0 1.0 1

# Reduce cooldown (if ended early)
scoreboard players remove @s[advancements={ goldark:paths/vempyre/shroud_attack=true }, scores={ goldark.ability_timer=120.. }] goldark.ability_timer 120


# Remove trigger
advancement revoke @s only goldark:paths/vempyre/shroud_attack

# Remove tag
tag @s remove goldark.vempyre.skill_shroud