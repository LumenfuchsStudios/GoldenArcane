## * Initializes a Lycanthropy Rite when building the correct Altar.
## * The advancement is only triggered if the Soul Lantern is the last block to be placed,
## * and the triggering player is above the Soul Lantern block.
## * 
## * Last modified: December 11th, 2024 (AydenTFoxx)


# Revoke trigger
advancement revoke @s only goldark:internal/build_structure/ritual_lycanthropy


# Require Lycanthropy Altar for ritual
execute unless predicate goldark:ritual/lycanthropy run return fail

# Require Full Moon night for ritual
execute unless score #goldark_moon_phase goldark.dummy matches 0 \
        unless score #goldark_time_day goldark.dummy matches 13000..23000 \
        run return fail


# Convert Obsidian atop
setblock ~2 ~1 ~2 crying_obsidian replace
setblock ~2 ~1 ~-2 crying_obsidian replace
setblock ~-2 ~1 ~2 crying_obsidian replace
setblock ~-2 ~1 ~-2 crying_obsidian replace

# Break catalyst
setblock ~2 ~2 ~2 fire destroy
setblock ~2 ~2 ~-2 fire destroy
setblock ~-2 ~2 ~2 fire destroy
setblock ~-2 ~2 ~-2 fire destroy

# Consume candles
setblock ~2 ~-1 ~ fire
setblock ~-2 ~-1 ~ fire
setblock ~ ~-1 ~2 fire
setblock ~ ~-1 ~-2 fire

# Consume gold
setblock ~2 ~-2 ~ soul_soil
setblock ~-2 ~-2 ~ soul_soil
setblock ~ ~-2 ~2 soul_soil
setblock ~ ~-2 ~-2 soul_soil

# Convert Soul Soil below
setblock ~ ~-2 ~ soul_sand


# Call upon lightning
summon lightning_bolt ~2 ~2 ~2
summon lightning_bolt ~2 ~2 ~-2
summon lightning_bolt ~-2 ~2 ~2
summon lightning_bolt ~-2 ~2 ~-2


# Display audiovisual feedback
playsound ambient.basalt_deltas.mood neutral @a[distance=..32] ~ ~ ~ 1 1.2 0.3
playsound entity.ravager.roar neutral @a[distance=..32] ~ ~ ~ 1 0.8 0.3

particle explosion_emitter ~ ~ ~ 1.0 1.0 1.0 1.0 1


# Init Dummy
execute align xyz run summon marker ~0.5 ~ ~0.5 { Tags: [ goldark.dummy_ritual.lycanthropy ] }

scoreboard players set @n[type=marker, tag=goldark.dummy_ritual.lycanthropy, distance=..8] goldark.ability_timer 0