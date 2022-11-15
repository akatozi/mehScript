util.require_natives("1660775568")

--===============--
-- Core Functions
--===============--

    local Commands = menu.trigger_commands
    local Console = function(str) util.toast(str, TOAST_CONSOLE) end
    local GetOn = function(on) if on then return "on" else return "off" end end
    local InSession = function() return util.is_session_started() and not util.is_session_transition_active() end
    local FormatSpace = function(path) return string.gsub(path," > ",">") end
    local GetPathVal = function(path) return menu.get_value(menu.ref_by_path(FormatSpace(path))) end
    local SetPathVal = function(path, state) if dev then Console(FormatSpace(path) .. " / " .. tostring(state)) end menu.set_value(menu.ref_by_path(FormatSpace(path)), state) end
    local ClickPath = function(path) menu.trigger_command(menu.ref_by_path(FormatSpace(path))) end
    local Notify = function(str, update_available = false) if notifications_enabled or update_available then if notifications_mode == 2 then util.show_corner_help("~p~mehScript~s~~n~"..str ) else util.toast("= mehScript =\n"..str) end end end

--===============--
-- Translation
--===============--

    local translation_table = {
        fr = {
            ["Looking For Update"] = "Recherce de Mise à Jour",
            ["Griefing"] = "Embêter",
            ["Freeze"] = "Figer",
            ["Attack"] = "Attaquer",
            ["Kick"] = "Ejecter",
            ["Attempt to Kick "] = "Essai d'éjecter ",
            ["Crash"] = "Crash",
            ["Attempt to Crash "] = "Essai de crash ",
            ["Nuke Button"] = "Boutton Nucléaire",
            ["Nuke attempt on "] = "Essai de supprimer ",
            ["Spectate"] = "Observer",
            ["PvP"] = "JcJ",
            ["Self"] = "Soi",
            ["Script Host Bruteforce"] = "Être Hôte de Script par la Force",
            ["Movement"] = "Mouvement",
            ["Levitation Mode"] = "Mode de Lévitation",
            ["No Clip"] = "No Clip",
            ["Stand Default"] = "Stand par Défaut",
            ["Always Clean"] = "Toujours Propre",
            ["Weapons"] = "Armes",
            ["No Spread"] = "Pas de Dispertion",
            ["No Recoil"] = "Pas de Recul",
            ["Rapid Fire"] = "Tir Rapide",
            ["Thermal Scope"] = "Lunette Thermique",
            ["Levitation Speed"] = "Vitesse de Lévitation",
            ["Normal"] = "Normal",
            ["Slow"] = "Lent",
            ["Refill Health & Armour"] = "Regénérer Vie et Armure",
            ["Auto Armour after Death"] = "Armure Après Mort",
            ["Online"] = "En-ligne",
            ["Regular"] = "Classique",
            ["Ultimate"] = "Ultime",
            ["Setup"] = "Préréglages",
            ["Disable RP Gain"] = "Désactiver Gain de RP",
            ["Job"] = "Activité",
            ["Gigachad"] = "Gigachad",
            ["Protections"] = "Protections",
            ["Game"] = "Jeu",
            ["Rendering"] = "Rendu",
            ["Synthwave"] = "Synthwave",
            ["Clear Vision"] = "Vision Dégagée",
            ["Misc"] = "Divers",
            ["Show OTR Players"] = "Affiche Joueurs Invisible Radar",
            ["Spoof Session Informations"] = "Spoof Informations de Session",
            ["None"] = "Sans",
            ["Language"] = "Langue",
            ["Version"] = "Version",
            ["available.\nPress Update to get it."] = "disponible.\nAppui sur Mettre à jour pour l'obtenir.",
            ["Update to"] = "Mettre à Jour vers",
            ["Notifications"] = "Notifications",
            ["Script failed to download. Please try again later. If this continues to happen then manually update via github."] = "Téléchargement échoué. Réessayez plus tard. Si cela continu d'arriver, mettez à jour via le github.",
            ["Remove Max Aesthetic Parts"] = "Retirer les Pièces Esthétiques Max",
            ["Press E while aiming to activate"] = "Appui sur E en visant pour l'activer",
            ["Informations"] = "Informations",
            ["Very Fast"] = "Très Rapide",
            ["Log"] = "Log",
            ["Help Message"] = "Message D'aide",
            ["Notifications Mode"] = "Mode de Notifications",
            ["Use all kick methods"] = "Utilise toutes les méthodes de kick",
            ["Use all crash methods"] = "Utilise toutes les méthodes de crash",
            ["Take all risks to remove him"] = "Prend tous les risques pour l'éjecter",
            ["Default"] = "Par défaut",
            ["Show FPS"] = "Afficher IPS",
            ["Session"] = "Session",
            ["Settings"] = "Paramètres",
            ["About"] = "A Propos",
            ["Credits"] = "Credits",
            ["Join Discord"] = "Rejoindre le Discord",
            ["Appearence"] = "Apparence",
            ["Disappear"] = "Disparaître",
            ["Radio"] = "Radio",
            ["Radio Everywhere"] = "Radio Partout",
            ["Famous GTA Songs"] = "Musiques GTA Connues",
            ["Auto Remove Bounty"] = "Retirer Auto. Prime",
            ["Auto Skip Conversation"] = "Passe Auto. Dialogues",
            ["Auto Skip Cutscene"] = "Passe Auto. Cinématiques",
            ["Better than the Stand one."] = "Mieux que celui de Stand."
        }
    }

    local Translate = function(str)
        local en_table = {"en","enus","hornyuwu","uwu"}
        if user_lang in en_table[1] then
            return str
        else
            local translated_str = translation_table[user_lang][str]
            if translated_str == nil or translated_str == "" then
                return "EN: "..str
            end
            return translated_str
        end
    end

    user_lang = lang.get_current()
    local supported_lang = false
    local supported_lang_table = {"en","enus","hornyuwu","uwu","fr"}
    for _, tested_lang in pairs(supported_lang_table) do
        if tested_lang == user_lang then
            supported_lang = true
            break
        end
    end
    if not supported_lang then
        user_lang = "en"
        util.toast("= mehScript =\nSorry your language isn't supported. Script language set to English.")
    end

--===============--
-- Update
--===============--

    local version = "0.0.4"
    local FormatVersion = function(str)
        _, c = str:gsub("%.","")
        if c == 2 then
            return tonumber(string.reverse(string.gsub(string.reverse(str), "%.", "", 1)))
        end
        return tonumber(str)
    end

    dev = false
    local response = false
    async_http.init("raw.githubusercontent.com", "/akat0zi/mehScript/main/version", function(output)
        response = true
        local formated_version = FormatVersion(version)
        local formated_output = FormatVersion(output)
        if formated_version < formated_output then
            Notify(Translate("Version") .. " " .. string.gsub(output, "\n", "", 1) .. " " .. Translate("available.\nPress Update to get it."), true)
            menu.action(menu.my_root(), Translate("Update to") .. " ".. output, {}, "", function()
                async_http.init('raw.githubusercontent.com','/akat0zi/mehScript/main/mehScript.lua',function(a)
                    local err = select(2,load(a))
                    if err then
                        Notify(Translate("Script failed to download. Please try again later. If this continues to happen then manually update via github."), true)
                    return end
                    local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
                    f:write(a)
                    f:close()
                    util.restart_script()
                end)
                async_http.dispatch()
            end)
        elseif formated_version > formated_output then
            version = version.." Dev"
            dev = true
        end
    end, function() response = true end)
    async_http.dispatch()
    repeat
        util.yield()
    until response

--===============--
-- Main
--===============--

    -- If you see this you are currently looking the shit I've made so if you have suggestions / tips it would be cool UwU

    local lua_path = "Stand>Lua Scripts>" .. string.gsub(string.gsub(SCRIPT_RELPATH,".lua",""),"\\",">")
    local main = menu.my_root()
    local setup = {
        gigachad = {
            "Self > Weapons > Infinite Ammo",
            "Self > Immortality",
            "Self > Gracefulness",
            "Self > Glued To Seats",
            "Self > Lock Wanted Level",
            "Vehicle > Indestructible",
            "Vehicle > Permanent Mint Condition",
        },
        script = {},
        pvp = {
            "Self>Weapons>Infinite Ammo",
            "Self>Lock Wanted Level",
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("Thermal Scope"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("No Recoil"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("No Spread"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Auto Armour after Death"),
        },
    }

    --===============--
    -- Self
    --===============--

        local self = main:list(Translate("Self"))

        -- movement

            local movement = self:list(Translate("Movement"))

            local levitation_speed_table = {Translate("Very Fast"),Translate("Normal"),Translate("Slow")}
            movement:list_action(Translate("Levitation Speed"),{},"", levitation_speed_table, function(index)
                if index == 1 then
                    Commands("levitatespeed 2")
                    Commands("levitatesprintmultiplier 8")
                elseif index == 2 then
                    Commands("levitatespeed 1")
                    Commands("levitatesprintmultiplier 8")
                elseif index == 3 then
                    Commands("levitatespeed 0.20")
                    Commands("levitatesprintmultiplier 8")
                end
                Notify(Translate("Levitation Speed") .. " " .. levitation_speed_table[index])
            end)

            local levitation_mode_table = {Translate("Stand Default"), Translate("No Clip")}
            movement:list_action(Translate("Levitation Mode"),{},"", levitation_mode_table, function(index)
                if index == 1 then
                    Commands("levitatepassivemin 0")
                    Commands("levitatepassivemax 0.6")
                    Commands("levitatepassivespeed 5")
                    Commands("levitateassistup 0.6")
                    Commands("levitateassistdown 0.6")
                    Commands("levitateassistdeadzone 13")
                    Commands("levitateassistsnap 0.1")
                elseif index == 2 then
                    Commands("levitatepassivemin 0")
                    Commands("levitatepassivemax 0")
                    Commands("levitatepassivespeed 0")
                    Commands("levitateassistup 0")
                    Commands("levitateassistdown 0")
                    Commands("levitateassistdeadzone 0")
                    Commands("levitateassistsnap 0")
                end
                Notify(Translate("Levitation Mode") .. " " .. levitation_mode_table[index])
            end)

        -- appearence

            local appearence = self:list(Translate("Appearence"))

            appearence:toggle(Translate("Disappear"),{},"",function(on)
                on = GetOn(on)
                Commands("invisibility " .. on)
                Commands("otr " .. on)
            end)

            table.insert(setup["script"], appearence:toggle(Translate("Always Clean"),{""},"",function(on)
                util.yield()
                on = GetOn(on)
                Commands("lockwetness " .. on)
                Commands("noblood " .. on)
                Commands("wetness 0")
            end))

        -- weapons

            local weaponm = self:list(Translate("Weapons"))

            local justPressed = {}
            IsEKeyPress = function()
                local keyCode = 0x45
                local isDown = util.is_key_down(keyCode)

                if isDown and not justPressed[keyCode] then
                    justPressed[keyCode] = true
                    return true
                elseif not isDown then
                    justPressed[keyCode] = false
                end
                return false
            end

            weaponm:toggle(Translate("Rapid Fire"),{},"",function(on)
                util.yield()
                on = GetOn(on)
                Commands("rapidfire " .. on)
                Commands("vehiclerapidfire " .. on)
                Commands("noreload " .. on)
            end, menu.get_value(menu.ref_by_command_name("rapidfire")) and menu.get_value(menu.ref_by_command_name("vehiclerapidfire")) and menu.get_value(menu.ref_by_command_name("noreload")))

            weaponm:toggle_loop(Translate("Thermal Scope"), {}, Translate("Press E while aiming to activate"), function()
                local thermal_command = menu.ref_by_path('Game>Rendering>Thermal Vision', 37)
                local aiming = PLAYER.IS_PLAYER_FREE_AIMING(players.user_ped())
                if GRAPHICS.GET_USINGSEETHROUGH() and not aiming then
                    menu.trigger_command(thermal_command, 'off')
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
                elseif IsEKeyPress() then
                    local on
                    local x
                    if menu.get_value(thermal_command) or not aiming then
                        on = 'off'
                        x = 1
                    else
                        on = 'on'
                        x = 50
                    end
                    menu.trigger_command(thermal_command, on)
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(x)
                end
            end)
            
            function GetGunPtr()
                return memory.read_long(memory.read_long(entities.handle_to_pointer(players.user_ped()) + 0x10B8) + 0x20)
            end

            ResetWeaponsMod = function(modified_weapon_table)
                for hash, _ in pairs(modified_weapon_table) do
                    memory.write_float(modified_weapon_table[hash].address, modified_weapon_table[hash].original)
                    modified_weapon_table[hash] = nil
                end
            end

            local modified_weapon_recoil = {}
            table.insert(setup["script"], weaponm:toggle_loop(Translate("No Recoil"),{},"",function()
                if not util.is_session_transition_active() then
                    local weapon = GetGunPtr()
                    if memory.read_float(weapon + 0x2F4) == 0 then return end
                    if modified_weapon_recoil[weapon] == nil then
                        modified_weapon_recoil[weapon] = {
                            address = weapon + 0x2F4,
                            original = memory.read_float(weapon + 0x2F4)
                        }
                    end
                    memory.write_float(weapon + 0x2F4, 0)
                end
            end, function()
                ResetWeaponsMod(modified_weapon_recoil)
            end))

            local modified_weapon_spread_1 = {}
            local modified_weapon_spread_2 = {}
            table.insert(setup["script"], weaponm:toggle_loop(Translate("No Spread"),{},"",function()
                if not util.is_session_transition_active() then
                    local weapon = GetGunPtr()
                    if memory.read_float(weapon + 0x74) == 0 and memory.read_float(weapon + 0x124) == 0 then return end
                    if modified_weapon_spread_1[weapon] == nil then
                        modified_weapon_spread_1[weapon] = {
                            address = weapon + 0x74,
                            original = memory.read_float(weapon + 0x74)
                        }
                    end
                    if modified_weapon_spread_2[weapon] == nil then
                        modified_weapon_spread_2[weapon] = {
                            address = weapon + 0x124,
                            original = memory.read_float(weapon + 0x124)
                        }
                    end
                    memory.write_float(weapon + 0x74, 0)
                end
            end, function()
                ResetWeaponsMod(modified_weapon_spread_1)
                ResetWeaponsMod(modified_weapon_spread_2)
            end))

        -- features

            local regen_all = self:action(Translate("Refill Health & Armour"),{},"",function()
                ENTITY.SET_ENTITY_HEALTH(players.user_ped(), ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()))
                PED.SET_PED_ARMOUR(players.user_ped(), PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
            end)

            local dead = 0
            local armor_after_death_toggle = self:toggle_loop(Translate("Auto Armour after Death"),{},"",function()
                local health = ENTITY.GET_ENTITY_HEALTH(players.user_ped())
                if health == 0 and dead == 0 then
                    dead = 1
                elseif health == ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) and dead == 1 then
                    menu.trigger_command(regen_all)
                    dead = 0
                end
                util.yield(500)
            end)

    --===============--
    -- Online
    --===============--

        local online = main:list(Translate("Online"))

        -- session

            local session = online:list(Translate("Session"))
            
            table.insert(setup["script"], session:toggle(Translate("Show OTR Players"),{},"",function(on)
                util.yield()
                Commands("revealotr " .. GetOn(on))
            end, GetPathVal("Online > Reveal Off The Radar Players")))

            table.insert(setup["script"], session:toggle(Translate("Spoof Session Informations"), {}, "", function(on)
                if on then
                    Commands("spoofsession storymode")
                    ClickPath("Online > Spoofing > Session Spoofing > Session Type > Invalid")
                else
                    Commands("spoofsession off")
                    ClickPath("Online > Spoofing > Session Spoofing > Session Type > Not Spoofed")
                end
            end))

            table.insert(setup["script"], session:toggle(Translate("Script Host Bruteforce"), {}, "", function(on)
                Commands("klepto " .. GetOn(on))
                while on do
                    if InSession() then
                        if players.get_script_host() ~= players.user() then
                            Commands("givesh" .. players.get_name(players.user()))
                        end
                    end
                    util.yield(1000)
                end
            end))

        -- features

            local bounty_address = 1835502 + 4 + 1 + (players.user() * 3)
            table.insert(setup["script"], online:toggle_loop(Translate("Auto Remove Bounty"), {}, "", function()
                if InSession() and memory.read_int(memory.script_global(bounty_address)) == 1 then
                    memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
                    memory.write_int(memory.script_global(2359296 + 1 + 5149 + 13), 2880000)
                    if notifications_enabled then
                        Notify(memory.read_int(memory.script_global(bounty_address + 1)))
                    end
                end
                util.yield(5000)
            end))

            online:toggle_loop(Translate("Disable RP Gain"), {}, "", function()
                memory.write_float(memory.script_global(262145 + 1), 0)
            end, function()
                memory.write_float(memory.script_global(262145 + 1), 1)
            end)

    --===============--
    -- Game
    --===============--

        local game = main:list(Translate("Game"))

        -- rendering

            ResetRendering = function()
                Commands("locktime off")
                Commands("clouds normal")
                Commands("weather normal")
                Commands("shader off")
                if InSession() then
                    Commands("syncclock")
                end
                menu.set_value(menu.ref_by_path('World>Aesthetic Light>Aesthetic Light'), false)
            end

            game:list_action(Translate("Rendering"), {}, "",{Translate("Default"),Translate("Synthwave"),Translate("Clear Vision")}, function(index)
                ResetRendering()
                if index == 2 then
                    menu.set_value(menu.ref_by_path('World>Aesthetic Light>Aesthetic Light'), true)
                    Commands("shader glasses_purple")
                    Commands("aestheticcolourred 255")
                    Commands("aestheticcolourgreen 0")
                    Commands("aestheticcolourblue 255")
                    Commands("aestheticrange 10000")
                    Commands("aestheticintensity 30")
                    Commands("locktime on")
                    Commands("timesmoothing off")
                    Commands("time 0")
                elseif index == 3 then
                    Commands("locktime on")
                    Commands("timesmoothing off")
                    Commands("time 12")
                    Commands("clouds stratoscumulus")
                    Commands("weather extrasunny")
                end
            end)

        -- radio

            local radio = game:list(Translate("Radio"))

            radio:toggle(Translate("Radio Everywhere"), {}, "", function(on)
                Commands("ipod " .. GetOn(on))
            end)

            radio:divider(Translate("Famous GTA Songs"))

            local SetRadio = function(station, track)
                AUDIO.SET_CUSTOM_RADIO_TRACK_LIST(station, track, 1)
                AUDIO.SET_RADIO_TO_STATION_NAME(station)
            end
            
            radio:action("Sleepwalking - The Chain Gang Of 1974",{},"",function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL")
            end)

            radio:action("Don't Come Close - Yeasayer",{},"",function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_TREVOR")
            end)

            radio:action("The Set Up - Favored Nations",{},"",function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_SAVE_MICHAEL_TREVOR")
            end)

        -- features

            game:toggle_loop(Translate("Auto Skip Conversation"),{},"",function()
                if AUDIO.IS_SCRIPTED_CONVERSATION_ONGOING() then
                    AUDIO.SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE()
                end
                util.yield()
            end)

            game:toggle_loop(Translate("Auto Skip Cutscene"),{},"",function()
                CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
                util.yield(100)
            end)

            game:toggle(Translate("Show FPS"),{},"",function(on)
                util.yield()
                Commands("infotps " .. GetOn(on))
            end, GetPathVal("Game > Info Overlay > Ticks Per Second"))

    --===============--
    -- Stand
    --===============--

        local stand = main:list("Stand")
        
        -- protections

            local protection = {
                regular = {
                    "Online > Protections > Events > Crash Event",
                    "Online > Protections > Events > Kick Event",
                    "Online > Protections > Events > Modded Event",
                    "Online > Protections > Events > CEO/MC Ban",
                    "Online > Protections > Events > CEO/MC Ban (Not My CEO)",
                    "Online > Protections > Events > CEO/MC Kick",
                    "Online > Protections > Events > CEO/MC Kick (Not My Boss)",
                    "Online > Protections > Events > Start Freemode Mission",
                    "Online > Protections > Events > Start Freemode Mission (Not My Boss)",
                    "Online > Protections > Events > Teleport To Interior",
                    "Online > Protections > Events > Teleport To Interior (Not My Boss)",
                    "Online > Protections > Events > Give Collectible",
                    "Online > Protections > Events > Give Collectible (Not My Boss)",
                    "Online > Protections > Events > Infinite Loading Screen",
                    "Online > Protections > Events > Teleport To Cayo Perico",
                    "Online > Protections > Events > Cayo Perico Invite",
                    "Online > Protections > Events > Apartment Invite",
                    "Online > Protections > Events > Send To Cutscene",
                    "Online > Protections > Events > Send To Job",
                    "Online > Protections > Events > Transaction Error Event",
                    "Online > Protections > Events > Disable Driving Vehicles",
                    "Online > Protections > Events > Kick From Vehicle",
                    "Online > Protections > Events > Force Camera Forward",
                },

                ultimate = {
                    "Online > Protections > Syncs > Invalid Model Sync",
                    "Online > Protections > Syncs > World Object Sync",
                    "Online > Protections > Syncs > Cage",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > ig_brad",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > cs_brad",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Franklin",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Michael",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Dépanneuse",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Killer Whale",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Dolphin",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Humpback",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Hammer Shark",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Tiger Shark",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Stingray",
                    "Online > Protections > Syncs > Custom Model Sync Reactions > Fish",
                },

                additional = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Block",
                    "Online > Protections > Breakup Kick Reactions > Block",
                    "Online > Protections > Host Kicks > Host Kick Karma",
                    "Online > Protections > Host Kicks > Lessen Host Kicks",
                    "Online > Protections > Breakup Kick Reactions > Karma",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Myself > Karma",
                    "Online > Protections > Love Letter & Desync Kicks > Desync Kick Karma",
                    "Online > Protections > Love Letter & Desync Kicks > Block Love Letter Kicks",
                    "Online > Protections > Lessen Breakup Kicks As Host",
                    "Online > Protections > Block Join Karma",
                    "Online > Protections > Block Entity Spam > Block Entity Spam",
                    "Online > Protections > Block Entity Spam > Automatically Use Anti-Crash Cam",
                    "Online > Protections > Prevent Renderer Working To Death",
                    "Online > Protections > Block RID 0 Crash",
                    "Online > Protections > Block RID 0 Crash For Others",
                },

                additional_notif = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Notification",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Myself > Notification",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Someone Else > Notification",
                    "Online > Protections > Love Letter & Desync Kicks > Notification When Love Letter Kicked",
                },

                additional_log = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Write To Console",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Myself > Write To Console",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Someone Else > Write To Console",
                    "Online>Protections>Buttplug Kick Reactions>Myself>Write To Log File",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Myself > Write To Log File",
                    "Online > Protections > Knockoff Breakup Kick Reactions > Someone Else > Write To Log File",
                },

                special = { -- on = 2
                    "Online > Protections > Events > Infinite Phone Ringing",
                    "Online > Protections > Events > Vehicle Takeover",
                    "Online > Protections > Events > Freeze",
                    "Online > Protections > Events > Love Letter Kick Blocking Event",
                    "Online > Protections > Events > Raw Network Events > PTFX",
                    "Online > Protections > Events > Raw Network Events > Remove All Weapons Event",
                    "Online > Protections > Events > Raw Network Events > Remove Weapon Event",
                    "Online > Protections > Events > Raw Network Events > Give Weapon Event",
                }
            }

            SetProtectionsToggle = function(on, mode)
                local block_on = 0
                if on == 3 then
                    block_on = 2
                end
                for _, path in pairs(protection[mode]) do
                    SetPathVal(path..">Block", block_on)
                    if protections_log and on ~= 0 then
                        SetPathVal(path..">Write To Log File", 3)
                        SetPathVal(path..">Write To Console", 3)
                    else
                        SetPathVal(path..">Write To Log File", 0)
                        SetPathVal(path..">Write To Console", 0)
                    end
                    if protections_notification and on ~= 0 then
                        SetPathVal(path..">Notification", 3)
                    else
                        SetPathVal(path..">Notification", 0)
                    end
                end
                for _, path in pairs(protection["special"]) do
                    SetPathVal(path..">Block", block_on)
                    if protections_log and on ~= 0 then
                        SetPathVal(path..">Write To Log File", 2)
                        SetPathVal(path..">Write To Console", 2)
                    else
                        SetPathVal(path..">Write To Log File", 0)
                        SetPathVal(path..">Write To Console", 0)
                    end
                    if protections_notification and on ~= 0 then
                        SetPathVal(path..">Notification", 2)
                    else
                        SetPathVal(path..">Notification", 0)
                    end
                end
            end

            SetProtections = function(mode, state)
                local add_state = false
                local log_on = protections_log
                local notification_on = protections_notification
                if state then
                    SetProtectionsToggle(3, mode)
                    if mode == "regular" or mode == "ultimate" then
                        add_state = true
                    end
                else
                    log_on = false
                    notification_on = false
                    SetProtectionsToggle(0, mode)
                end
                for _, path in pairs(protection["additional"]) do
                    SetPathVal(path, add_state)
                end
                for _, path in pairs(protection["additional_log"]) do
                    SetPathVal(path, log_on)
                end
                for _, path in pairs(protection["additional_notif"]) do
                    SetPathVal(path, notification_on)
                end
            end

            Protections = function(str)
                if str == "Regular" then
                    Commands("novotekicks off")
                    SetProtections("ultimate", false)
                    SetProtections("regular", true)
                elseif str == "Ultimate" then
                    Commands("novotekicks sctv")
                    SetProtections("regular", true)
                    SetProtections("ultimate", true)
                elseif str == "None" then
                    Commands("novotekicks off")
                    SetProtections("regular", false)
                    SetProtections("ultimate", false)
                end
                if notifications_enabled then
                    Notify(Translate("Protections").." "..Translate(str))
                end
            end

            local protectionm = stand:list(Translate("Protections"))

            protections_log = true
            protectionm:toggle(Translate("Log"),{},"",function(on)
                util.yield()
                protections_log = on
            end, true)

            protections_notification = true
            protectionm:toggle(Translate("Notifications"),{},"",function(on)
                util.yield()
                protections_notification = on
            end, true)

            protectionm:action(Translate("None"),{},"All Protections Off",function()
                Protections("None")
            end)

            protectionm:action(Translate("Regular"),{},"Crash and Kick Protections On",function()
                Protections("Regular")
            end)

            protectionm:action(Translate("Ultimate"),{},"All Protections On",function()
                Protections("Ultimate")
            end)

        -- setup

            Setup = function(mode)
                SetupBis(mode)
                if mode == Translate("Gigachad") then
                    for _, path in pairs(setup["gigachad"]) do
                        SetPathVal(path, true)
                    end
                    for _, ref in pairs(setup["script"]) do
                        menu.set_value(ref, true)
                    end
                elseif mode == Translate("PvP") then
                    for _, path in pairs(setup["pvp"]) do
                        SetPathVal(path, true)
                    end
                    menu.trigger_command(regen_all)
                end
            end

            SetupBis = function(mode)
                if mode ~= Translate("Gigachad") then
                    for _, path in pairs(setup["gigachad"]) do
                        SetPathVal(path, false)
                    end
                end
                if mode ~= Translate("Gigachad") then
                    for _, ref in pairs(setup["script"]) do
                        menu.set_value(ref, false)
                    end
                end
                if mode ~= Translate("PvP") then
                    for _, path in pairs(setup["pvp"]) do
                        SetPathVal(path, false)
                    end
                end
            end

            setup_table = {Translate("Job"),Translate("Gigachad"),Translate("PvP")}
            stand:list_action(Translate("Setup"),{},"", setup_table, function(index)
                Setup(setup_table[index])
                if notifications_enabled then
                    Notify(Translate("Setup") .." ".. setup_table[index])
                end
            end)

    --===============--
    -- Misc
    --===============--

        local misc = main:list(Translate("Misc"))

        -- settings

            misc:divider(Translate("Settings"))

            notifications_mode = "Stand"
            misc:list_select(Translate("Notifications Mode"),{},"",{"Stand",Translate("Help Message")},1,function(selected_mode)
                notifications_mode = selected_mode
            end)

            notifications_toggle = misc:toggle(Translate("Notifications"),{},"",function(on)
                util.yield()
                notifications_enabled = on
            end, true)

            if menu.get_value(notifications_toggle) then
                notifications_enabled = true
            end

        -- about

            misc:divider(Translate("About"))
            misc:action(Translate("Version") .. " " .. version, {}, "", function() end)

            -- credits

                local credits = misc:list(Translate("Credits"))
                local credits_action = function(name, detail) credits:action(name, {}, detail, function() end) end
                credits_action("Akatozi. (me)", "My goal with this script is to have useful features at hand, because I'm still a beginner I used parts of code from other devs more competent than me for some features. I'm not trying to do a 'big' script as LanceScript Reloaded or WiriScript but I want a script that has all the features I need / I use often.")
                credits:divider("Awesome Devs")
                credits_action("lance", "Creator of LanceScript\nSynthwave rendering and inspired for no recoil / spread.")
                credits_action("Prisuhm", "Creator of JinxScript\nAwesome Update function and some crash methods. Display players list.")
                credits_action("Jerry123", "Creator of JerryScript\nThermal scope.")
            
            -- links

                misc:hyperlink(Translate("Join Discord"),"https://discord.gg/uUNRn6xgw5")
                misc:hyperlink("Github","https://github.com/akat0zi/mehScript")

--===============--
-- Player Menu
--===============--

    local attack = {
        crash = {
            "smash",
            "crash",
            "choke",
            "flashcrash",
            "ngcrash",
            "footlettuce",
        },

        kick = {
            "kick",
        },

    }

    StartAttack = function(list, pid)
        for _, cmd in pairs(attack[list]) do
            if players.exists(pid) then
                Commands(cmd .. players.get_name(pid))
            end
        end
        if list == "kick" then
            util.trigger_script_event(1 << pid, {111242367, pid, memory.script_global(2689235 + 1 + (pid * 453) + 318 + 7)})
            util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
        end
    end

    PlayerMenu = function(pid)
        local player = menu.player_root(pid)
        local player_name = players.get_name(pid)
        player:divider("mehScript (" .. players.get_name(pid) .. ")")

        -- griefing

            local griefm = player:list(Translate("Griefing"),{},"")
            griefm:toggle_loop(Translate("Freeze"),{}, Translate("Better than the Stand one."),function()
                util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0, 0, 0})
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                util.yield()
            end)

        -- attack

            local attacksm = player:list(Translate("Attack"),{},"")

            attacksm:action(Translate("Kick"),{},Translate("Use all kick methods"),function()
                Notify(Translate("Attempt to Kick ") .. player_name)
                StartAttack("kick",pid)
            end)

            attacksm:action(Translate("Crash"),{},Translate("Use all crash methods"),function()
                Notify(Translate("Attempt to Crash ") .. player_name)
                StartAttack("crash",pid)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local pos = players.get_position(pid)
                local mdl = util.joaat("u_m_m_jesus_01")
                local veh_mdl = util.joaat("oppressor")
                util.request_model(veh_mdl)
                util.request_model(mdl)
                    for i = 1, 10 do
                        if not players.exists(pid) then
                            return
                        end
                        local veh = entities.create_vehicle(veh_mdl, pos, 0)
                        local jesus = entities.create_ped(2, mdl, pos, 0)
                        PED.SET_PED_INTO_VEHICLE(jesus, veh, -1)
                        util.yield(100)
                        TASK.TASK_VEHICLE_HELI_PROTECT(jesus, veh, ped, 10.0, 0, 10, 0, 0)
                        util.yield(1000)
                        entities.delete_by_handle(jesus)
                        entities.delete_by_handle(veh)
                    end
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(mdl)
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(veh_mdl)
            end)

            attacksm:action(Translate("Nuke Button"),{},Translate("Take all risks to remove him"),function()
                Notify(Translate("Nuke attempt on ") .. player_name)
                StartAttack("crash",pid)
                util.yield(5000)
                StartAttack("kick",pid)
            end)

            player:toggle(Translate("Spectate"),{},"",function(on)
                util.yield()
                if players.exists(pid) then
                    Commands("spectate" .. player_name .. " " .. GetOn(on))
                end
            end)
    end

    for _, pid in pairs(players.list()) do
        PlayerMenu(pid)
    end
    players.on_join(PlayerMenu)

util.keep_running()
