----------------------------------------------------------------------------------------------
-------------------------------------| BRUTAL BOXING :) |-------------------------------------
----------------------------------------------------------------------------------------------

--[[
Hi, thank you for buying our script, We are very grateful!

For help join our Discord server:     https://discord.gg/85u2u5c8q9
More informations about the script:   https://docs.brutalscripts.com
--]]

Config = {
    Core = 'qbcore',  -- 'ESX' / 'QBCORE' | Other core setting on the 'core' folder.
    TextUI = 'ox_lib', -- 'ox_lib' / 'okokTextUI' / 'ESXTextUI' / 'QBDrawText' // Custom can be add in the cl_utils.lua!!!
    BrutalNotify = true, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    SteamName = true, -- true = Steam name | false = character name

    Marker = {use = true, marker = 20, bobUpAndDown = true, rotate = false, size = {0.3, 0.2, 0.2}, rgb = {15, 100, 210}},
    DisableControls = {22}, -- These controls will blocked during the boxing match.
    DemageModifier = {Use = true, Basic = 0.25, Glove = 0.15},
    TimeToBet = 30, -- After the start there is this time to bet.

    Areas = {
        -- INFO: The ring names can't be same. Each one should have a different name.--

        ['BOXING CLUB'] = { -- MLO [FREE]: https://www.gta5-mods.com/maps/mlo-underground-box-ring-at-tequilala-sp-fivem
            Time = 60,
            Blip = {color = 1, sprite = 546, size = 0.7},
            Start = vector3(-561.88, 284.6, 77.68),
            Player1 = vector4(-559.03, 282.04, 78.53, 309.95),
            Player2 = vector4(-554.16, 285.97, 78.53, 124.53),
        },

        ['BOXING CLUB 2'] = { -- MLO [FREE]: https://gta5mod.net/gta-5-mods/maps/fight-ring-add-on-sp-fivem-1-0/
            Time = 60,
            Blip = {color = 1, sprite = 546, size = 0.7},
            Start = vector3(-3.3711, -1663.172, 30.299459),
            Player1 = vector4(-0.099415, -1662.737, 30.299459, 93.845718),
            Player2 = vector4(-6.786387, -1663.185, 30.299461, 247.88696),
        },
    },
   
    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    MoneyForm = '$', -- Money form

    Locales = {
        Male = 'Male',
        Female = 'Female',
    },

    MenuOpen = {'[E] - Boxing Menu', 38}, -- Label, control1
    
    -- Notify function EDITABLE >> cl_utils.lua
    Notify = { 
        [1] = {"Boxing", "You're already joined!", 5000, "error"},
        [2] = {"Boxing", "The opponent has left the party.", 5000, "info"},
        [3] = {"Boxing", "You already bet!", 5000, "error"},
        [4] = {"Boxing", "You have made a successful bet: <b>", 5000, "success"},
        [5] = {"Boxing", "You got back the bet amount:", 5000, "info"},
        [6] = {"Boxing", "You do not have enough money.", 5000, "error"},
        [7] = {"Boxing", "You got:", 5000, "success"},
        [8] = {"Boxing", "You didn't win.", 5000, "error"},
    }
}
