## * Gives the user a strong Vial of Blood with default effects.
## * 
## * Last modified: January 13th, 2025 (AydenTFoxx)


give @s potion[ \
    enchantment_glint_override=true, \
    rarity=uncommon, \
    lore=[ '{ "text": "* You shall regret this.", "color": "dark_red", "italic": false }' ], \
    custom_data={ goldark.items.blood_vial_strong: true }, \
    potion_contents={ \
        custom_color: 5966346, \
        custom_name: "blood", \
        custom_effects: [ \
            { id: "darkness", amplifier: 1, ambient: true, duration: 400 }, \
            { id: "unluck", amplifier: 1, ambient: true, duration: 80 } \
        ] \
    } \
]