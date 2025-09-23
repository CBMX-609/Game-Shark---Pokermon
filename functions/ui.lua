local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

    if gameshark_config.gamesharkPokeBallBackgroundColor then
        G.SPLASH_BACK:define_draw_steps({
            {
                shader = "splash",
                send = {
                    { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                    { name = "vort_speed", val = 0.4 },
                    { name = "colour_1",   ref_table = G.C.GAMESHARK,  ref_value = "BACKGROUND_WHITE" },
                    { name = "colour_2",   ref_table = G.C.GAMESHARK,  ref_value = "BACKGROUND_RED" },
                },
            },
        })
    else if gameshark_config.gamesharkUltraBallBackgroundColor then
        G.SPLASH_BACK:define_draw_steps({
            {
                shader = "splash",
                send = {
                    { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                    { name = "vort_speed", val = 0.4 },
                    { name = "colour_1",   ref_table = G.C.GAMESHARK,  ref_value = "BACKGROUND_WHITE" },
                    { name = "colour_2",   ref_table = G.C.GAMESHARK,  ref_value = "BACKGROUND_YELLOW" },
                },
            },
        })
        end
    end

    return ret
end