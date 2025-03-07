## * Gives the user a Purity potion.
## * 
## * Last modified: December 27th, 2024 (AydenTFoxx)

# Merry Christmas!
# Happy Holidays :)


give @s potion[ \
        custom_data={ goldark.potions.purity: true }, \
        rarity="uncommon", \
        potion_contents={ \
            custom_color: 16185295, \
            custom_name: "purity", \
            custom_effects: [ \
                { \
                    id: "darkness", \
                    amplifier: 0, \
                    ambient: true, \
                    duration: 200 \
                }, \
                { \
                    id: "glowing", \
                    amplifier: 0, \
                    ambient: true, \
                    duration: 200 \
                }, \
                { \
                    id: "luck", \
                    ambient: true, \
                    duration: 1, \
                    show_icon: false, \
                    show_particles: false \
                } \
            ] \
        }, \
        use_cooldown={ seconds: 6 } \
    ]