## * HOLY SICKNESS: Causes Nausea and unhappy effects to the sinful being within.
## * 
## * Last modified: December 3rd, 2024 (AydenTFoxx)


## # EFFECTS

## LEVEL I: The Warning
execute if score @s goldark.effect_timer.holy_sickness matches ..1200 run function goldark:effects/holy_sickness/i

## LEVEL II: The First Signs
execute if score @s goldark.effect_timer.holy_sickness matches 500.. run function goldark:effects/holy_sickness/ii

## LEVEL III: Shit Got BAD
execute if score @s goldark.effect_timer.holy_sickness matches 1200..2000 run function goldark:effects/holy_sickness/iii
execute if score @s goldark.effect_timer.holy_sickness matches 2100.. run function goldark:effects/holy_sickness/iii

## LEVEL IV: Terminal
execute if score @s goldark.effect_timer.holy_sickness matches 2100.. run function goldark:effects/holy_sickness/iv

## LEVEL V: By Your Will
execute if score @s goldark.effect_timer.holy_sickness matches 2750.. run function goldark:effects/holy_sickness/v


## # DURATION

# Reduce duration (if not active)
scoreboard players remove @s[tag=!goldark.holy_sickness.active] goldark.effect_timer.holy_sickness 1
scoreboard players remove @s[scores={ goldark.effect_timer.holy_sickness=1200.. }, tag=!goldark.holy_sickness.active] goldark.effect_timer.holy_sickness 10

execute as @a[scores={ goldark.effect_timer.holy_sickness=1200..1250 }, tag=!goldark.holy_sickness.active] run stopsound @s player ambient.soul_sand_valley.mood