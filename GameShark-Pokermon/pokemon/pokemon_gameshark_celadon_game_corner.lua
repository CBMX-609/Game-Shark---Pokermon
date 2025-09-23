local celadon_game_corner = {
  -- Name, atlas position, joker text and information queue (tooltips)
  name = "celadon_game_corner",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Other', key = 'gameshark_celadon_game_corner_slot_machine' }                   --Tooltip, found in en-us.lua
    info_queue[#info_queue + 1] = { set = 'Other', key = 'designed_by', vars = { "CBMX" } } --Credit, found in en-us.lua
    return { vars = {} }
  end,

  -- Define joker parameters
  designer = "CBMX",
  rarity = 3,
  cost = 1,
  stage = "Other",
  atlas = "gameshark_other_jokers", --Change this for Pokermon release
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,

  --This is what the Joker actually does
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand and context.before then --Are you playing a hand?
      local sevens = 0
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 7 then sevens = sevens + 1 end  --Count the number of sevens in played hand
      end
      --print("DEBUG",sevens) --debug tool
      if sevens == 0 then return end                                      --If no sevens, do nothing
      delay(0.2)
      ease_dollars(-3)                                                    --Lose $3 and say -$3, at the right time
      delay(0.7)
      local slots_roll_amount = 0                                         --Decimal value between 0 (low roll) and 1 (high roll)
      slots_roll_amount = pseudorandom(pseudoseed('celadon_game_corner')) -- Determine roll
      if sevens >= 3 then                                                 --if a hand is played with 3 7s in it, double those odds
        slots_roll_amount = slots_roll_amount / 2                         --0.0 to 0.5 cheater
        slots_roll_amount = slots_roll_amount + 0.5                       --0.5 to 1.0
      end
      if slots_roll_amount >= .995 then                                   --0.5% to get negative porygon
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_negative_porygon"), colour = G.C.BLACK })
        delay(0.7)
        G.E_MANAGER:add_event(Event({ --Generate Pocket Tag
          func = (function()
            play_sound('timpani')
            local temp_card = { set = "Joker", area = G.jokers, key = "j_poke_porygon", edition = { negative = true } } --Create the negative porygon
            local new_card = SMODS.create_card(temp_card)
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
            return true
          end)
        }))
      elseif slots_roll_amount >= .985 then --1% to get $100
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_100_bucks"), colour = G.C.MONEY })
        ease_dollars(100)
      elseif slots_roll_amount >= .95 then --3.5% to get Pocket Tag
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_pocket_tag"), colour = G.C.PURPLE })
        delay(0.7)
        G.E_MANAGER:add_event(Event({ --Generate Pocket Tag
          func = (function()
            add_tag(Tag('tag_poke_pocket_tag'))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
            return true
          end)
        }))
      elseif slots_roll_amount >= .88 then --7% to get Investment Tag
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_investment_tag"), colour = G.C.CHIPS })
        delay(0.7)
        G.E_MANAGER:add_event(Event({ --Generate Investment Tag
          func = (function()
            add_tag(Tag('tag_investment'))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
            return true
          end)
        }))
      elseif slots_roll_amount >= .75 then --13% to get Standard Tag
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_standard_tag"), colour = G.C.YELLOW })
        delay(0.7)
        G.E_MANAGER:add_event(Event({ --Generate Standard Tag
          func = (function()
            add_tag(Tag('tag_standard'))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
            return true
          end)
        }))
      elseif slots_roll_amount >= .50 then --25% to get $6
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("gameshark_celadon_game_corner_6_bucks"), colour = G.C.RED })
        delay(0.7)
        ease_dollars(6)
      else
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize("k_nope_ex"), colour = G.C.RED })
      end
    end
  end,
  --[[
  Localization for "cries", in case these are needed in the future. (under Misc, description)
  Needs a prefix change to be added to main Pokermon of course
      gameshark_celadon_game_corner_6_bucks = "Three Cherries!",
      gameshark_celadon_game_corner_standard_tag = "Three Pikachu!",
      gameshark_celadon_game_corner_pocket_tag = "Three Staryu!",
      gameshark_celadon_game_corner_investment_tag = "Three Squirtle!",
      gameshark_celadon_game_corner_100_bucks = "Three Pokeballs!",
      gameshark_celadon_game_corner_negative_porygon = "Three Sevens!",
]]

  --[[
  Localization for slot machine info queue (under Other)
      slot_machine = {
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
]]
}

return {
  name = "Celadon Game Corner",
  list = {
    celadon_game_corner
  },
}