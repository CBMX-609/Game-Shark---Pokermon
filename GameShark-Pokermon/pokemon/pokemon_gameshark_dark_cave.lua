local dark_cave = {
  -- Name, atlas position, joker text and information queue (tooltips)
  name = "dark_cave",
  pos = { x = 2, y = 0 },
  config = { extra = { odds = 2, } },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Other', key = 'designed_by', vars = { "CBMX" } }
    return { vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, } }
  end,

  -- Define joker parameters
  designer = "CBMX",
  rarity = 1,
  cost = 7,
  stage = "Other",
  atlas = "gameshark_other_jokers", --Change this for Pokermon release
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,

  --This is what the Joker actually does
  calculate = function(self, card, context)
    local has_lightning = false
    if #find_pokemon_type("Lightning") > 0 then
      has_lightning = true
    end
    if context.cardarea == G.jokers and context.end_of_round then
      if #G.jokers.cards < G.jokers.config.card_limit then
        if has_lightning or pseudorandom('dark_cave') < G.GAME.probabilities.normal / card.ability.extra.odds then
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              play_sound('timpani')
              local _card = create_random_poke_joker("dark_cave", nil, "uncommon", nil, nil)
              _card:add_to_deck()
              G.jokers:emplace(_card)
              return true
            end
          }))
          delay(0.6)
        end
      end
    end
  end
}

return {
  name = "Dark Cave",
  list = {
    dark_cave
  },
}