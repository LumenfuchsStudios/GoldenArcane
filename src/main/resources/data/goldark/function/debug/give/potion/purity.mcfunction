## * Gives the user a Purity potion.
## * 
## * Last modified: December 25th, 2024 (AydenTFoxx)

# Merry Christmas!
# Happy Holidays :)


give @s potion[ \
        rarity="uncommon", \
        potion_contents={ \
            custom_color: 16185295, \
            custom_name: "purity", \
            custom_effects: [ \
                { \
                    id: "goldark:purity", \
                    ambient: true, \
                    duration: 600 \
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