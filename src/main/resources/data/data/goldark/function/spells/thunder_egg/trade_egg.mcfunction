## * Grants the player a Thunder/ous Egg when said Egg is laid by a Chicken.
## * Technically also works by dropping it on the chicken.
## * 
## * Last modified: December 17th, 2024


# Revoke trigger
advancement revoke @s only goldark:internal/collect_egg

# Ignore if no chicken around -- or if RNG roll fails
execute unless entity @n[type=chicken, distance=..2] \
        unless predicate goldark:misc/random_10 run return fail


# Add tag for guaranteeing Thunderous Egg (if Egg was a Thunder Egg)
execute if data entity @n[type=item, distance=..2] Item.components.minecraft:custom_data.goldark.items.thunder_egg \
        run tag @s add goldark.temp.guarantee_thunder_egg_strong

# Remove Egg
clear @s egg 1


# Grant Thunderous Egg
execute if predicate goldark:misc/random_10 run return run function goldark:debug/give/thunderous_egg

execute if entity @s[tag=goldark.temp.guarantee_thunder_egg_strong] run function goldark:debug/give/thunderous_egg
execute if entity @s[tag=goldark.temp.guarantee_thunder_egg_strong] run return run tag @s remove goldark.temp.guarantee_thunder_egg_strong

# Grant Thunder Egg
function goldark:debug/give/thunder_egg