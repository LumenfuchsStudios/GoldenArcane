## * Grants Holy Sickness to non-immune entities within the aura.
## * 
## * Last modified: January 23rd, 2025 (AydenTFoxx)


## AUDIO-VISUAL

# Rotate self
tp @s ~ ~ ~ ~15 ~

# Display particles
particle soul_fire_flame ^ ^0.5 ^5 .1 .1 .1 0.01 2
particle soul_fire_flame ^ ^0.5 ^-5 .1 .1 .1 0.01 2
particle soul_fire_flame ^5 ^0.5 ^ .1 .1 .1 0.01 2
particle soul_fire_flame ^-5 ^0.5 ^ .1 .1 .1 0.01 2

particle end_rod ~ ~0.5 ~ .1 .1 .1 0.1 2


# Tick Clock
scoreboard players operation @s goldark.ability_clock += #goldark_tick_rate goldark.dummy

# Play audio
execute if score @s goldark.ability_clock matches 50..80 if predicate goldark:misc/random_10 run playsound block.portal.ambient block @a[distance=..16] ~ ~ ~ 0.8 1.3

# Reset Clock
scoreboard players set @s[scores={ goldark.ability_clock=100.. }] goldark.ability_clock 0


## BEHAVIOR

# Add Holy Sickness tag
execute as @e[type=!#goldark:magic_immune, tag=!goldark.perks.holy_immune, tag=!goldark.holy_sickness.active, tag=!goldark.effects.purity, distance=..5] run tag @s add goldark.holy_sickness.active_judgement
execute as @e[type=!#goldark:magic_immune, tag=!goldark.perks.holy_immune, tag=!goldark.holy_sickness.active, tag=!goldark.effects.purity, distance=..5] run tag @s add goldark.holy_sickness.active

# Add Holy Sickness score
scoreboard players add @e[type=!#goldark:magic_immune, tag=goldark.holy_sickness.active, scores={ goldark.effect_timer.holy_sickness=..3333 }, distance=..5] goldark.effect_timer.holy_sickness 4

# Add MORE Holy Sickness score to hostiles
execute as @e[type=!#goldark:magic_immune, tag=goldark.holy_sickness.active, predicate=goldark:entity/is_hostile, distance=..5] unless score @s goldark.effect_timer.holy_sickness matches 1000.. run scoreboard players add @s goldark.effect_timer.holy_sickness 1200
execute as @e[type=!#goldark:magic_immune, tag=goldark.holy_sickness.active, predicate=goldark:entity/is_hostile, distance=..5] unless score @s goldark.effect_timer.holy_sickness matches 3333.. run scoreboard players add @s goldark.effect_timer.holy_sickness 8

# Display particles on targeted mobs
execute at @e[type=!#goldark:magic_immune, tag=goldark.holy_sickness.active, distance=..5] run particle portal ~ ~1 ~ .1 .2 .1 0.5 3


## END

# Tick Timer
scoreboard players add @s goldark.ability_timer 1

# Play expiration audio
execute if score @s goldark.ability_timer matches 970 run playsound block.portal.trigger block @a[distance=..16] ~ ~ ~ 0.8 1.2

# Display expiration particles
execute if score @s goldark.ability_timer matches 980.. run particle enchant ~ ~ ~ .0 .0 .0 1 5
execute if score @s goldark.ability_timer matches 995.. run particle flash ~ ~ ~ .0 .0 .0 1 1

# Play final audio
execute if score @s goldark.ability_timer matches 1000.. run playsound block.fire.extinguish block @a[distance=..16] ~ ~ ~ 0.8 0.8

# Remove Self
kill @s[type=#goldark:technical, scores={ goldark.ability_timer=1000.. }]