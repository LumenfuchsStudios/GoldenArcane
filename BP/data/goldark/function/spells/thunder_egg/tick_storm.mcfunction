## * Runs the Storm Cloud's behavior, causing severe lag, loss of houses, and chaos everywhere.
## * (Storm not included; Kinda)
## * 
## * Last modified: December 4th, 2024 (AydenTFoxx)


## VISUALS

# Rotate cloud
tp @s ~ ~ ~ ~20 ~

# Display flying particles
particle smoke ^ ^-4 ^6 .5 .5 .5 0.1 12
particle smoke ^ ^-6 ^-6 .5 .5 .5 0.1 12

# Display "cloud" particles
particle electric_spark ~ ~ ~ 4.0 0.0 4.0 0.1 40
particle electric_spark ~ ~ ~ 4.0 0.0 4.0 0.1 20 force

particle large_smoke ~ ~ ~ 4.0 0.5 4.0 0.01 40
particle large_smoke ~ ~ ~ 4.0 0.5 4.0 0.01 20 force

particle dripping_water ~ ~ ~ 4.0 0.5 4.0 0.5 40

# Play audio
execute if score @s[tag=goldark.temp.switch_sounds] goldark.ability_clock matches 10..20 run playsound ambient.soul_sand_valley.additions neutral @a[distance=..16] ~ ~ ~ 2 0.8 0.5
execute if score @s[tag=goldark.temp.switch_sounds] goldark.ability_clock matches 10..20 run tag @s remove goldark.temp.switch_sounds

execute if score @s[tag=!goldark.temp.switch_sounds] goldark.ability_clock matches 10..20 run playsound ambient.soul_sand_valley.mood neutral @a[distance=..16] ~ ~ ~ 2 0.8 0.5
execute if score @s[tag=!goldark.temp.switch_sounds] goldark.ability_clock matches 10..20 run tag @s add goldark.temp.switch_sounds


## BEHAVIOR

# Follow nearest entity
execute at @n[type=!#goldark:magic_immune, type=!chicken, distance=..32] facing entity @s eyes positioned ~ ~8 ~ run tp @s ^ ^ ^-0.1

# Fall to the ground
execute unless entity @n[type=!#goldark:magic_immune, type=!chicken, distance=..32] if block ~ ~-8 ~ #goldark:walkable run tp @s ~ ~-0.1 ~

# Apply effects on touch
effect give @e[type=!#goldark:magic_immune, type=!chicken, distance=..8, dy=4] blindness 4 1 false
effect give @e[type=!#goldark:magic_immune, type=!chicken, distance=..4, dy=2] instant_damage 1 0 false


# Tick Clock
scoreboard players add @s goldark.ability_clock 1

# Apply Levitation
execute if score @s goldark.ability_clock matches 30..35 if predicate goldark:misc/random_25 run effect give @e[type=!#goldark:magic_immune, distance=6..14, limit=4, sort=random] levitation 3 5 true
execute if score @s goldark.ability_clock matches 90..95 if predicate goldark:misc/random_25 run effect give @e[type=!#goldark:magic_immune, distance=6..14, limit=4, sort=random] levitation 3 5 true
execute if score @s goldark.ability_clock matches 120..125 if predicate goldark:misc/random_25 run effect give @e[type=!#goldark:magic_immune, distance=6..14, limit=4, sort=random] levitation 3 5 true

# Summon lightning
execute if score @s goldark.ability_clock matches 1..10 if predicate goldark:misc/random_10 as @n[type=!#goldark:magic_immune, type=!chicken, limit=2, distance=..14] at @s run function goldark:spells/thunder_egg/summon_thunder
execute if score @s goldark.ability_clock matches 60..70 if predicate goldark:misc/random_25 as @n[type=!#goldark:magic_immune, type=!chicken, limit=2, distance=..14] at @s run function goldark:spells/thunder_egg/summon_thunder
execute if score @s goldark.ability_clock matches 100..110 if predicate goldark:misc/random_10 as @n[type=!#goldark:magic_immune, type=!chicken, limit=2, distance=..14] at @s run function goldark:spells/thunder_egg/summon_thunder

# Reset Clock
scoreboard players set @s[scores={ goldark.ability_clock=120 }] goldark.ability_clock 0


# Tick Timer
scoreboard players add @s goldark.ability_timer 1

# Remove Self
kill @s[type=#goldark:technical, scores={ goldark.ability_timer=400.. }]