## * Creates scoreboards and value holders for usage by Golden Arcane's features.
## *
## * Last modified: November 25th, 2024 (AydenTFoxx)


### OBJECTIVE DECLARATION

## [Import from load_effects] (goldark)
function goldark:core/load_effects


## Dummy (any)
# A featureless scoreboard with no specific function of its own;
# Used whenever a score is needed but does not warrant a new objective.
scoreboard objectives add goldark.dummy dummy { "text": "Dummy", "color": "gold" }

## Ambience Clock (goldark)
# A periodic clock for passive/ambient effects in some locations, such as ABYSS' Darkness or Heavens' Regeneration.
scoreboard objectives add goldark.ambient_clock dummy { "text": "Ambient Clock", "color": "dark_green" }

## Ability Clock (goldark, garrow)
# Adds a clock for running entities' abilities; Also doubles as a cooldown.
scoreboard objectives add goldark.ability_clock dummy { "text": "Ability Clock", "color": "blue" }

## Ability Timer (goldark, garrow)
# Adds a timer for the duration of an entity's ability.
scoreboard objectives add goldark.ability_timer dummy { "text": "Ability Timer", "color": "aqua" }


## Used Item: Egg (goldark)
# Triggers whenever an Egg is thrown; Used for triggering Thunder Egg's mechanic.
scoreboard objectives add goldark.used_item.egg minecraft.used:egg { "text": "Used: Egg", "color": "gray" }


## Team: GoldArk_Morph
# Used by transformed entities to prevent collision with their morph.
team add GoldArk_Morph { "text": "GoldArk Morph", "color": "dark_aqua" }
team modify GoldArk_Morph collisionRule never


### VALUE INITIALIZATION

## Settings:

# Set GoldArk Tick Rate to default
execute unless score #goldark_tick_rate goldark.dummy matches 1.. \
    run scoreboard players set #goldark_tick_rate goldark.dummy 2

# Sets Golden Arcane's difficulty to the world's difficulty equivalent.
# DARK Mode is regarded as Hard Mode-equivalent for this purpose.
execute store result score $goldark_diff_reload goldark.dummy run difficulty

execute unless score $goldark_diff goldark.dummy matches 4 store result score $goldark_diff goldark.dummy run difficulty
execute if score $goldark_diff goldark.dummy matches 4 unless score $goldark_diff_reload goldark.dummy matches 3 store result score $goldark_diff goldark.dummy run difficulty

# Set Storm Clouds limit to default
execute unless score #goldark_storm_cloud_limit goldark.dummy matches 1.. run scoreboard players set #goldark_storm_cloud_limit goldark.dummy 2