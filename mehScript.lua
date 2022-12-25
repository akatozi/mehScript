local version = "0.82"
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
        ["GET_ENTITY_VELOCITY"]=function(entity)native_invoker.begin_call();native_invoker.push_arg_int(entity);native_invoker.end_call("4805D2B1D8CF94A9");return native_invoker.get_return_value_vector3();end,
        ["IS_ENTITY_IN_AIR"]=function(entity)native_invoker.begin_call();native_invoker.push_arg_int(entity);native_invoker.end_call("886E37EC497200B6");return native_invoker.get_return_value_bool();end,
        ["APPLY_FORCE_TO_ENTITY"]=function(entity,forceFlags,x,y,z,offX,offY,offZ,boneIndex,isDirectionRel,ignoreUpVec,isForceRel,p12,p13)native_invoker.begin_call();native_invoker.push_arg_int(entity);native_invoker.push_arg_int(forceFlags);native_invoker.push_arg_float(x);native_invoker.push_arg_float(y);native_invoker.push_arg_float(z);native_invoker.push_arg_float(offX);native_invoker.push_arg_float(offY);native_invoker.push_arg_float(offZ);native_invoker.push_arg_int(boneIndex);native_invoker.push_arg_bool(isDirectionRel);native_invoker.push_arg_bool(ignoreUpVec);native_invoker.push_arg_bool(isForceRel);native_invoker.push_arg_bool(p12);native_invoker.push_arg_bool(p13);native_invoker.end_call("C5F68BE9613E2D18");end,
        ["_GET_ENTITY_PHYSICS_HEADING"]=function(entity)native_invoker.begin_call()native_invoker.push_arg_int(entity)native_invoker.end_call_2(0x846BF6291198A71E)return native_invoker.get_return_value_float()end,
        ["GET_ENTITY_SPEED"]=function(entity)native_invoker.begin_call();native_invoker.push_arg_int(entity);native_invoker.end_call("D5037BA82E12416F");return native_invoker.get_return_value_float();end,
    }
    PED={
        ["SET_PED_ARMOUR"]=function(ped,amount)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_int(amount)native_invoker.end_call_2(0xCEA04D83135264CC)end,
        ["GET_VEHICLE_PED_IS_IN"]=function(ped,includeLastVehicle)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.push_arg_bool(includeLastVehicle)native_invoker.end_call_2(0x9A9112A0FE9A4713)return native_invoker.get_return_value_int()end,
    }
    TASK={
        ["CLEAR_PED_TASKS_IMMEDIATELY"]=function(ped)native_invoker.begin_call()native_invoker.push_arg_int(ped)native_invoker.end_call_2(0xAAA34F8A7CB32098)end,
    }
    AUDIO={
        ["IS_SCRIPTED_CONVERSATION_ONGOING"]=function()native_invoker.begin_call()native_invoker.end_call_2(0x16754C556D2EDE3D)return native_invoker.get_return_value_bool()end,
        ["SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE"]=function()native_invoker.begin_call()native_invoker.end_call_2(0x9663FE6B7A61EB00)end,
    }
    CUTSCENE={
        ["STOP_CUTSCENE_IMMEDIATELY"]=function()native_invoker.begin_call()native_invoker.end_call_2(0xD220BDD222AC4A1E)end,
    }
    PAD={
        ["IS_CONTROL_JUST_PRESSED"]=function(padIndex,control)native_invoker.begin_call()native_invoker.push_arg_int(padIndex)native_invoker.push_arg_int(control)native_invoker.end_call_2(0x580417101DDB492F)return native_invoker.get_return_value_bool()end,
        ["GET_CONTROL_NORMAL"]=function(padIndex,control)native_invoker.begin_call();native_invoker.push_arg_int(padIndex);native_invoker.push_arg_int(control);native_invoker.end_call("EC3C9B8D5327B563");return native_invoker.get_return_value_float();end,
        ["IS_CONTROL_PRESSED"]=function(padIndex,control)native_invoker.begin_call();native_invoker.push_arg_int(padIndex);native_invoker.push_arg_int(control);native_invoker.end_call("F3A21BCD95725A4A");return native_invoker.get_return_value_bool();end,
    }
    NETWORK={
        ["_SET_RELATIONSHIP_TO_PLAYER"]=function(player,p1)native_invoker.begin_call()native_invoker.push_arg_int(player)native_invoker.push_arg_bool(p1)native_invoker.end_call_2(0xA7C511FA1C5BDA38)end,
    }
    PHYSICS={
        ["_SET_LAUNCH_CONTROL_ENABLED"]=function(toggle)native_invoker.begin_call()native_invoker.push_arg_bool(toggle)native_invoker.end_call_2(0xAA6A6098851C396F)end,
    }
    VEHICLE = {
        ["IS_VEHICLE_ON_ALL_WHEELS"]=function(vec)native_invoker.begin_call();native_invoker.push_arg_int(vec);native_invoker.end_call("B104CD1BABF302E2");return native_invoker.get_return_value_bool();end,
        ["SET_VEHICLE_REDUCE_GRIP"]=function(vec,toggle)native_invoker.begin_call();native_invoker.push_arg_int(vec);native_invoker.push_arg_bool(toggle);native_invoker.end_call("222FF6A823D122E2");end,
        ["SET_VEHICLE_STEER_BIAS"]=function(vec,value)native_invoker.begin_call();native_invoker.push_arg_int(vec);native_invoker.push_arg_float(value);native_invoker.end_call("42A8EC77D5150CBE");end,
    }

--===============--
-- Core Functions
--===============--

    local Commands = menu.trigger_commands
    local GetOn = function(on) if on then return "on" else return "off" end end
    local InSession = function() return util.is_session_started() and not util.is_session_transition_active() end
    local GetPathVal = function(path) return menu.get_value(menu.ref_by_path(path)) end
    local SetPathVal = function(path,state) local path_ref = menu.ref_by_path(path) if menu.is_ref_valid(path_ref) then menu.set_value(path_ref,state) end end
    local ClickPath = function(path) local path_ref = menu.ref_by_path(path) if menu.is_ref_valid(path_ref) then menu.trigger_command(path_ref) end end
    local Notify = function(str) if notifications_enabled or update_available then if notifications_mode == 2 then util.show_corner_help("~p~mehScript~s~~n~"..str ) else util.toast("= mehScript =\n"..str) end end end

--===============--
-- Translation
--===============--

    user_lang = lang.get_current()
    local en_table = {"en","en-us","hornyuwu","uwu","sex"}
    local english
    local supported_lang
    for _,lang in pairs(en_table) do
        if user_lang == lang then
            english = true
            supported_lang = true
            break
        end
    end

    if not supported_lang then
        local SupportedLang = function()
            local supported_lang_table = {"fr"}
            for _,tested_lang in pairs(supported_lang_table) do
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
            ["Kick"] = "Exclure",
            ["Kick Player"] = "Exclure le Joueur",
            ["Attempt to Kick "] = "Essai d'éjecter ",
            ["Crash"] = "Crash",
            ["Attempt to Crash "] = "Essai de crash ",
            ["Nuke Button"] = "Boutton Nucléaire",
            ["Nuke on "] = "Suppression de ",
            ["Spectate"] = "Observer",
            ["Self"] = "Soi",
            ["Script Host Bruteforce"] = "Être Hôte de Script par la Force",
            ["Movement"] = "Mouvement",
            ["Levitation Mode"] = "Mode de Lévitation",
            ["No Clip"] = "No Clip",
            ["Stand Default"] = "Stand par Défaut",
            ["Always Clean"] = "Toujours Propre",
            ["Weapons"] = "Armes",
            ["Thermal Scope"] = "Lunette Thermique",
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
            ["Clear View"] = "Vision Dégagée",
            ["Lock time to noon, without clouds."] = "Bloque le temps à midi, sans nuages.",
            ["Misc"] = "Divers",
            ["Show OTR Players"] = "Affiche Joueurs Invisible Radar",
            ["Spoof Session Informations"] = "Spoof Informations de Session",
            ["None"] = "Sans",
            ["Version"] = "Version",
            ["available.\nPress Update to get it."] = "disponible.\nAppui sur Mettre à jour pour l'obtenir.",
            ["Update to"] = "Mettre à Jour vers",
            ["Notifications"] = "Notifications",
            ["Script failed to download. Please try again later. If this continues to happen then manually update via github."] = "Téléchargement échoué. Réessayez plus tard. Si cela continu d'arriver,mettez à jour via le github.",
            ["Press E while aiming to activate."] = "Appui sur E en visant pour l'activer.",
            ["Informations"] = "Informations",
            ["Very Fast"] = "Très Rapide",
            ["Log"] = "Log",
            ["Help Message"] = "Message D'aide",
            ["Notifications Mode"] = "Mode de Notifications",
            ["Take all risks to remove him.\nNote: You may be karma."] = "Prend tous les risques pour l'éjecter.\nNote: Tu pourrai être karma.",
            ["Default"] = "Par défaut",
            ["Session"] = "Session",
            ["Settings"] = "Paramètres",
            ["About"] = "A Propos",
            ["Credits"] = "Credits",
            ["Join Discord"] = "Rejoindre le Discord",
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
            ["Undead OTR"] = "Invisible Mort-Vivant",
            ["Infinite ammo in magazine with insane shooting speed."] = "Munitions infini dans le chargeur et cadence de tir incroyable.",
            ["Regenerate to max your health and armor."] = "Régénère au max la vie et armure.",
            ["A body armor will be applied automatically when respawning."] = "Une protection sera appliqué automatiquement lors de la réapparition.",
            ["Keep your ped dry and clean."] = "Garde le personnage sec et propre.",
            ["Display on the radar invisible players."] = "Affiche les joueurs invisibles sur le radar.",
            ["Spoof your session informations so nobody can join you from your R* profile."] = "Masque les informations de la session pour empêcher les gens de vous rejoindre depuis votre profil R*.",
            ["You will not gain any RP."] = "Tu ne gagneras plus de RP.",
            ["Turn you off the radar without notifying other players.\nNote: Trigger Modded Health detection."] = "Devient invisible sur le radar sans avertir les autres joueurs.\nNote: Déclenche la détection de Vie Modder.",
            ["Automatically skip all conversations."] = "Passe automatiquement les dialogues.",
            ["Automatically skip all cutscenes."] = "Passe automatiquement les cinématiques.",
            ["Display your FPS on screen."] = "Affiches les IPS sur l'écran.",
            ["The player can't shoot you anymore,same for you."] = "Le joueur ne peut plus te tirer dessus,pareil pour toi.",
            ["Vehicle"] = "Véhicule",
            ["Launch Control"] = "Départ Contrôler",
            ["Prevents the car from burning when starting to drive away faster."] = "Empêche la voiture de patiner au démarrage pour aller plus vite.",
            ["Stop Spectating"] = "Arrêter d'Observer",
            ["If you are spectating a player,it will stop to spectate him."] = "Si vous observez un joueur,cela va arrêter de l'observer.",
            ["Drift"] = "Drift",
            ["Press SHIFT to drift."] = "Appuis sur MAJ pour drifter.",
            ["Counter Steering Assist"] = "Assistance Contre-Braquage",
            ["Helps you so you don't do 360."] = "Empêche de faire des 360.",
            ["Counter Steering Angle"] = "Angle Contre-Braquage",
            ["Your drift angle can't be higher than this value."] = "L'angle de drift ne peut pas être plus grand que cette valeur.",
            [" organisation."] = "organisation.",
            ["Kick Organisation"] = "Exclure l'Organisation",
            ["Kick all organisation members."] = "Exclu tous les membres de l'organisation.",
            ["Crash Player"] = "Crash le Joueur",
            ["Crash Organisation"] = "Crash l'Organisation",
            ["Crash all organisation members."] = "Crash tous les membres de l'organisation.",
            ["Will send a private chat message to the player when kicking him."] = "Envoi un message privé au joueur en l'éjectant.",
            ["Kick Message"] = "Message d'Exclusion",
            ["Turn on all useful features so nobody can disturb you."] = "Active toutes les fonctionnalités utiles pour que personne ne t'embête.",
            ["Everything is turned off,you are now 'legit'."] = "Tout est désactivé,tu es 'legit'.",
            ["Job & Heists"] = "Activités et Braquages",
            ["Fight"] = "Combat",
            ["Levitation without any weird forces on you."] = "Lévitation sans les forces bizarres te poussant vers le bas.",
            ["Default Stand levitation with up and down forces."] = "Lévitation de Stand avec des forces vers le haut et le bas.",
            ["Loop offer bounty on everyone."] = "Boucle qui place des primes sur tout le monde.",
            ["Exclude Self"] = "Exclure Soi",
            ["Bounty will not be offered on yourself."] = "La prime ne sera pas placée sur soi.",
            ["Preset Message"] = "Message Prédéfini",
            ["Auto Kick Tryhard"] = "Exclu Auto. Tryhard",
            ["Kick all tryhard players.\nThings like: "] = "Exclu tous les joueurs avec un pseudo tryhard.\nExemple: ",
            ["Reason: Tryhard Name"] = "Raison: Nom de Tryhard",
            ["Warning: You are about to kick players until you become host. Are you sure ?"] = "Attention: Tu es va exclure des joueurs jusqu'à être l'hôte. Es-tu sûr ?",
            ["You Are Host."] = "Tu Es Hôte.",
            ["Kick players until you become host."] = "Exclu des joueurs jusqu'à que tu sois hôte.",
            ["Become Host"] = "Devenir Hôte",
            ["Hey, don't hesitate to join the discord !"] = "Salut, n'hésite pas à rejoindre le discord !",
        }
    }

    local Translate = function(str)
        if english then
            return str
        else
            local translated_str = translation_table[user_lang][str]
            if translated_str == nil or translated_str == "" then
                return "* "..str
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
    async_http.init("raw.githubusercontent.com","/akat0zi/mehScript/main/version",function(output)
        if tonumber(version) < tonumber(output) then
            update_available = true
            Notify(Translate("Version").." "..string.gsub(output,"\n","",1).." "..Translate("available.\nPress Update to get it."))
            update_button = menu.action(menu.my_root(),Translate("Update to").." "..output,{},"",function()
                async_http.init('raw.githubusercontent.com','/akat0zi/mehScript/main/mehScript.lua',function(a)
                    if select(2,load(a)) then
                        Notify(Translate("Script failed to download. Please try again later. If this continues to happen then manually update via github."))
                        return
                    end
                    local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH,"wb")
                    f:write(a)
                    f:close()
                    util.restart_script()
                end)
                async_http.dispatch()
            end)
            menu.attach_before(self,menu.detach(update_button))
        elseif tonumber(version) > tonumber(output) then
            dev_build = main:divider("Dev Build",{},"",function() end)
            menu.attach_before(self,menu.detach(dev_build))
        end
    end)
    async_http.dispatch()

--===============--
-- Main
--===============--

    local lua_path = "Stand>Lua Scripts>"..string.gsub(string.gsub(SCRIPT_RELPATH,".lua",""),"\\",">")

    local setup = {
        gigachad = {
            "Self>Weapons>Infinite Ammo",
            "Self>Immortality",
            "Self>Gracefulness",
            "Self>Glued To Seats",
            "Self>Lock Wanted Level",
            "Vehicle>Indestructible",
            "Vehicle>Permanent Mint Condition",
            "Self>Weapons>No Spread",
            "Self>Weapons>No Recoil",
        },
        script = {},
        pvp = {
            "Self>Weapons>Infinite Ammo",
            "Self>Lock Wanted Level",
            "Self>Weapons>No Spread",
            "Self>Weapons>No Recoil",
            lua_path..">"..Translate("Self")..">"..Translate("Weapons")..">"..Translate("Thermal Scope"),
            lua_path..">"..Translate("Self")..">"..Translate("Auto Armor after Death"),
        },
    }

    --===============--
    -- Self
    --===============--

        -- movement

            local levitation_mode = self:list(Translate("Levitation Mode"))

            levitation_mode:action(Translate("Stand Default"),{},Translate("Default Stand levitation with up and down forces."),function()
                    Commands("levitatepassivemin 0")
                    Commands("levitatepassivemax 0.6")
                    Commands("levitatepassivespeed 5")
                    Commands("levitateassistup 0.6")
                    Commands("levitateassistdown 0.6")
                    Commands("levitateassistdeadzone 13")
                    Commands("levitateassistsnap 0.1")
                    Notify(Translate("Levitation Mode").." "..Translate("Stand Default"))
            end)

            levitation_mode:action(Translate("No Clip"),{},Translate("Levitation without any weird forces on you."),function()
                Commands("levitatepassivemin 0")
                Commands("levitatepassivemax 0")
                Commands("levitatepassivespeed 0")
                Commands("levitateassistup 0")
                Commands("levitateassistdown 0")
                Commands("levitateassistdeadzone 0")
                Commands("levitateassistsnap 0")
                Notify(Translate("Levitation Mode").." "..Translate("No Clip"))
            end)

        -- weapons

            local weaponm = self:list(Translate("Weapons"))

            local thermal_command = menu.ref_by_path('Game>Rendering>Thermal Vision')
            weaponm:toggle_loop(Translate("Thermal Scope"),{},Translate("Press E while aiming to activate."),function()
                local aiming = PLAYER.IS_PLAYER_FREE_AIMING(players.user())
                if GRAPHICS.GET_USINGSEETHROUGH() and not aiming then
                    menu.trigger_command(thermal_command,'off')
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
                elseif PAD.IS_CONTROL_JUST_PRESSED(38,38) then
                    if menu.get_value(thermal_command) or not aiming then
                        menu.trigger_command(thermal_command,"off")
                        GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
                    else
                        menu.trigger_command(thermal_command,"on")
                        GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(50)
                    end
                end
            end)

        -- features

            local regen_all = self:action(Translate("Refill Health & Armor"),{},Translate("Regenerate to max your health and armor."),function()
                ENTITY.SET_ENTITY_HEALTH(players.user_ped(),ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()))
                PED.SET_PED_ARMOUR(players.user_ped(),PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
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

            table.insert(setup["script"],self:toggle(Translate("Always Clean"),{},Translate("Keep your ped dry and clean."),function(on)
                util.yield()
                on = GetOn(on)
                Commands("lockwetness "..on)
                Commands("noblood "..on)
                Commands("wetness 0")
            end))

    --===============--
    -- Vehicle
    --===============--

        util.create_tick_handler(function()
            if players.get_vehicle_model(players.user()) ~= 0 then
                vec = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(),false)
            else
                vec = 0
            end
        end)

        -- drift

            local drift = vehicle:list(Translate("Drift"),{},"")

            get_heading = function(vec)
                local v = ENTITY.GET_ENTITY_VELOCITY(vec)
                return math.fmod(270 + math.deg(math.atan(v.y,v.x)),360)
            end

            local get_angle = function(vec)
                local angle = 360 - math.fmod(ENTITY._GET_ENTITY_PHYSICS_HEADING(vec) - get_heading(vec) + 360,360)
                if angle > 180 then
                    angle = 0 - (360 - angle)
                end
                return math.floor(angle+0.5)
            end

            local drift_assist = true
            local drift_assist_value = 50

            -- inpired by 2t1 drift script
            drift:toggle_loop(Translate("Drift"),{},Translate("Press SHIFT to drift."),function()
                if vec then
                    if PAD.IS_CONTROL_PRESSED(21,21) and (ENTITY.GET_ENTITY_SPEED(vec)*3.6) >= 8 then
                        if (VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(vec) and not ENTITY.IS_ENTITY_IN_AIR(vec)) then
                            ENTITY.APPLY_FORCE_TO_ENTITY(vec,1,0,0,-0.3*PAD.GET_CONTROL_NORMAL(2,72),0,0,0,true,true)
                        end
                        local drift_angle = get_angle(vec)
                        VEHICLE.SET_VEHICLE_REDUCE_GRIP(vec,true)
                        if drift_assist and math.abs(drift_angle) > drift_assist_value then
                            VEHICLE.SET_VEHICLE_STEER_BIAS(vec,math.rad(drift_angle*0.69))
                            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vec,false)
                        end
                    else
                        VEHICLE.SET_VEHICLE_REDUCE_GRIP(vec,false)
                    end
                end
            end,function()
                if vec then
                    VEHICLE.SET_VEHICLE_REDUCE_GRIP(vec,false)
                end
            end)

            drift:toggle(Translate("Counter Steering Assist"),{},Translate("Helps you so you don't do 360."),function(on)
                drift_assist = on
            end,drift_assist)

            drift:slider(Translate("Counter Steering Angle"),{""},Translate("Your drift angle can't be higher than this value."),30,90,drift_assist_value,1,function(val)
                drift_assist_value = val
            end)

        -- features

            vehicle:toggle(Translate("Launch Control"),{},Translate("Prevents the car from burning when starting to drive away faster."),function(on)
                PHYSICS._SET_LAUNCH_CONTROL_ENABLED(on)
            end)
    
    --===============--
    -- Online
    --===============--

        -- session

            local session = online:list(Translate("Session"))
            local session_bouty = session:list(Translate("Bounty"))

            local bounty_include_self = true
            local session_bounty_amount = 10000
            session_bouty:toggle_loop(Translate("Auto Bounty"),{},Translate("Loop offer bounty on everyone."),function()
                for _,pid in pairs(players.list(bounty_include_self)) do
                    if InSession() and players.get_bounty(pid) ~= session_bounty_amount and players.get_name(pid) ~= "UndiscoveredPlayer" then
                        Commands("bounty"..players.get_name(pid).." "..session_bounty_amount)
                    end
                    util.yield(150)
                end
                util.yield(5000)
            end)

            session_bouty:slider(Translate("Bounty Amount"),{"mehautobountyamount"},Translate("Chose the amount of the bounty offered automatically."),1,10000,10000,1000,function(amount)
                session_bounty_amount = amount
            end)

            session_bouty:toggle(Translate("Exclude Self"),{},Translate("Bounty will not be offered on yourself."),function(on)
                bounty_include_self = on == false
            end)

            table.insert(setup["script"],session:toggle(Translate("Spoof Session Informations"),{},Translate("Spoof your session informations so nobody can join you from your R* profile."),function(on)
                if on then
                    Commands("spoofsession storymode")
                    ClickPath("Online>Spoofing>Session Spoofing>Session Type>Invalid")
                else
                    Commands("spoofsession off")
                    ClickPath("Online>Spoofing>Session Spoofing>Session Type>Not Spoofed")
                end
            end))

            Kick = function(pid)
                local name = players.get_name(pid)
                if players.exists(pid) then
                    Commands("loveletterkick"..name)
                end
                util.yield(50)
                if players.exists(pid) then
                    Commands("kick"..name)
                end
            end

            local kick_tryhard
            CheckTryhard = function(pid)
                if pid ~= players.user() and kick_tryhard then
                    local name = players.get_name(pid)
                    local char_count = 0
                    for i = 1,#name do
                        local char = name:sub(i,i)
                        if char == "l" or char == "I" or char == "i" or char == "L" or char == "x" or char == "X" or char == "-" then
                            char_count = char_count + 1
                        end
                    end
                    if (char_count / #name) >= 0.9 then
                        if notifications_enabled then
                            Notify(Translate("Attempt to kick ")..name.."\n"..Translate("Reason: Tryhard Name"))
                        end
                        while players.exists(pid) do
                            Kick(pid)
                            util.yield(4000)
                        end
                    end
                end
            end 

            session:toggle(Translate("Auto Kick Tryhard"),{},Translate("Kick all tryhard players.\nThings like: ").."IllIlIllI, XXX-XXXX-III",function(on)
                kick_tryhard = on
                if on then
                    for _,pid in pairs(players.list()) do
                        CheckTryhard(pid)
                    end
                end
            end)

            become_host = session:action(Translate("Become Host"),{},Translate("Kick players until you become host."),function(type)
                menu.show_warning(become_host, type, Translate("Warning: You are about to kick players until you become host. Are you sure ?"), function()
                    if InSession() then
                        while players.get_host() ~= players.user() do
                            Kick(players.get_host())
                            util.yield(50)
                        end
                        Notify(Translate("You Are Host."))
                    end
                end)
            end)

        -- features

            online:toggle_loop(Translate("Disable RP Gain"),{},Translate("You will not gain any RP."),function()
                memory.write_float(memory.script_global(262146),0)
            end,function()
                memory.write_float(memory.script_global(262146),1)
            end)

            local max_health
            undead_otr = online:toggle(Translate("Undead OTR"),{},Translate("Turn you off the radar without notifying other players.\nNote: Trigger Modded Health detection."),function(on)
                if on then
                    max_health = ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped())
                    while menu.get_state(undead_otr) == "On" do
                        if ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) ~= 0 then
                            ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),0)
                        end
                        util.yield()
                    end
                else
                    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),max_health)
                end
            end)

            online:action(Translate("Stop Spectating"),{},Translate("If you are spectating a player,it will stop to spectate him."),function()
                if #player_spectate ~= 0 then
                    Commands("mehspectate"..player_spectate[1].." off")
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
                menu.set_value(menu.ref_by_path('World>Aesthetic Light>Aesthetic Light'),false)
            end


            local rendering = game:list(Translate("Rendering"))
            rendering:action(Translate("Default"),{},"",function()
                ResetRendering()
            end)

            rendering:action(Translate("Clear View"),{},Translate("Lock time to noon, without clouds."),function()
                ResetRendering()
                Commands("locktime on")
                Commands("timesmoothing off")
                Commands("time 12")
                Commands("clouds stratoscumulus")
                Commands("weather extrasunny")
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

    --===============--
    -- Stand
    --===============--

        -- protections

            local protection = {
                regular = { -- on = 4
                    "Online>Protections>Events>Crash Event",
                    "Online>Protections>Events>Kick Event",
                },

                ultimate = { -- on = 4
                    "Online>Protections>Syncs>Invalid Model Sync",
                    "Online>Protections>Syncs>World Object Sync",
                    "Online>Protections>Syncs>Cage",
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
                    "Online>Protections>Events>Modded Event",
                    "Online>Protections>Events>CEO/MC Kick",
                    "Online>Protections>Events>CEO/MC Kick (Not My Boss)",
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

                special = { -- on = 3
                    "Online>Protections>Events>Infinite Phone Ringing",
                    "Online>Protections>Events>Vehicle Takeover",
                    "Online>Protections>Events>Freeze",
                    "Online>Protections>Events>Love Letter Kick Blocking Event",
                    "Online>Protections>Events>Raw Network Events>PTFX",
                    "Online>Protections>Events>Raw Network Events>Remove All Weapons Event",
                    "Online>Protections>Events>Raw Network Events>Remove Weapon Event",
                    "Online>Protections>Events>Raw Network Events>Give Weapon Event",
                    "Online>Protections>Events>Love Letter Kick Blocking Event",
                    "Online>Reactions>Love Letter Kick Reactions",
                }
            }

            SetProtectionsToggle = function(on,mode)
                for _,path in pairs(protection[mode]) do
                    SetPathVal(path..">Block",on)
                    if protections_log and on ~= 0 then
                        SetPathVal(path..">Write To Log File",3)
                        SetPathVal(path..">Write To Console",3)
                    else
                        SetPathVal(path..">Write To Log File",0)
                        SetPathVal(path..">Write To Console",0)
                    end
                    if protections_notification and on ~= 0 then
                        SetPathVal(path..">Notification",3)
                    else
                        SetPathVal(path..">Notification",0)
                    end
                end
                local special_on = 0
                if mode == "ultimate" and on ~= 0 then
                    special_on = 2
                end
                SetProtectionsToggleSpecial(special_on)
            end

            SetProtectionsToggleSpecial = function(on)
                for _,path in pairs(protection["special"]) do
                    SetPathVal(path..">Block",on)
                    if protections_log and on ~= 0 then
                        SetPathVal(path..">Write To Log File",2)
                        SetPathVal(path..">Write To Console",2)
                    else
                        SetPathVal(path..">Write To Log File",0)
                        SetPathVal(path..">Write To Console",0)
                    end
                    if protections_notification and on ~= 0 then
                        SetPathVal(path..">Notification",2)
                    else
                        SetPathVal(path..">Notification",0)
                    end
                end
            end

            SetProtections = function(mode,state)
                local add_state = false
                local log_on = protections_log
                local notification_on = protections_notification
                if state then
                    SetProtectionsToggle(2,mode)
                    add_state = true
                else
                    log_on = false
                    notification_on = false
                    SetProtectionsToggle(0,mode)
                end
                for _,path in pairs(protection["additional"]) do
                    SetPathVal(path,add_state)
                end
                for _,path in pairs(protection["additional_log"]) do
                    SetPathVal(path,log_on)
                end
                for _,path in pairs(protection["additional_notif"]) do
                    SetPathVal(path,notification_on)
                end
            end

            Protections = function(str)
                if str == "Regular" then
                    Commands("novotekicks sctv")
                    SetProtections("ultimate",false)
                    SetProtections("regular",true)
                elseif str == "Ultimate" then
                    Commands("novotekicks sctv")
                    SetProtections("regular",true)
                    SetProtections("ultimate",true)
                elseif str == "None" then
                    Commands("novotekicks off")
                    SetProtections("regular",false)
                    SetProtections("ultimate",false)
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
            end,true)

            protections_notification = true
            protectionm:toggle(Translate("Notifications"),{},"",function(on)
                util.yield()
                protections_notification = on
            end,true)

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
                SetupOff(mode)
                if mode == "gigachad" then
                    for _,path in pairs(setup["gigachad"]) do
                        SetPathVal(path,true)
                    end
                    for _,ref in pairs(setup["script"]) do
                        menu.set_value(ref,true)
                    end
                elseif mode == "pvp" then
                    for _,path in pairs(setup["pvp"]) do
                        SetPathVal(path,true)
                    end
                    menu.trigger_command(regen_all)
                end
            end

            SetupOff = function(mode)
                if mode ~= "gigachad" then
                    for _,path in pairs(setup["gigachad"]) do
                        SetPathVal(path,false)
                    end
                    for _,ref in pairs(setup["script"]) do
                        menu.set_value(ref,false)
                    end
                end
                if mode ~= "pvp" then
                    for _,path in pairs(setup["pvp"]) do
                        SetPathVal(path,false)
                    end
                end
            end

            local setupm = stand:list(Translate("Setup"))

            setupm:action(Translate("Job & Heists"),{},Translate("Everything is turned off,you are now 'legit'."),function()
                Setup("job")
                if notifications_enabled then
                    Notify(Translate("Setup").." "..Translate("Job & Heists"))
                end
            end)

            setupm:action(Translate("Fight"),{},Translate("Turn on Infinite Ammo,Never Wanted,No Recoil,No Spread and Thermal Scope."),function()
                Setup("pvp")
                if notifications_enabled then
                    Notify(Translate("Setup").." "..Translate("Fight"))
                end
            end)

            setupm:action(Translate("Gigachad"),{},Translate("Turn on all useful features so nobody can disturb you."),function()
                Setup("gigachad")
                if notifications_enabled then
                    Notify(Translate("Setup").." "..Translate("Gigachad"))
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
            end,true)

            if menu.get_value(notifications_toggle) then
                notifications_enabled = true
            end

        -- about

            misc:divider(Translate("About"))
            misc:action(Translate("Version").." "..version,{},"",function() end)

            -- credits

                local credits = misc:list(Translate("Credits"))
                credits:divider("Akatozi.#4991")

            -- links

                misc:hyperlink(Translate("Join Discord"),"https://discord.gg/uUNRn6xgw5")
                misc:hyperlink("Github","https://github.com/akat0zi/mehScript")

        main:hyperlink(Translate("Join Discord"),"https://discord.gg/uUNRn6xgw5")

    if not SCRIPT_SILENT_START and SCRIPT_MANUAL_START then
        Notify(Translate("Hey, don't hesitate to join the discord !"))
    end 

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
        }
    }

    player_spectate = {}

    Crash = function(pid,name)
        for _,cmd in pairs(attack["crash"]) do
            if players.get_name(pid) == name then
                Commands(cmd..name)
            end
            util.yield(100)
        end
    end

    PlayerMenu = function(pid)
        local player = menu.player_root(pid)
        local player_name = players.get_name(pid)
        player:divider("mehScript")

        -- griefing

            local griefing = player:list(Translate("Griefing"),{},"")

            local bounty = griefing:list(Translate("Bounty"),{},"")
            local bounty_amount = 10000
            bounty:toggle_loop(Translate("Auto Bounty"),{""},Translate("Loop that place a bounty on the player."),function()
                if InSession() then
                    if players.get_bounty(pid) ~= bounty_amount then
                        Commands("bounty"..player_name.." "..bounty_amount)
                    end
                end
                util.yield(1000)
            end)

            bounty:slider(Translate("Bounty Amount"),{"mehbountyamount"},Translate("Chose the amount of the bounty offered automatically."),1,10000,10000,1000,function(amount)
                bounty_amount = amount
            end)

            griefing:toggle(Translate("Ghost Mode"),{},Translate("The player can't shoot you anymore,same for you."),function(on)
                NETWORK._SET_RELATIONSHIP_TO_PLAYER(pid,on)
            end)

            griefing:toggle_loop(Translate("Freeze"),{},Translate("Better than the Stand one."),function()
                if players.exists(pid) then
                    util.trigger_script_event(1 << pid,{0x4868BC31,pid,0,0,0,0,0}) -- credits to jinx
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                    Commands("freeze"..player_name.." on")
                end
                util.yield()
            end,function()
                if players.exists(pid) then
                    Commands("freeze"..player_name.." off")
                end
            end)

        -- attack

            local attack = player:list(Translate("Attack"),{},"")

            local kick = attack:list(Translate("Kick"))
            local kick_message = ""

            kick:action(Translate("Kick Player"),{},"",function()
                Notify(Translate("Attempt to Kick ")..player_name)
                if kick_message ~= "" then
                    local bpcharacter_def = GetPathVal("Online>Chat>Bypass Character Filter")
                    local bpprofanity_def = GetPathVal("Online>Chat>Bypass Profanity Filter")
                    SetPathVal("Online>Chat>Bypass Character Filter",true)
                    SetPathVal("Online>Chat>Bypass Profanity Filter",true)
                    util.yield()
                    Commands("sendpm"..player_name.." "..kick_message)
                    util.yield()
                    SetPathVal("Online>Chat>Bypass Character Filter",bpcharacter_def)
                    SetPathVal("Online>Chat>Bypass Profanity Filter",bpprofanity_def)
                end
                util.yield()
                Kick(pid)
            end)

            GetOrgMembers = function(pid)
                local organisation_index = memory.read_int(memory.script_global(1894573 + 1 + (pid * 608) + 10)) -- thanks to MusinessBanager devs for the memory address
                local org_members = {}
                if organisation_index ~= -1 then
                    for _,pid2 in pairs(players.list()) do
                        if memory.read_int(memory.script_global(1894573 + 1 + (pid2 * 608) + 10)) == organisation_index then
                            table.insert(org_members,pid2)
                        end
                    end
                else
                    table.insert(org_members,pid)
                end
                return org_members
            end

            kick:action(Translate("Kick Organisation"),{},Translate("Kick all organisation members."),function()
                org_members = GetOrgMembers(pid)
                if #org_members > 1 then
                    Notify(Translate("Attempt to Kick ")..player_name.."'s"..Translate(" organisation."))
                else
                    Notify(Translate("Attempt to Kick ")..player_name)
                end
                for _,player_to_kick in pairs(org_members) do
                    if player_to_kick ~= players.user() then
                        if kick_message ~= "" then
                            local bpcharacter_def = GetPathVal("Online>Chat>Bypass Character Filter")
                            local bpprofanity_def = GetPathVal("Online>Chat>Bypass Profanity Filter")
                            SetPathVal("Online>Chat>Bypass Character Filter",true)
                            SetPathVal("Online>Chat>Bypass Profanity Filter",true)
                            util.yield(10)
                            Commands("sendpm"..players.get_name(player_to_kick).." "..kick_message)
                            util.yield()
                            SetPathVal("Online>Chat>Bypass Character Filter",bpcharacter_def)
                            SetPathVal("Online>Chat>Bypass Profanity Filter",bpprofanity_def)
                        end
                        Kick(player_to_kick)
                    end
                end
            end)

            kick:text_input(Translate("Kick Message"),{"mehkickmessage"},Translate("Will send a private chat message to the player when kicking him."),function(str) 
                kick_message = str
            end)

            local preset_kick_message_table = {"Stand On Top !","Taste the GIGACHAD power !","Can't Beat Kiddion's VIP Menu","10$ Stand > 120$ VIP 2TAKE1","A femboy is a slang term for a young, usually cisgender male who displays traditionally feminine characteristics. While the term can be used as an insult, some in the LGBTQ community use the term positively to name forms of gender."}
            kick:list_action(Translate("Preset Message"),{},"",preset_kick_message_table,function(i)
                Commands("mehkickmessage"..player_name.." "..preset_kick_message_table[i])
            end)

            local crash = attack:list(Translate("Crash"))

            crash:action(Translate("Crash Player"),{},"",function()
                Notify(Translate("Attempt to Crash ")..player_name)
                Crash(pid, player_name)
            end)

            crash:action(Translate("Crash Organisation"),{},Translate("Crash all organisation members."),function()
                org_members = GetOrgMembers(pid)
                if #org_members > 1 then
                    Notify(Translate("Attempt to Crash ")..player_name..Translate(" organisation."))
                else
                    Notify(Translate("Attempt to Crash ")..player_name)
                end
                for _,player_to_crash in pairs(org_members) do
                    if player_to_crash ~= players.user() then
                        Crash(player_to_crash, players.get_name(player_to_crash))
                    end
                end
            end)

            attack:action(Translate("Nuke Button"),{},Translate("Take all risks to remove him.\nNote: You may be karma."),function()
                Notify(Translate("Nuke on ")..player_name)
                Crash(pid, player_name)
                util.yield(2000)
                Kick(pid)
            end)

            player:toggle(Translate("Spectate"),{"mehspectate"},"",function(on)
                if on then
                    if #player_spectate ~= 0 then
                        Commands("mehspectate"..player_spectate[1].." off")
                    end
                    table.insert(player_spectate,player_name)
                    Commands("spectate"..player_name.." on")
                else
                    if players.exists(pid) then
                        Commands("spectate"..player_spectate[1].." off")
                    end
                    table.remove(player_spectate,1)
                end
            end)
    end

    players.on_join(PlayerMenu)
    players.on_join(CheckTryhard)
    players.dispatch_on_join()
