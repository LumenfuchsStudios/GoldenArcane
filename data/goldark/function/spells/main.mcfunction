## # AydenTFoxx - September 9th, 2024

# * Main Function for all spell's instantiation and running behavior.

# ? Run by: GoldArk's Core Functions Manager


## DATABASE (Initialize Spells)
execute as @a[scores={ goldark.using_spell=1.. }] at @s run function goldark:spells/database


## Weather : Clear, Rain, Thunder
execute as @e[tag=goldark.run_spell.weather_clear] at @s run function goldark:spells/weather/clear/run
execute as @e[tag=goldark.run_spell.weather_rain] at @s run function goldark:spells/weather/rain/run
execute as @e[tag=goldark.run_spell.weather_thunder] at @s run function goldark:spells/weather/thunder/run