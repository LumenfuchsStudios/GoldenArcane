## # AydenTFoxx @ September 16th - 25th, 2024

# * GIVE Weather: Clear -- A basic function to return a spell when its casting fails.

# ? Run by: Player [on Base spell "fail" Function]


give @s knowledge_book[ \
            item_name='{ "translate": "goldark.spells.weather.clear", "italic": false }', \
            lore=[ '{ "translate": "goldark.spells.weather.clear.lore", "color": "blue" }' ], \
            enchantment_glint_override=true, \
            rarity="rare", \
            recipes=[ \
                "goldark:spells/weather/clear/trigger" \
            ] \
        ]