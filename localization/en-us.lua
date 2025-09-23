return {
    descriptions = {

        Joker = {

            j_gameshark_celadon_game_corner = {
                name = "Celadon Game Corner",
                text = {
                    "Lose {C:money}$3{} and spin the {S:1.1,C:green,E:2}Slot Machine{}",
                    "if scoring hand contains a {C:attention}7{}",
                    "{br:3.5}text needs to be here to work",
                    "{C:attention}Double the odds{} if scoring",
                    "hand contains three {C:attention}7s{}",
                },
            },

            j_gameshark_dark_cave = {
                name = "Dark Cave",
                text = {
                    "{C:green}#1# in #2#{} chance to create an",
                    "{C:green}Uncommon{} Pokemon {C:attention}Joker{}",
                    "at end of round",
                    "{br:2}text needs to be here to work",
                    "Guaranteed if you have",
                    "a {X:lightning, C:black}Lightning{} Joker",
                },
            },

        },

        Other = {

            designed_by = {
                name = "Designed By",
                text = {
                    "{C:dark_edition}#1#{}"
                },
            },

            gameshark_celadon_game_corner_slot_machine = {
                name = "Slot Machine",
                text = {
                    "{C:green}25%{} - {C:money}$6{}",
                    "{C:green}13%{} - {C:attention}Standard Tag{}",
                    "{C:green}7%{} - {C:attention}Investment Tag{}",
                    "{C:green}3.5%{} - {C:attention}Pocket Tag{}",
                    "{C:green}1%{} - {C:money}$100{}",
                    "{C:green}0.5%{} - {C:dark_edition}???{}",
                },
            },
        },
    },

    misc = {
        dictionary = {
            --Config Descriptions
            gameshark_custom_jokers_config = "Allow Game Shark's Custom Jokers?",
            gameshark_celadon_game_corner_config = "Enable Celadon Game Corner?",
            gameshark_dark_cave_config = "Enable Dark Cave?",
            gameshark_poke_ball_background_color_config = "Poke Ball Background Color? (Restart Required) (Descending Priority)",
            gameshark_ultra_ball_background_color_config = "Ultra Ball Background Color?",

            --From Celadon Game Corner
            gameshark_celadon_game_corner_6_bucks = "Three Cherries!",
            gameshark_celadon_game_corner_standard_tag = "Three Pikachu!",
            gameshark_celadon_game_corner_pocket_tag = "Three Staryu!",
            gameshark_celadon_game_corner_investment_tag = "Three Squirtle!",
            gameshark_celadon_game_corner_100_bucks = "Three Pokeballs!",
            gameshark_celadon_game_corner_negative_porygon = "Three Sevens!",
        }
    }
}
