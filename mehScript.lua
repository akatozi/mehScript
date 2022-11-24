local version = 0.74
util.keep_running()

--===============--
-- Natives
--===============--

    GRAPHICS={
        ["GET_USINGSEETHROUGH"]=function()native_invoker.begin_call()native_invoker.end_call_2(0x44B80ABAB9D80BD3)return native_invoker.get_return_value_bool()end,
        ["_SEETHROUGH_SET_MAX_THICKNESS"]=function(thickness)native_invoker.begin_call()native_invoker.push_arg_float(thickness)native_invoker.end_call_2(0x0C8FAC83902A62DF)end,
    }
    PLAYER={
        ["IS_PLAYER_FREE_AIMING"]=function(player)native_invoker.begin_call()native_invoker.push_arg_int(player)native_invoker.end_call_2(0x2E397FD2ECD37C87)return native_invoker.get_return_value_bool()end,
        ["GET_PLAYER_MAX_ARMOUR"]=function(player)native_invoker.begin_call()native_invoker.push_arg_int(player)native_invoker.end_call_2(0x92659B4CE1863CB3)return native_invoker.get_return_value_int()end,
        ["GET_PLAYER_PED_SCRIPT_INDEX"]=function(player)native_invoker.begin_call()native_invoker.push_arg_int(player)native_invoker.end_call_2(0x50FAC3A3E030A6E1)return native_invoker.get_return_value_int()end,
    }
    ENTITY={
        ["GET_ENTITY_HEALTH"]=function(entity)native_invoker.begin_call()native_invoker.push_arg_int(entity)native_invoker.end_call_2(0xEEF059FAD016D209)return native_invoker.get_return_value_int()end,
        ["SET_ENTITY_HEALTH"]=function(entity,health,p2)native_invoker.begin_call()native_invoker.push_arg_int(entity)native_invoker.push_arg_int(health)native_invoker.push_arg_int(p2)native_invoker.end_call_2(0x6B76DC1F3AE6E6A3)end,
        ["GET_ENTITY_MAX_HEALTH"]=function(entity)native_invoker.begin_call()native_invoker.push_arg_int(entity)native_invoker.end_call_2(0x15D757606D170C3C)return native_invoker.get_return_value_int()end,
    	["SET_ENTITY_MAX_HEALTH"]=function(entity,value)native_invoker.begin_call()native_invoker.push_arg_int(entity)native_invoker.push_arg_int(value)native_invoker.end_call_2(0x166E7CF68597D8B5)end,
    }
    PED={
        ["SET_PED_ARMOUR"]=function(ped,amount)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_int(amount)native_invoker.end_call_2(0xCEA04D83135264CC)end,
    }
    TASK={
        ["CLEAR_PED_TASKS_IMMEDIATELY"]=function(ped)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.end_call_2(0xAAA34F8A7CB32098)end,
    }
    AUDIO={
        ["IS_SCRIPTED_CONVERSATION_ONGOING"]=function()native_invoker.begin_call()native_invoker.end_call_2(0x16754C556D2EDE3D)return native_invoker.get_return_value_bool()end,
        ["SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE"]=function()native_invoker.begin_call()native_invoker.end_call_2(0x9663FE6B7A61EB00)end,
        ["SET_CUSTOM_RADIO_TRACK_LIST"]=function(radioStation,trackListName,p2)native_invoker.begin_call()native_invoker.push_arg_string(radioStation)native_invoker.push_arg_string(trackListName)native_invoker.push_arg_bool(p2)native_invoker.end_call_2(0x4E404A9361F75BB2)end,
        ["SET_RADIO_TO_STATION_NAME"]=function(stationName)native_invoker.begin_call()native_invoker.push_arg_string(stationName)native_invoker.end_call_2(0xC69EDA28699D5107)end,
    }
    CUTSCENE={
        ["STOP_CUTSCENE_IMMEDIATELY"]=function()native_invoker.begin_call()native_invoker.end_call_2(0xD220BDD222AC4A1E)end,
    }
    PAD={
        ["IS_CONTROL_JUST_PRESSED"]=function(padIndex,control)native_invoker.begin_call()native_invoker.push_arg_int(padIndex)native_invoker.push_arg_int(control)native_invoker.end_call_2(0x580417101DDB492F)return native_invoker.get_return_value_bool()end,
    }
    NETWORK={
        ["_SET_RELATIONSHIP_TO_PLAYER"]=function(player,p1)native_invoker.begin_call()native_invoker.push_arg_int(player)native_invoker.push_arg_bool(p1)native_invoker.end_call_2(0xA7C511FA1C5BDA38)end,
    }
    PHYSICS={
        ["_SET_LAUNCH_CONTROL_ENABLED"]=function(toggle)native_invoker.begin_call()native_invoker.push_arg_bool(toggle)native_invoker.end_call_2(0xAA6A6098851C396F)end,
    }

--===============--
-- Core Functions
--===============--

    local Commands = menu.trigger_commands
    local GetOn = function(on) if on then return "on" else return "off" end end
    local InSession = function() return util.is_session_started() and not util.is_session_transition_active() end
    local GetPathVal = function(path) return menu.get_value(menu.ref_by_path(path)) end
    local SetPathVal = function(path, state) menu.set_value(menu.ref_by_path(path), state) end
    local ClickPath = function(path) menu.trigger_command(menu.ref_by_path(path)) end
    local Notify = function(str) if notifications_enabled or update_available then if notifications_mode == 2 then util.show_corner_help("~p~mehScript~s~~n~"..str ) else util.toast("= mehScript =\n"..str) end end end

--===============--
-- Translation
--===============--

    user_lang = lang.get_current()
    local en_table = {"en", "en-us", "hornyuwu", "uwu","sex"}
    local english
    local supported_lang
    for _, lang in pairs(en_table) do
        if user_lang == lang then
            english = true
            supported_lang = true
            break
        end
    end

    if not supported_lang then
        local SupportedLang = function()
            local supported_lang_table = {"fr"}
            for _, tested_lang in pairs(supported_lang_table) do
                if tested_lang == user_lang then
                    supported_lang = true
                    return
                end
            end
            english = true
            util.toast("= mehScript =\nSorry your language isn't supported. Script language set to English.")
        end

        SupportedLang()
    end

    local translation_table = {
        fr = {
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
            ["Refill Health & Armor"] = "Regénérer Vie et Armure",
            ["Auto Armor after Death"] = "Armure Après Mort",
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
            ["Version"] = "Version",
            ["available.\nPress Update to get it."] = "disponible.\nAppui sur Mettre à jour pour l'obtenir.",
            ["Update to"] = "Mettre à Jour vers",
            ["Notifications"] = "Notifications",
            ["Script failed to download. Please try again later. If this continues to happen then manually update via github."] = "Téléchargement échoué. Réessayez plus tard. Si cela continu d'arriver, mettez à jour via le github.",
            ["Press E while aiming to activate."] = "Appui sur E en visant pour l'activer.",
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
            ["Radio"] = "Radio",
            ["Radio Everywhere"] = "Radio Partout",
            ["Famous GTA Songs"] = "Musiques GTA Connues",
            ["Auto Remove Bounty"] = "Retirer Auto. Prime",
            ["Auto Skip Conversation"] = "Passe Auto. Dialogues",
            ["Auto Skip Cutscene"] = "Passe Auto. Cinématiques",
            ["Better than the Stand one."] = "Mieux que celui de Stand.",
            ["Disable all protections."] = "Désactive toutes les protections.",
            ["Enable crash and kick protections."] = "Active protections de crash et exclusion.",
            ["Enable all protections."] = "Active toutes les protections.",
            ["Ghost Mode"] = "Mode Fantôme",
            ["Bounty"] = "Prime",
            ["Bounty Amount"] = "Somme Prime",
            ["Chose the amount of the bounty offered automatically."] = "Choisit la valeur de la prime placée en boucle.",
            ["Auto Bounty"] = "Prime Auto.",
            ["Loop that place a bounty on the player."] = "Place une prime en boucle sur le joueur.",
            ["Bounty Removed: "] = "Prime Retirée: ",
            ["Undead OTR"] = "Invisible Radar de Mort",
            ["Infinite ammo in magazine with insane shooting speed."] = "Munitions infini dans le chargeur et cadence de tir incroyable.",
            ["Weapons will no longer have recoil."] = "Les armes n'auront plus de recul.",
            ["Weapons will no longer have bullet spread."] = "Les armes n'auront plus de dispertion de balles.",
            ["Regenerate to max your health and armor."] = "Régénère au max la vie et armure.",
            ["A body armor will be applied automatically when respawning."] = "Une protection sera appliqué automatiquement lors de la réapparition.",
            ["Keep your ped dry and clean."] = "Garde le personnage sec et propre.",
            ["Display on the radar invisible players."] = "Affiche les joueurs invisibles sur le radar.",
            ["Spoof your session informations so nobody can join you from your R* profile."] = "Masque les informations de la session pour empêcher les gens de vous rejoindre depuis votre progile R*.",
            ["Use all methods to become script host and remain so."] = "Utilise toutes les méthodes pour devenir hôte de script et le rester.",
            ["Automatically remove bounty on your head."] = "Retire automatiquement les primes sur ta tête.",
            ["You will not gain any RP."] = "Tu ne gagneras plus de RP.",
            ["Turn you off the radar without notifying other players."] = "Devient invisible sur le radar sans avertir les autres joueurs.",
            ["You are able to listen to the radio everywhere."] = "Tu es capable d'écouter la radio partout.",
            ["Click to play the song."] = "Clique pour jouer la musique.",
            ["Automatically skip all conversations."] = "Passe automatiquement les dialogues.",
            ["Automatically skip all cutscenes."] = "Passe automatiquement les cinématiques.",
            ["Display your FPS on screen."] = "Affiches les IPS sur l'écran.",
            ["The player can't shoot you anymore, same for you."] = "Le joueur ne peut plus te tirer dessus, pareil pour toi.",
            ["Vehicle"] = "Véhicule",
            ["Launch Control"] = "Départ Controllé",
            ["Prevents the car from burning when starting to drive away faster."] = "Empêche la voiture de patiner au démarrage pour aller plus vite.",
            ["Stop Spectating"] = "Arrêter d'Observer",
            ["If you are spectating a player, it will stop to spectate him."] = "Si vous observez un joueur, cela va arrêter de l'observer.",
        }
    }

    local Translate = function(str)
        if english then
            return str
        else
            local translated_str = translation_table[user_lang][str]
            if translated_str == nil or translated_str == "" then
                return "* " .. str
            end
            return translated_str
        end
    end

--===============--
-- Roots
--===============--

    local main = menu.my_root()
    local self = main:list(Translate("Self"))
    local vehicle = main:list(Translate("Vehicle"))
    local online = main:list(Translate("Online"))
    local game = main:list(Translate("Game"))
    local stand = main:list("Stand")
    local misc = main:list(Translate("Misc"))

--===============--
-- Update
--===============--

    local update_available
    async_http.init("raw.githubusercontent.com", "/akat0zi/mehScript/main/version", function(output)
        if tonumber(version) < tonumber(output) then
            update_available = true
            Notify(Translate("Version") .. " " .. string.gsub(output, "\n", "", 1) .. " " .. Translate("available.\nPress Update to get it."))
            update_button = menu.action(menu.my_root(), Translate("Update to") .. " ".. output, {}, "", function()
                async_http.init('raw.githubusercontent.com','/akat0zi/mehScript/main/mehScript.lua',function(a)
                    local err = select(2,load(a))
                    if err then
                        Notify(Translate("Script failed to download. Please try again later. If this continues to happen then manually update via github."))
                    return end
                    local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
                    f:write(a)
                    f:close()
                    util.restart_script()
                end)
                async_http.dispatch()
            end)
            menu.attach_before(self, menu.detach(update_button))
        end
    end)
    async_http.dispatch()

--===============--
-- Main
--===============--

    local lua_path = "Stand>Lua Scripts>" .. string.gsub(string.gsub(SCRIPT_RELPATH,".lua",""),"\\",">")

    local setup = {
        gigachad = {
            "Self>Weapons>Infinite Ammo",
            "Self>Immortality",
            "Self>Gracefulness",
            "Self>Glued To Seats",
            "Self>Lock Wanted Level",
            "Vehicle>Indestructible",
            "Vehicle>Permanent Mint Condition",
        },
        script = {},
        pvp = {
            "Self>Weapons>Infinite Ammo",
            "Self>Lock Wanted Level",
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("Thermal Scope"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("No Recoil"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Weapons") .. ">" .. Translate("No Spread"),
            lua_path .. ">" .. Translate("Self") .. ">" .. Translate("Auto Armor after Death"),
        },
    }

    --===============--
    -- Self
    --===============--

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

        -- weapons

            local weaponm = self:list(Translate("Weapons"))

            weaponm:toggle(Translate("Rapid Fire"),{},Translate("Infinite ammo in magazine with insane shooting speed."),function(on)
                util.yield()
                on = GetOn(on)
                Commands("rapidfire " .. on)
                Commands("vehiclerapidfire " .. on)
                Commands("noreload " .. on)
            end, menu.get_value(menu.ref_by_command_name("rapidfire")) and menu.get_value(menu.ref_by_command_name("vehiclerapidfire")) and menu.get_value(menu.ref_by_command_name("noreload")))

            local thermal_command = menu.ref_by_path('Game>Rendering>Thermal Vision')
            weaponm:toggle_loop(Translate("Thermal Scope"), {}, Translate("Press E while aiming to activate."), function()
                local aiming = PLAYER.IS_PLAYER_FREE_AIMING(players.user())
                if GRAPHICS.GET_USINGSEETHROUGH() and not aiming then
                    menu.trigger_command(thermal_command, 'off')
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
                elseif PAD.IS_CONTROL_JUST_PRESSED(38, 38) then
                    if menu.get_value(thermal_command) or not aiming then
                        menu.trigger_command(thermal_command, "off")
                        GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
                    else
                        menu.trigger_command(thermal_command, "on")
                        GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(50)
                    end
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
            table.insert(setup["script"], weaponm:toggle_loop(Translate("No Recoil"),{},Translate("Weapons will no longer have recoil."),function()
                if not util.is_session_transition_active() and players.get_vehicle_model(players.user()) == 0 then
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
            table.insert(setup["script"], weaponm:toggle_loop(Translate("No Spread"),{},Translate("Weapons will no longer have bullet spread."),function()
                if not util.is_session_transition_active() and players.get_vehicle_model(players.user()) == 0 then
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

            local regen_all = self:action(Translate("Refill Health & Armor"),{},Translate("Regenerate to max your health and armor."),function()
                ENTITY.SET_ENTITY_HEALTH(players.user_ped(), ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()))
                PED.SET_PED_ARMOUR(players.user_ped(), PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
            end)

            local dead = 0
            local armor_after_death_toggle = self:toggle_loop(Translate("Auto Armor after Death"),{},Translate("A body armor will be applied automatically when respawning."),function()
                local health = ENTITY.GET_ENTITY_HEALTH(players.user_ped())
                if health == 0 and dead == 0 then
                    dead = 1
                elseif health == ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) and dead == 1 then
                    menu.trigger_command(regen_all)
                    dead = 0
                end
                util.yield(500)
            end)

            table.insert(setup["script"], self:toggle(Translate("Always Clean"),{},Translate("Keep your ped dry and clean."),function(on)
                util.yield()
                on = GetOn(on)
                Commands("lockwetness " .. on)
                Commands("noblood " .. on)
                Commands("wetness 0")
            end))

    --===============--
    -- Vehicle
    --===============--

            vehicle:toggle(Translate("Launch Control"),{},Translate("Prevents the car from burning when starting to drive away faster."),function(on)
                PHYSICS._SET_LAUNCH_CONTROL_ENABLED(on)
            end)
    
    --===============--
    -- Online
    --===============--

        -- session

            local session = online:list(Translate("Session"))

            table.insert(setup["script"], session:toggle(Translate("Show OTR Players"),{},Translate("Display on the radar invisible players."),function(on)
                util.yield()
                Commands("revealotr " .. GetOn(on))
            end, GetPathVal("Online>Reveal Off The Radar Players")))

            table.insert(setup["script"], session:toggle(Translate("Spoof Session Informations"), {}, Translate("Spoof your session informations so nobody can join you from your R* profile."), function(on)
                if on then
                    Commands("spoofsession storymode")
                    ClickPath("Online>Spoofing>Session Spoofing>Session Type>Invalid")
                else
                    Commands("spoofsession off")
                    ClickPath("Online>Spoofing>Session Spoofing>Session Type>Not Spoofed")
                end
            end))

            table.insert(setup["script"], session:toggle(Translate("Script Host Bruteforce"), {}, Translate("Use all methods to become script host and remain so."), function(on)
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

            table.insert(setup["script"], online:toggle_loop(Translate("Auto Remove Bounty"), {}, Translate("Automatically remove bounty on your head."), function()
                local bounty_address = 1835507 + (players.user() * 3)
                if InSession() and memory.read_int(memory.script_global(bounty_address)) == 1 then
                    memory.write_int(memory.script_global(2816932), -1)
                    memory.write_int(memory.script_global(2364459), 2880000)
                    if notifications_enabled then
                        Notify(Translate("Bounty Removed: ") .. memory.read_int(memory.script_global(bounty_address + 1)))
                    end
                end
                util.yield(5000)
            end))

            online:toggle_loop(Translate("Disable RP Gain"), {},Translate("You will not gain any RP."), function()
                memory.write_float(memory.script_global(262146), 0)
            end, function()
                memory.write_float(memory.script_global(262146), 1)
            end)

            online:toggle_loop(Translate("Undead OTR"),{},Translate("Turn you off the radar without notifying other players."),function()
                if ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) ~= 0 then
                    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(), 0)
                end
                util.yield()
            end, function()
                ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(), 328)
            end)

            online:action(Translate("Stop Spectating"),{},Translate("If you are spectating a player, it will stop to spectate him."),function()
                if #player_spectate ~= 0 then
                    Commands("mehspectate" .. player_spectate[1] .. " off")
                end
            end)

    --===============--
    -- Game
    --===============--

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

            radio:toggle(Translate("Radio Everywhere"), {}, Translate("You are able to listen to the radio everywhere."), function(on)
                Commands("ipod " .. GetOn(on))
            end)

            radio:divider(Translate("Famous GTA Songs"))

            local SetRadio = function(station, track)
                AUDIO.SET_CUSTOM_RADIO_TRACK_LIST(station, track, 1)
                AUDIO.SET_RADIO_TO_STATION_NAME(station)
            end

            radio:action("Sleepwalking - The Chain Gang Of 1974",{},Translate("Click to play the song."),function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL")
            end)

            radio:action("Don't Come Close - Yeasayer",{},Translate("Click to play the song."),function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_TREVOR")
            end)

            radio:action("The Set Up - Favored Nations",{},Translate("Click to play the song."),function()
                SetRadio("RADIO_01_CLASS_ROCK", "END_CREDITS_SAVE_MICHAEL_TREVOR")
            end)

        -- features

            game:toggle_loop(Translate("Auto Skip Conversation"),{},Translate("Automatically skip all conversations."),function()
                if AUDIO.IS_SCRIPTED_CONVERSATION_ONGOING() then
                    AUDIO.SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE()
                end
                util.yield()
            end)

            game:toggle_loop(Translate("Auto Skip Cutscene"),{},Translate("Automatically skip all cutscenes."),function()
                CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
                util.yield(100)
            end)

            game:toggle(Translate("Show FPS"),{},Translate("Display your FPS on screen."),function(on)
                util.yield()
                Commands("infotps " .. GetOn(on))
            end, GetPathVal("Game>Info Overlay>Ticks Per Second"))

    --===============--
    -- Stand
    --===============--

        -- protections

            local protection = {
                regular = {
                    "Online>Protections>Events>Crash Event",
                    "Online>Protections>Events>Kick Event",
                    "Online>Protections>Events>Modded Event",
                    "Online>Protections>Events>CEO/MC Ban",
                    "Online>Protections>Events>CEO/MC Ban (Not My CEO)",
                    "Online>Protections>Events>CEO/MC Kick",
                    "Online>Protections>Events>CEO/MC Kick (Not My Boss)",
                    "Online>Protections>Events>Start Freemode Mission",
                    "Online>Protections>Events>Start Freemode Mission (Not My Boss)",
                    "Online>Protections>Events>Teleport To Interior",
                    "Online>Protections>Events>Teleport To Interior (Not My Boss)",
                    "Online>Protections>Events>Give Collectible",
                    "Online>Protections>Events>Give Collectible (Not My Boss)",
                    "Online>Protections>Events>Infinite Loading Screen",
                    "Online>Protections>Events>Teleport To Cayo Perico",
                    "Online>Protections>Events>Cayo Perico Invite",
                    "Online>Protections>Events>Apartment Invite",
                    "Online>Protections>Events>Send To Cutscene",
                    "Online>Protections>Events>Send To Job",
                    "Online>Protections>Events>Transaction Error Event",
                    "Online>Protections>Events>Disable Driving Vehicles",
                    "Online>Protections>Events>Kick From Vehicle",
                    "Online>Protections>Events>Force Camera Forward",
                },

                ultimate = {
                    "Online>Protections>Syncs>Invalid Model Sync",
                    "Online>Protections>Syncs>World Object Sync",
                    "Online>Protections>Syncs>Cage",
                },

                additional = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Block",
                    "Online>Protections>Breakup Kick Reactions>Block",
                    "Online>Protections>Host Kicks>Host Kick Karma",
                    "Online>Protections>Host Kicks>Lessen Host Kicks",
                    "Online>Protections>Breakup Kick Reactions>Karma",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Karma",
                    "Online>Protections>Love Letter & Desync Kicks>Desync Kick Karma",
                    "Online>Protections>Love Letter & Desync Kicks>Block Love Letter Kicks",
                    "Online>Protections>Lessen Breakup Kicks As Host",
                    "Online>Protections>Block Join Karma",
                    "Online>Protections>Block Entity Spam>Block Entity Spam",
                    "Online>Protections>Block Entity Spam>Automatically Use Anti-Crash Cam",
                    "Online>Protections>Prevent Renderer Working To Death",
                    "Online>Protections>Block RID 0 Crash",
                    "Online>Protections>Block RID 0 Crash For Others",
                },

                additional_notif = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Notification",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Notification",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Notification",
                    "Online>Protections>Love Letter & Desync Kicks>Notification When Love Letter Kicked",
                },

                additional_log = {
                    "Online>Protections>Buttplug Kick Reactions>Myself>Write To Console",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Write To Console",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Write To Console",
                    "Online>Protections>Buttplug Kick Reactions>Myself>Write To Log File",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Write To Log File",
                    "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Write To Log File",
                },

                special = {
                    "Online>Protections>Events>Infinite Phone Ringing",
                    "Online>Protections>Events>Vehicle Takeover",
                    "Online>Protections>Events>Freeze",
                    "Online>Protections>Events>Love Letter Kick Blocking Event",
                    "Online>Protections>Events>Raw Network Events>PTFX",
                    "Online>Protections>Events>Raw Network Events>Remove All Weapons Event",
                    "Online>Protections>Events>Raw Network Events>Remove Weapon Event",
                    "Online>Protections>Events>Raw Network Events>Give Weapon Event",
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

            protectionm:action(Translate("None"),{},Translate("Disable all protections."),function()
                Protections("None")
            end)

            protectionm:action(Translate("Regular"),{},Translate("Enable crash and kick protections."),function()
                Protections("Regular")
            end)

            protectionm:action(Translate("Ultimate"),{},Translate("Enable all protections."),function()
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
                    Notify(Translate("Setup") .. " " .. setup_table[index])
                end
            end)

    --===============--
    -- Misc
    --===============--

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
                credits_action("Akatozi", "My goal with this script is to have useful features at hand, because I'm still a beginner I used parts of code from other devs more competent than me for some features. I'm not trying to do a 'big' script as LanceScript Reloaded or WiriScript but I want a script that has all the features I need / I use often.")
                credits:divider("Awesome Devs")
                credits_action("lance", "Creator of LanceScript\nSynthwave rendering and inspired for no recoil / spread.")

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

    player_spectate = {}

    StartAttack = function(list, pid)
        for _, cmd in pairs(attack[list]) do
            if players.exists(pid) then
                Commands(cmd .. players.get_name(pid))
            end
        end
    end

    PlayerMenu = function(pid)
        if pid == players.user() then return end
        local player = menu.player_root(pid)
        local player_name = players.get_name(pid)
        player:divider("mehScript")

        -- griefing

            local griefing = player:list(Translate("Griefing"),{},"")

            local bounty = griefing:list(Translate("Bounty"), {}, "")
            local bounty_amount = 10000
            bounty:toggle_loop(Translate("Auto Bounty"),{},Translate("Loop that place a bounty on the player."), function()
                if InSession() then
                    Commands("bounty" .. player_name .. " " .. bounty_amount)
                end
                util.yield(12000)
            end)

            bounty:slider(Translate("Bounty Amount"),{"mehbountyamount"},Translate("Chose the amount of the bounty offered automatically."),1,10000,10000,1000,function(amount)
                bounty_amount = amount
            end)

            griefing:toggle(Translate("Ghost Mode"),{},Translate("The player can't shoot you anymore, same for you."),function(on)
                NETWORK._SET_RELATIONSHIP_TO_PLAYER(pid, on)
            end)

            griefing:toggle_loop(Translate("Freeze"),{}, Translate("Better than the Stand one."),function()
                if players.exists() then
                    util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0, 0, 0}) -- credits to jinx
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                    Commands("freeze" .. player_name .. " on")
                end
                util.yield()
            end, function()
                if players.exists() then
                    Commands("freeze" .. player_name .. " off")
                end
            end)

        -- attack

            local attack = player:list(Translate("Attack"),{},"")

            attack:action(Translate("Kick"),{},Translate("Use all kick methods"),function()
                Notify(Translate("Attempt to Kick ") .. player_name)
                StartAttack("kick",pid)
            end)

            attack:action(Translate("Crash"),{},Translate("Use all crash methods"),function()
                Notify(Translate("Attempt to Crash ") .. player_name)
                StartAttack("crash",pid)
            end)

            attack:action(Translate("Nuke Button"),{},Translate("Take all risks to remove him"),function()
                Notify(Translate("Nuke attempt on ") .. player_name)
                StartAttack("kick",pid)
                util.yield(5000)
                StartAttack("crash",pid)
            end)

            player:toggle(Translate("Spectate"),{"mehspectate"},"",function(on)
                util.yield()
                if on then
                    if #player_spectate ~= 0 then
                        Commands("mehspectate" .. player_spectate[1] .. " off")
                    end
                    table.insert(player_spectate, player_name)
                    Commands("spectate" .. player_name .. " on")
                else
                    if players.exists(pid) then
                        Commands("spectate" .. player_spectate[1] .. " off")
                    end
                    table.remove(player_spectate, 1)
                end
            end)
    end

    for _, pid in pairs(players.list()) do
        PlayerMenu(pid)
    end
    players.on_join(PlayerMenu)
