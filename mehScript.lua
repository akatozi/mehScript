local version = "0.88"
util.keep_running()
util.require_natives(1672190175)

--===============--
-- Core Functions
--===============--

    local GetOn = function(on) if on then return "on" else return "off" end end
    local InSession = function() return util.is_session_started() and not util.is_session_transition_active() end
    local SetPathVal = function(path,state) local path_ref = menu.ref_by_path(path) if menu.is_ref_valid(path_ref) then menu.set_value(path_ref,state) else util.toast("invalid : "..path,TOAST_CONSOLE) end end
    local ClickPath = function(path) local path_ref = menu.ref_by_path(path) if menu.is_ref_valid(path_ref) then menu.trigger_command(path_ref) else util.toast("invalid : "..path,TOAST_CONSOLE) end end
    local Notify = function(str,translate=true) if notifications_enabled or update_available then if translate then str = Tr(str) end if notifications_mode == 2 then util.show_corner_help("~p~mehScript~s~~n~"..str ) else util.toast("> mehScript \n"..str) end end end

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
            util.toast("> mehScript\nSorry your language isn't supported. Script language set to English.")
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
            ["Attempt to kick "] = "Essai d'éjecter ",
            ["Crash"] = "Crash",
            ["Attempt to crash "] = "Essai de crash ",
            ["Nuke Button"] = "Boutton Nucléaire",
            ["Nuke on "] = "Suppression de ",
            ["Spectate"] = "Observer",
            ["Self"] = "Soi",
            ["Movement"] = "Mouvement",
            ["Levitation Mode"] = "Mode de Lévitation",
            ["No Clip"] = "No Clip",
            ["Stand Default"] = "Stand par Défaut",
            ["Always Clean"] = "Toujours Propre",
            ["Weapons"] = "Armes",
            ["Thermal Scope"] = "Lunette Thermique",
            ["Refill Health & Armor"] = "Regénérer Vie et Armure",
            ["Auto Armor after Death"] = "Armure Après Mort",
            ["Online"] = "En-ligne",
            ["Normal"] = "Normales",
            ["Best"] = "Meilleures",
            ["Profile"] = "Profil",
            ["Disable RP Gain"] = "Désactiver Gain de RP",
            ["Job"] = "Activité",
            ["Rockstar Admin"] = "Rockstar Admin",
            ["Protections"] = "Protections",
            ["Game"] = "Jeu",
            ["Rendering"] = "Rendu",
            ["Clear Day"] = "Jour Dégagé",
            ["Clear Night"] = "Nuit Dégagée",
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
            ["Prevents the car from burnout when starting to drive away faster."] = "Empêche la voiture de patiner au démarrage pour aller plus vite.",
            ["Stop Spectating"] = "Arrêter d'Observer",
            ["If you are spectating a player,it will stop to spectate him."] = "Si vous observez un joueur,cela va arrêter de l'observer.",
            ["Drift"] = "Drift",
            ["Press SHIFT to drift."] = "Appuis sur MAJ pour drifter.",
            ["Counter Steering Assist"] = "Assistance Contre-Braquage",
            ["Helps you so you don't do 360."] = "Empêche de faire des 360.",
            ["Counter Steering Angle"] = "Angle Contre-Braquage",
            ["Your drift angle can't be higher than this value."] = "L'angle de drift ne peut pas être plus grand que cette valeur.",
            [" organisation."] = " organisation.",
            ["Kick Organisation"] = "Exclure l'Organisation",
            ["Kick all organisation members."] = "Exclu tous les membres de l'organisation.",
            ["Crash Player"] = "Crash le Joueur",
            ["Crash Organisation"] = "Crash l'Organisation",
            ["Crash all organisation members."] = "Crash tous les membres de l'organisation.",
            ["Will send a private chat message to the player when kicking him."] = "Envoi un message privé au joueur en l'éjectant.",
            ["Kick Message"] = "Message d'Exclusion",
            ["Turn on all useful features so nobody can disturb you."] = "Active toutes les fonctionnalités utiles pour que personne ne t'embête.",
            ["Turn on Infinite Ammo, Never Wanted, No Recoil, No Spread and Thermal Scope."] = "Active Munitions Infinies, Jamais Recherché, Pas de Recul, Pas de Dispertion et Lunette Thermique.",
            ["Everything is turned off, you are now 'legit'."] = "Tout est désactivé,tu es 'legit'.",
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
            ["Reason: Tryhard K/D"] = "Raison: Ratio de Tryhard",
            ["Warning: You are about to kick around"] = "Attention: Tu es va exclure environ",
            ["players until you become host. Are you sure ?"] = "joueurs pour être l'hôte. Es-tu sûr ?",
            ["You are host."] = "Tu es hôte.",
            ["Kick players until you become host."] = "Exclu des joueurs jusqu'à que tu sois hôte.",
            ["Become Host"] = "Devenir Hôte",
            ["Become Script Host"] = "Devenir Hôte de Script",
            ["Always Clear Weather"] = "Météo Toujours Dégagée",
            ["Add Block Join Reaction"] = "Ajouter la Réaction Bloquer Entrée",
            ["When removing the player, it'll add him the block join reaction so he will never join you again."] = "En retirant le joueur, cela lui ajoute la réaction bloquer l'entrée pour qu'il ne puisse plus jamais vous rejoindre.",
            ["Force clear weather.\nNote: It avoids the snow visual glitch in transitions."] = "Force la météo dégagée.\nNote: Cela empêche le bug visuel de la neige pendant les transtions.",
            ["Undetected"] = "Indétectable",
            ["Similar to Rockstar Admin but without the features that can trigger modder detections."] = "Similaire à Rockstar Admin mais sans les options pouvant déclencher des détections de modder.",
            ["Apply Recommended Profile"] = "Appliquer Profil Recommandé",
            ["Recommended Profile Applied."] = "Profil Recommandé Appliqué.",
            ["Will apply recommended profile.\nMake sure to have a backup of your profile."] = "Va appliquer le profil recommandé.\nFaîtes attention de bien avoir une sauvegarde de votre profil.",
			["Auto Accept Warning"] = "Accepte Auto. Avertissements",
            ["Aimbot"] = "Aimbot",
            ["FOV"] = "FOV",
            ["Target Settings"] = "Paramètres Cible",
            ["Friends"] = "Amis",
            ["Weapon Damage %"] = "Pourcentage de Dégâts d'Arme",
            ["Display Target"] = "Marquer Cible",
            ["Godmode Player"] = "Joueur Invincible",
            ["Inside Vehicle"] = "Dans un Véhicule",
            ["Hard (Karma)"] = "Enervé (Karma)",
            ["Safe (Detectable)"] = "Sûr (Detectable)",
            ["Add the date and hour as note to all players in the current session. If used couple time in the same session, players new players will have the same note as the first time you used it.\nNote: Somehow hour may be 10 min off."] = "Ajoute la date et l'heure en Note aux joueurs. Si utilisé plusieurs fois dans la même session, les nouveaux joueurs auront la même Note que la première fois où vous l'avez utilisé.\nNote: Bizarrement l'heure peut être décalée de 10 min.",
            ["Save All Players"] = "Sauvegarder les Joueurs",
            ["Failed to load the news message."] = "Impossible de charger le message des actus.",
            ["News Message"] = "Message d'Actualités",
            ["Smart BST"] = "TBS Intelligente",
            ["Auto enable BST when you have weapon in hands."] = "Active automatiquement la TBS quand vous avez une arme.",
            ["Protections Settings"] = "Réglages des Protections",
            ["Profile Features"] = "Fonctionnalités du Profil",
            ["Invisible to Thermal Scope"] = "Invisible pour Lunette Thermique",
            ["Dead Silence"] = "Silence de Mort",
            ["Profiles"] = "Profils",
            ["Block Join Reaction Added to "] = "Réaction Bloquer Entrée Ajoutée à",
            ["Profile Editor"] = "Editeur de Profil",
            ["Refresh"] = "Rafraîchir",
            ["Features From Profile "] = "Options du Profil ",
            ["Appearance From Profile "] = "Apparence du Profil ",
            ["Lua Settings From Profile "] = "Réglages Lua du Profil ",
            ["Save Custom Profile"] = "Sauvegarder Profil Personnalisé",
            [" profile saved !"] = " profil sauvegardé !",
            ["Your Profiles"] = "Vos Profils",
            ["Import"] = "Importer",
            ["Select Features"] = "Sélectionner Options",
            ["Select Appearance"] = "Sélectionner Apparence",
            ["Select Lua Settings"] = "Sélectionner Réglages Lua",
            ["No lua settings found in this profile !"] = "Pas de réglages lua trouvés dans le profil !",
            [" selected !"] = " sélectionné !",
            ["Features From : "] = "Options de : ",
            ["Appearance From : "] = "Apparence de : ",
            ["Lua Settings From : "] = "Réglages Lua de : ",
            ["Program is running wait a few seconds then retry."] = "Le programme est en fonctionnement, patientez quelque secondes et recommencez.",
            ["Profile Editor Shortcut"] = "Raccourci vers Editeur de Profil",
            ["Profile Menu Shortcut"] = "Raccourci vers Menu Profils",
            ["Explaination"] = "Expliquations",
            ["Load and Save"] = "Charger et Sauvegarder",
            ["Save Profile"] = "Sauvegarder Profil",
            ["Load Profile"] = "Charger Profil",
            [" profile loaded !"] = " profil chargé !",
            ["This player left the session."] = "Le joueur a quitté la session.",
            ["Session timeout."] = "Délai dépassé.",
            ["High value may result in focusing wrong target."] = "Des valeurs élevées peuvent cibler la mauvaise cible.",
            ["Area to Shoot"] = "Zones à Toucher",
            ["If you select several options, it will chose one randomly everytime you shoot."] = "Si plusieurs options sont sélectionnées, à chaque tir une zone au hasard sera choisis.",
            ["Head"] = "Tête",
            ["Chest"] = "Torse",
            ["Pelvis"] = "Bassin",
            ["Through Walls Settings"] = "Options à Travers le Mur",
            ["Shoot Through Walls"] = "Tirer à Traver le Mur",
            ["ESP When Behind Walls"] = "ESP Quand Derrière un Mur",
            ["Works only if Shoot Through Walls is enabled."] = "Fonctionne seulement si Tirer à Traver le Mur est activé.",
            ["Aimbot : No area selected !"] = "Aimbot : Pas de zone sélectionnée !",
            ["Players"] = "Joueurs",
            ["NPCS"] = "PNJ",
            ["You are already in the session."] = "Vous êtes déjà dans la session.",
            ["Should take less than 10 sec !"] = "Ca devrait prendre moins de 10 sec !",
            ["Fully Invisible"] = "Complètement Invisible",
            ["Tactical Nuke"] = "Bombe Nucléaire",
            ["Send Tactical Nuke"] = "Lancer Bombe Nucléaire",
            ["Say Who Sent it"] = "Dit qui l'a Lancé",
            ["Nuke Height"] = "Hauteur Explosion",
            ["is godmode."] = "est invincible.",
            ["is in interior."] = "est en intérieur.",
            ["Tactical nuke incoming !"] = "Bombe nucléaire en approche !",
            ["You may be detected by other modders and karma !"] = "Tu risques d'être détecté par les modders et être karma"
        }
    }

    Tr = function(str)
        if not english then
            local translated_str = translation_table[user_lang][str]
            if translated_str == nil or translated_str == "" then
                util.toast("> mehscript (translation missing) : '"..str.."'",TOAST_CONSOLE)
            else
                return translated_str
            end
        end
        return str
    end

--===============--
-- Roots
--===============--

    local main = menu.my_root()
    local self = main:list(Tr("Self"))
    local vehicle = main:list(Tr("Vehicle"))
    local online = main:list(Tr("Online"))
    local protection = main:list(Tr("Protections"))
    local profile = main:list(Tr("Profiles"))
    local game = main:list(Tr("Game"))
    local misc = main:list(Tr("Misc"))

--===============--
-- Update
--===============--

    local update_available
    async_http.init("raw.githubusercontent.com","/akat0zi/mehScript/main/mehScript.lua",function(online_script)
        if select(2,load(online_script)) then
            Notify("Script failed to check for update. Please try again later. If this continues to happen then manually update via github.")
            return
        end
        local latest_version = online_script:match("^local%s+version%s*=%s*\"(%d+%.%d+)\"")
        if tonumber(version) < tonumber(latest_version) then
            update_available = true
            Notify(Tr("Version").." "..string.gsub(latest_version,"\n","",1).." "..Tr("available.\nPress Update to get it."),false)
            update_button = menu.action(menu.my_root(),Tr("Update to").." "..latest_version,{},"",function()
                local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH,"wb")
                f:write(online_script)
                f:close()
                util.restart_script()
            end)
            menu.attach_before(self,menu.detach(update_button))
        elseif tonumber(version) > tonumber(latest_version) then
            dev_build = main:divider("Unreleased Version",{},"",function() end)
            menu.attach_before(self,menu.detach(dev_build))
        end
    end)
    async_http.dispatch()

--===============--
-- Main
--===============--

    --===============--
    -- Setup
    --===============--

        main:hyperlink(Tr("Join Discord"),"https://discord.gg/uUNRn6xgw5")

        local stand_edition = menu.get_edition()
        local lua_path = "Stand>Lua Scripts>"..string.gsub(string.gsub(SCRIPT_RELPATH,".lua",""),"\\",">")

        local profiles = {
            rockstar_admin = {
                "Self>Immortality",
                "Vehicle>Indestructible",
                "Vehicle>Permanent Mint Condition",
            },

            undetected = {
                "Self>Weapons>Infinite Ammo",
                "Self>Gracefulness",
                "Self>Glued To Seats",
                "Self>Lock Wanted Level",
                "Self>Weapons>No Spread",
                "Self>Weapons>No Recoil",
                "Self>Infinite Stamina",
                "Vehicle>Can't Be Locked On",
                "Online>Reveal Off The Radar Players",
                "Online>Reveal Invisible Players",
            },

            fight = {
                lua_path..">"..Tr("Self")..">"..Tr("Weapons")..">"..Tr("Thermal Scope"),
                lua_path..">"..Tr("Self")..">"..Tr("Auto Armor after Death"),
                lua_path..">"..Tr("Self")..">"..Tr("Dead Silence"),
            },

            script = {},
        }

    --===============--
    -- Self
    --===============--

        -- movement

            local levitation_mode = self:list(Tr("Levitation Mode"))

            levitation_mode:action(Tr("Stand Default"),{},Tr("Default Stand levitation with up and down forces."),function()
                    menu.trigger_commands("levitatepassivemin 0")
                    menu.trigger_commands("levitatepassivemax 0.6")
                    menu.trigger_commands("levitatepassivespeed 5")
                    menu.trigger_commands("levitateassistup 0.6")
                    menu.trigger_commands("levitateassistdown 0.6")
                    menu.trigger_commands("levitateassistdeadzone 13")
                    menu.trigger_commands("levitateassistsnap 0.1")
                    Notify(Tr("Levitation Mode").." : "..Tr("Stand Default"),false)
            end)

            levitation_mode:action(Tr("No Clip"),{},Tr("Levitation without any weird forces on you."),function()
                menu.trigger_commands("levitatepassivemin 0")
                menu.trigger_commands("levitatepassivemax 0")
                menu.trigger_commands("levitatepassivespeed 0")
                menu.trigger_commands("levitateassistup 0")
                menu.trigger_commands("levitateassistdown 0")
                menu.trigger_commands("levitateassistdeadzone 0")
                menu.trigger_commands("levitateassistsnap 0")
                Notify(Tr("Levitation Mode").." : "..Tr("No Clip"),false)
            end)

        -- weapons

            local weaponm = self:list(Tr("Weapons"))

            local aimbot = weaponm:list(Tr("Aimbot"))

                -- Original made by Lance but improved a lot by myself
                handle_ptr = memory.alloc(13*8)
                local function pid_to_handle(pid)
                    NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
                    return handle_ptr
                end

                local function get_aimbot_target()
                    local cur_tar = 0
                    for k,v in pairs(entities.get_all_peds_as_handles()) do
                        local target_this = true
                        local player_pos = players.get_position(players.user())
                        local ped_pos = ENTITY.GET_ENTITY_COORDS(v, true)
                        if players.user_ped() ~= v and not ENTITY.IS_ENTITY_DEAD(v) then
                            if MISC.GET_DISTANCE_BETWEEN_COORDS(player_pos.x, player_pos.y, player_pos.z, ped_pos.x, ped_pos.y, ped_pos.z, true) <= 1500 then
                                if not PED.IS_PED_FACING_PED(players.user_ped(), v, aimbot_fov) then
                                    target_this = false
                                    if aimbot_esp_behind_walls then
                                        menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                                        menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                                    end
                                else 
                                    if not aimbot_target_peds then
                                        if not PED.IS_PED_A_PLAYER(v) then
                                            target_this = false
                                        end
                                    end
                                    if not aimbot_target_players then
                                        if PED.IS_PED_A_PLAYER(v) then
                                            target_this = false
                                        end
                                    end
                                    if not aimbot_target_vehicle then
                                        if PED.IS_PED_IN_ANY_VEHICLE(v, true) then 
                                            target_this = false
                                        end
                                    end
                                    if not aimbot_target_godmode then
                                        if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(v) then 
                                            target_this = false 
                                        end
                                    end
                                    if not aimbot_target_friends then
                                        if PED.IS_PED_A_PLAYER(v) then
                                            local hdl = pid_to_handle(NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(v))
                                            if NETWORK.NETWORK_IS_FRIEND(hdl) then
                                                target_this = false 
                                            end
                                        end
                                    end
                                    if not aimbot_shoot_walls then
                                        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), v, 17) then
                                            target_this = false
                                        end
                                    end
                                    if target_this then
                                        cur_tar = v
                                        if aimbot_esp_behind_walls and aimbot_shoot_walls and not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), v, 17) then
                                            if not PED.IS_PED_A_PLAYER(v) then
                                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Low Latency Rendering"))
                                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                                            else
                                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Low Latency Rendering"))
                                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                                            end
                                        else
                                            menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                                            menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                                        end
                                    end
                                end
                            elseif aimbot_esp_behind_walls then
                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Low Latency Rendering"))
                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                            end
                        end
                    end
                    return cur_tar
                end

                local aimbot_area_selected = {}
                aimbot:toggle_loop(Tr("Aimbot"),{},"", function()
                    local target = get_aimbot_target()
                    if target ~= 0 then
                        local aimbot_selected_area = aimbot_area_selected[math.random(#aimbot_area_selected)]
                        local target_pos = PED.GET_PED_BONE_COORDS(target, aimbot_selected_area, 0, 0, 0)
                        if aimbot_show_taget then
                            local ped_pos = PED.GET_PED_BONE_COORDS(target, 31086, 0, 0, 0)
                            GRAPHICS.DRAW_MARKER(0, ped_pos.x, ped_pos.y, ped_pos.z + 1.5, 0, 0, 0, 0, 0, 0, 1, 1, 1, 255, 0, 0, 100, false, true, 2, false, 0, 0, false)
                        end
                        if PED.IS_PED_SHOOTING(players.user_ped()) then
                            if aimbot_selected_area then
                                local shot_pos
                                if ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), target, 17) then
                                    shot_pos = PED.GET_PED_BONE_COORDS(players.user_ped(), 57005, -0.01, 0, 0)
                                else
                                    shot_pos = PED.GET_PED_BONE_COORDS(target, aimbot_selected_area, -0.1, 0, 0)
                                end
                                local wep = WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped())
                                MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(shot_pos.x, shot_pos.y, shot_pos.z, target_pos.x, target_pos.y, target_pos.z, WEAPON.GET_WEAPON_DAMAGE(wep, 0) * (aimbot_damage/100), true, wep, players.user_ped(), false, false, 10000, PED.GET_VEHICLE_PED_IS_IN(target, false))
                            else
                                Notify("Aimbot : No area selected !")
                            end
                        end
                    end
                end, function()
                    if aimbot_esp_behind_walls then
                        menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                        menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                    end
                end)
                
                aimbot_fov = 10
                aimbot:slider(Tr("FOV"), {"mehaimbotfov"}, Tr("High value may result in focusing wrong target."), 1, 180, aimbot_fov, 1, function(s)
                    aimbot_fov = s
                end)

                aimbot_damage = 100
                aimbot:slider(Tr("Weapon Damage %"), {"mehaimbotdamage"}, "", 1, 1000, aimbot_damage, 1, function(s)
                    aimbot_damage = s
                end)

                aimbot_area = aimbot:list(Tr("Area to Shoot"))

                    aimbot_remove_area = function(boneID)
                        for i, v in ipairs(aimbot_area_selected) do
                            if v == boneID then
                                table.remove(aimbot_area_selected, i)
                                break
                            end
                        end
                    end

                    table.insert(aimbot_area_selected, 31086)
                    local aimbot_area_message = Tr("If you select several options, it will chose one randomly everytime you shoot.")
                    aimbot_area:toggle(Tr("Head"),{},aimbot_area_message,function(on)
                        if on then
                            table.insert(aimbot_area_selected, 31086)
                        else
                            aimbot_remove_area(31086)
                        end
                    end, true)

                    aimbot_area:toggle(Tr("Chest"),{},aimbot_area_message,function(on)
                        if on then
                            table.insert(aimbot_area_selected, 24818)
                        else
                            aimbot_remove_area(24818)
                        end
                    end)

                    aimbot_area:toggle(Tr("Pelvis"),{},aimbot_area_message,function(on)
                        if on then
                            table.insert(aimbot_area_selected, 11816)
                        else
                            aimbot_remove_area(11816)
                        end
                    end)

                aimbot_through_walls = aimbot:list(Tr("Through Walls Settings"))
                    aimbot_through_walls:toggle(Tr("Shoot Through Walls"),{},"", function(on)
                        aimbot_shoot_walls = on
                        if not on and aimbot_esp_behind_walls then
                            menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                            menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                        end
                    end)

                    if stand_edition >= 2 then
                        aimbot_through_walls:toggle(Tr("ESP When Behind Walls"),{},Tr("Works only if Shoot Through Walls is enabled."), function(on)
                            aimbot_esp_behind_walls = on
                            if not on then
                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>NPC ESP>Bone ESP>Disabled"))
                                menu.trigger_command(menu.ref_by_path("World>Inhabitants>Player ESP>Bone ESP>Disabled"))
                            end
                        end)
                    end
                
                aimbot_taget_settings = aimbot:list(Tr("Target Settings"))

                    aimbot_target_players = true
                    aimbot_taget_settings:toggle(Tr("Players"),{},"", function(on)
                        aimbot_target_players = on
                    end, true)

                    aimbot_taget_settings:toggle(Tr("NPCS"),{},"", function(on)
                        aimbot_target_peds = on
                    end)

                    aimbot_target_vehicle = true
                    aimbot_taget_settings:toggle(Tr("Inside Vehicle"),{},"", function(on)
                        aimbot_target_vehicle = on
                    end, true)
        
                    aimbot_target_godmode = true
                    aimbot_taget_settings:toggle(Tr("Godmode Player"),{},"", function(on)
                        aimbot_target_godmode = on
                    end, true)
                    
                    aimbot_target_friends = true
                    aimbot_taget_settings:toggle(Tr("Friends"),{},"", function(on)
                        aimbot_target_friends = on
                    end, true)
                    
                    aimbot_show_taget = true
                    aimbot_taget_settings:toggle(Tr("Display Target"),{},"", function(on)
                        aimbot_show_taget = on
                    end, true)

            local thermal_command = menu.ref_by_path('Game>Rendering>Thermal Vision')
            weaponm:toggle_loop(Tr("Thermal Scope"),{},Tr("Press E while aiming to activate."),function()
                local aiming = PLAYER.IS_PLAYER_FREE_AIMING(players.user())
                if GRAPHICS.GET_USINGSEETHROUGH() and not aiming then
                    menu.trigger_command(thermal_command,'off')
                    GRAPHICS.SEETHROUGH_SET_MAX_THICKNESS(1)
                elseif PAD.IS_CONTROL_JUST_PRESSED(38,38) then
                    if menu.get_value(thermal_command) or not aiming then
                        menu.trigger_command(thermal_command,"off")
                        GRAPHICS.SEETHROUGH_SET_MAX_THICKNESS(1)
                    else
                        menu.trigger_command(thermal_command,"on")
                        GRAPHICS.SEETHROUGH_SET_MAX_THICKNESS(50)
                    end
                end
            end)

        -- features

            local regen_all = self:action(Tr("Refill Health & Armor"),{},Tr("Regenerate to max your health and armor."),function()
                ENTITY.SET_ENTITY_HEALTH(players.user_ped(),ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()))
                PED.SET_PED_ARMOUR(players.user_ped(),PLAYER.GET_PLAYER_MAX_ARMOUR(players.user()))
            end)

            local dead = 0
            self:toggle(Tr("Auto Armor after Death"),{},Tr("A body armor will be applied automatically when respawning."),function()
                menu.trigger_command(regen_all)
                local cmd_path = lua_path..">"..Tr("Self")..">"..Tr("Auto Armor after Death")
                while menu.get_state(menu.ref_by_path(cmd_path)) == "On" do
                    local health = ENTITY.GET_ENTITY_HEALTH(players.user_ped())
                    if health == 0 and dead == 0 then
                        dead = 1
                    elseif health == ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) and dead == 1 then
                        menu.trigger_command(regen_all)
                        dead = 0
                    end
                    util.yield(500)
                end
            end)

            self:toggle(Tr("Always Clean"),{},Tr("Keep your ped dry and clean."),function(on)
                util.yield()
                on = GetOn(on)
                menu.trigger_commands("lockwetness "..on)
                menu.trigger_commands("noblood "..on)
                menu.trigger_commands("wetness 0")
            end)

            auto_bst = self:toggle_loop(Tr("Smart BST"),{},Tr("Auto enable BST when you have weapon in hands."),function()
                local on = GetOn(WEAPON.IS_PED_ARMED(players.user_ped(),7))
                menu.trigger_commands("bst "..on)
                util.yield(100)
            end,function()
                menu.trigger_commands("bst off")
            end)
        
            self:toggle(Tr("Dead Silence"),{},"",function(on)
                AUDIO.SET_PED_FOOTSTEPS_EVENTS_ENABLED(players.user_ped(), not on)
            end)

            self:toggle(Tr("Fully Invisible"),{},"",function(on)
                local on = GetOn(on)
                menu.trigger_commands("invisibility "..on)
                menu.trigger_commands("otr "..on)
            end)

    --===============--
    -- Vehicle
    --===============--

        -- drift

            local drift = vehicle:list(Tr("Drift"),{},"")

            get_heading = function(vec)
                local v = ENTITY.GET_ENTITY_VELOCITY(vec)
                return math.fmod(270 + math.deg(math.atan(v.y,v.x)),360)
            end

            local get_angle = function(vec)
                local angle = 360 - math.fmod(ENTITY.GET_ENTITY_HEADING_FROM_EULERS(vec) - get_heading(vec) + 360,360)
                if angle>180 then
                    angle = 0 - (360 - angle)
                end
                return math.floor(angle+0.5)
            end

            local drift_assist = true
            local drift_assist_value = 50

            -- inpired by 2t1 drift script
            drift:toggle_loop(Tr("Drift"),{},Tr("Press SHIFT to drift."),function()
                if vec then
                    if PAD.IS_CONTROL_PRESSED(21,21) and (ENTITY.GET_ENTITY_SPEED(vec)*3.6) >= 8 then
                        if (VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(vec) and not ENTITY.IS_ENTITY_IN_AIR(vec)) then
                            ENTITY.APPLY_FORCE_TO_ENTITY(vec,1,0,0,-0.3*PAD.GET_CONTROL_NORMAL(2,72),0,0,0,true,true)
                        end
                        local drift_angle = get_angle(vec)
                        VEHICLE.SET_VEHICLE_REDUCE_GRIP(vec,true)
                        if drift_assist and math.abs(drift_angle)>drift_assist_value then
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

            drift:toggle(Tr("Counter Steering Assist"),{},Tr("Helps you so you don't do 360."),function(on)
                drift_assist = on
            end,drift_assist)

            drift:slider(Tr("Counter Steering Angle"),{},Tr("Your drift angle can't be higher than this value."),30,90,drift_assist_value,1,function(val)
                drift_assist_value = val
            end)

        -- features

            vehicle:toggle(Tr("Launch Control"),{},Tr("Prevents the car from burnout when starting to drive away faster."),function(on)
                PHYSICS.SET_IN_ARENA_MODE(on)
            end)
    
    --===============--
    -- Online
    --===============--

        -- session

            local session = online:list(Tr("Session"))

            local session_bouty = session:list(Tr("Bounty"))
                local bounty_include_self = true
                local session_bounty_amount = 10000
                session_bouty:toggle_loop(Tr("Auto Bounty"),{},Tr("Loop offer bounty on everyone."),function()
                    for _,pid in pairs(players.list(bounty_include_self)) do
                        if InSession() and players.get_bounty(pid) ~= session_bounty_amount and players.get_name(pid) ~= "UndiscoveredPlayer" then
                            menu.trigger_commands("bounty"..players.get_name(pid).." "..session_bounty_amount)
                        end
                        util.yield(150)
                    end
                    util.yield(5000)
                end)

                session_bouty:slider(Tr("Bounty Amount"),{"mehautobountyamount"},Tr("Chose the amount of the bounty offered automatically."),1,10000,10000,1000,function(amount)
                    session_bounty_amount = amount
                end)

                session_bouty:toggle(Tr("Exclude Self"),{},Tr("Bounty will not be offered on yourself."),function(on)
                    bounty_include_self = on == false
                end)

                local session_tactical_nuke = session:list(Tr("Tactical Nuke"))
                local session_tactical_nuke_owned = false
                session_tactical_nuke:action(Tr("Send Tactical Nuke"),{},Tr("You may be detected by other modders and karma !"),function()
                    for _, pid in pairs(players.list(false)) do
                        util.create_thread(function()
                            SendNuke(pid,true,session_tactical_nuke_height,session_tactical_nuke_owned)
                            util.stop_thread()
                        end)
                    end
                end)

                session_tactical_nuke:toggle(Tr("Say Who Sent it"), {}, "", function(on)
                    session_tactical_nuke_owned = on
                end)

                session_tactical_nuke_height = 10
                session_tactical_nuke:slider(Tr("Nuke Height"), {}, "", 1, 50, session_tactical_nuke_height, 1,function(s)
                    session_tactical_nuke_height = s
                end)

            Check = function(pid)
                while not util.is_session_started() or util.is_session_transition_active() do
                    if not players.exists(pid) then
                        return
                    end
                    util.yield()
                end
                if pid ~= players.user() then
                    CheckTryhard(pid)
                end
            end

            kick_tryhard = false
            CheckTryhard = function(pid)
                while players.exists(pid) and kick_tryhard and not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) do
                    util.yield(10)
                    util.draw_debug_text(players.get_name(pid).." connecting")
                end
                if players.exists(pid) and pid ~= players.user() and kick_tryhard then
                    local name = players.get_name(pid)
                    local char_count = 0
                    local letters = {"l","I","i","L","x","X","-","_"}
                    for i = 1,#name do
                        local char = name:sub(i,i)
                        if table.contains(letters, char) then
                            char_count = char_count + 1
                        end
                    end
                    if (char_count / #name) >= 0.85 then
                        if notifications_enabled then
                            Notify(Tr("Attempt to kick ")..name.."\n"..Tr("Reason: Tryhard Name"),false)
                        end
                        while players.exists(pid) do
                            Kick(pid, 2)
                            util.yield(4000)
                        end
                        return
                    elseif players.get_kd(pid) >= 5 then
                        if notifications_enabled then
                            Notify(Tr("Attempt to kick ")..name.."\n"..Tr("Reason: Tryhard K/D").." ("..players.get_kd(pid)..")",false)
                        end
                        while players.exists(pid) do
                            Kick(pid, 2)
                            util.yield(4000)
                        end
                        return
                    end
                end
            end 

            Kick = function(pid, method=1)
                local name = players.get_name(pid)
                if players.exists(pid) and players.get_name(pid) == name then
                    if menu.get_value(menu.ref_by_path("Players>"..players.get_name_with_tags(pid)..">"..Tr("Attack")..">"..Tr("Add Block Join Reaction"))) then
                        menu.trigger_commands("historyblock"..name.." on")
                        Notify(Tr("Block Join Reaction Added to ")..name..".",false)
                    end
                    if players.get_host() == pid then
                        menu.trigger_commands("ban"..players.get_name(pid))
                    end
                    if method == 1 then
                        if kick_message then
                            ClickPath("Online>Chat>Bypass Character Filter>Enabled")
                            ClickPath("Online>Chat>Bypass Profanity Filter>Enabled")
                            util.yield()
                            menu.trigger_commands("sendpm"..name.." "..kick_message)
                            util.yield()
                            ClickPath("Online>Chat>Bypass Character Filter>Disabled")
                            ClickPath("Online>Chat>Bypass Profanity Filter>Disabled")
                        end
                        util.yield()
                        menu.trigger_commands("buttplug"..name)
                        util.yield(200)
                        if players.exists(pid) and players.get_name(pid) == name then
                            menu.trigger_commands("confusionkick"..name)
                        end
                    elseif method == 2 then
                        menu.trigger_commands("loveletterkick"..name)
                        util.yield(7000)
                        if kick_message then
                            ClickPath("Online>Chat>Bypass Character Filter>Enabled")
                            ClickPath("Online>Chat>Bypass Profanity Filter>Enabled")
                            util.yield()
                            menu.trigger_commands("sendpm"..name.." "..kick_message)
                            util.yield()
                            ClickPath("Online>Chat>Bypass Character Filter>Disabled")
                            ClickPath("Online>Chat>Bypass Profanity Filter>Disabled")
                        end
                        util.yield(7000)
                        if players.exists(pid) and players.get_name(pid) == name then
                            menu.trigger_commands("ban"..name)
                        end
                    end
                    util.yield(1000)
                    while players.get_name(pid) == name do
                        menu.trigger_commands("kick"..name)
                        util.yield(100)
                    end
                end
            end

            session:toggle(Tr("Auto Kick Tryhard"),{},"",function(on)
                kick_tryhard = on
                if on then
                    for _,pid in pairs(players.list()) do
                        CheckTryhard(pid)
                    end
                end
            end)

            become_host = session:action(Tr("Become Host"),{},Tr("Kick players until you become host."),function(type)
                if InSession() then
                    if players.get_host() ~= players.user() then
                        local players_before_host = players.get_host_queue_position(players.user())
                        menu.show_warning(become_host, type, Tr("Warning: You are about to kick around").." "..players_before_host.." "..Tr("players until you become host. Are you sure ?"), function()
                            if InSession() then
                                while players.get_host() ~= players.user() do
                                    local host = players.get_host()
                                    if players.exists(host) then
                                        menu.trigger_commands("ban"..players.get_name(host))
                                    end
                                    util.yield(50)
                                end
                                Notify("You are host.")
                            end
                        end)
                    else
                        Notify("You are host.")
                    end
                end
            end)

            session:action(Tr("Become Script Host"),{},"",function()
                if InSession() then
                    menu.trigger_commands("givesh"..players.get_name(players.user()))
                end
            end)

            local session_already_saved = false
            local unix_milliseconds, unix_seconds, date
            session:action(Tr("Save All Players"),{},Tr("Add the date and hour as note to all players in the current session. If used couple time in the same session, players new players will have the same note as the first time you used it.\nNote: Somehow hour may be 10 min off."),function()
                if not session_already_saved then
                    unix_milliseconds = os.time() * 1000 + (os.clock() * 1000)
                    unix_seconds = math.floor(unix_milliseconds / 1000)
                    date = os.date("%d/%m/%Y %H:%M", unix_seconds)
                    session_already_saved = true
                end
                for _,pid in pairs(players.list(false)) do
                    if players.exists(pid) then
                        menu.trigger_commands("historynote"..players.get_name(pid).." "..date)
                    end
                end
            end)
		
        -- features

            if stand_edition >= 2 then
				spoof_session_informations = online:toggle(Tr("Spoof Session Informations"),{},Tr("Spoof your session informations so nobody can join you from your R* profile."),function(on)
					if on then
						menu.trigger_commands("spoofsession storymode")
						if stand_edition == 3 then
							ClickPath("Online>Spoofing>Session Spoofing>Session Type>Invalid")
						end
					else
						menu.trigger_commands("spoofsession off")
						if stand_edition == 3 then
							ClickPath("Online>Spoofing>Session Spoofing>Session Type>Not Spoofed")
						end
					end
				end)
                table.insert(profiles["script"],spoof_session_informations)
			end

            online:toggle_loop(Tr("Disable RP Gain"),{},Tr("You will not gain any RP."),function()
                memory.write_float(memory.script_global(262145 + 1),0)
            end,function()
                memory.write_float(memory.script_global(262145 + 1),1)
            end)

            local max_health
            undead_otr = online:toggle(Tr("Undead OTR"),{},Tr("Turn you off the radar without notifying other players.\nNote: Trigger Modded Health detection."),function(on)
                if on then
                    max_health = ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped())
                    while menu.get_state(undead_otr) == "On" do
                        if ENTITY.GET_ENTITY_MAX_HEALTH(players.user_ped()) ~= 0 then
                            ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),0)
                        end
                        util.yield(200)
                    end
                else
                    ENTITY.SET_ENTITY_MAX_HEALTH(players.user_ped(),max_health)
                end
            end)

            online:action(Tr("Stop Spectating"),{},Tr("If you are spectating a player,it will stop to spectate him."),function()
                if #player_spectate ~= 0 then
                    menu.trigger_commands("mehspectate"..player_spectate[1].." off")
                end
            end)
            
    --===============--
    -- Game
    --===============--

        -- rendering

                ResetRendering = function()
                    menu.trigger_commands("locktime off")
                    menu.trigger_commands("clouds normal")
                    if InSession() then
                        menu.trigger_commands("syncclock")
                    end
                end
    
    
                local rendering = game:list(Tr("Rendering"))
    
                clear_day = rendering:toggle(Tr("Clear Day"),{},"",function(on)
                    util.yield()
                    if on then
                        if menu.get_value(clear_night) then
                            menu.set_value(clear_night, false)
                        end
                        menu.trigger_commands("locktime on")
                        menu.trigger_commands("timesmoothing off")
                        menu.trigger_commands("time 13")
                        menu.trigger_commands("clouds horizon")
                    elseif not menu.get_value(clear_night) then
                        ResetRendering()
                    end
                end)

                clear_night = rendering:toggle(Tr("Clear Night"),{},"",function(on)
                    util.yield()
                    if on then
                        if menu.get_value(clear_day) then
                            menu.set_value(clear_day, false)
                        end
                        menu.trigger_commands("locktime on")
                        menu.trigger_commands("timesmoothing off")
                        menu.trigger_commands("time 0")
                        menu.trigger_commands("clouds horizon")
                    elseif not menu.get_value(clear_day) then
                        ResetRendering()
                    end
                end)

                rendering:toggle_loop(Tr("Always Clear Weather"),{},Tr("Force clear weather.\nNote: It avoids the snow visual glitch in transitions."),function()
                    if InSession() then
                        menu.trigger_commands("weather extrasunny")
                    else
                        menu.trigger_commands("weather normal")
                    end
                    util.yield(100)
                end, function()
                    menu.trigger_commands("weather normal")
                end)

        -- features

            game:toggle_loop(Tr("Auto Skip Conversation"),{},Tr("Automatically skip all conversations."),function()
                if AUDIO.IS_SCRIPTED_CONVERSATION_ONGOING() then
                    AUDIO.SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE()
                end
                util.yield()
            end)

            game:toggle_loop(Tr("Auto Skip Cutscene"),{},Tr("Automatically skip all cutscenes."),function()
                CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
                util.yield(100)
            end)

            game:toggle_loop(Tr("Auto Accept Warning"),{},"",function()
                local mess_hash = math.abs(HUD.GET_WARNING_SCREEN_MESSAGE_HASH())
                if mess_hash == 896436592 then
                    Notify("This player left the session.")
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
                elseif mess_hash == 1575023314 then
                    Notify("Session timeout.")
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
                elseif mess_hash == 1446064540 then
                    Notify("You are already in the session.")
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
                --          transaction error              join session             join session            leave session           leave online                 full of ceo
                elseif mess_hash == 991495373 or mess_hash == 587688989 or mess_hash == 15890625 or mess_hash == 99184332 or mess_hash == 1246147334 or mess_hash == 583244483 then
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
                elseif mess_hash ~= 0 then
                    util.toast(mess_hash, TOAST_CONSOLE)
                end
                util.yield(50)
            end)

    --===============--
    -- Protection
    --===============--

        local protections = {
            best = {
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
                "Online>Protections>Events>Modded Event",
                "Online>Protections>Events>Trigger Business Raid",
                "Online>Protections>Events>Infinite Phone Ringing",
                "Online>Protections>Events>Vehicle Takeover",
                "Online>Protections>Events>Freeze",
                "Online>Protections>Events>Explosion Spam",
                "Online>Protections>Events>Camera Shaking Event",
                "Online>Protections>Events>Raw Network Events>PTFX",
                "Online>Protections>Events>Raw Network Events>Remove All Weapons Event",
                "Online>Protections>Events>Raw Network Events>Remove Weapon Event",
                "Online>Protections>Events>Raw Network Events>Give Weapon Event",
                "Online>Protections>Events>Raw Network Events>GIVE_PICKUP_REWARDS_EVENT",
                "Online>Protections>Events>Raw Network Events>REMOVE_STICKY_BOMB_EVENT",
                "Online>Protections>Events>Love Letter Kick Blocking Event",
                "Online>Protections>Events>Modded Damage Event",
                "Online>Reactions>Love Letter Kick Reactions",
            },

            normal = {
                "Online>Protections>Events>Crash Event",
                "Online>Protections>Events>Kick Event",
            },

            additional = {
                "Online>Protections>Buttplug Kick Reactions>Myself>Block",
                "Online>Protections>Host Kicks>Lessen Host Kicks",
                "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Karma",
                "Online>Protections>Love Letter & Desync Kicks>Block Love Letter Kicks",
                "Online>Protections>Lessen Breakup Kicks As Host",
                "Online>Protections>Block Entity Spam>Block Entity Spam",
                "Online>Protections>Block Entity Spam>Automatically Use Anti-Crash Cam",
                "Online>Protections>Prevent Renderer Working To Death",
            },

            additional_bis = {
                "Online>Protections>Buttplug Kick Reactions>Someone Else>Block",
                "Online>Protections>Breakup Kick Reactions>Block",
            },

            additional_regular_stand = {
                "Online>Protections>Host Kicks>Host Kick Karma",
                "Online>Protections>Block Join Karma",
                "Online>Protections>Love Letter & Desync Kicks>Desync Kick Karma",
            },

            additional_notif = {
                "Online>Protections>Buttplug Kick Reactions>Myself>Notification",
                "Online>Protections>Buttplug Kick Reactions>Someone Else>Notification",
                "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Notification",
                "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Notification",
                "Online>Protections>Love Letter & Desync Kicks>Notification When Love Letter Kicked",
            },

            additional_log = {
                "Online>Protections>Buttplug Kick Reactions>Myself>Write To Console",
                "Online>Protections>Buttplug Kick Reactions>Someone Else>Write To Console",
                "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Write To Console",
                "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Write To Console",
                "Online>Protections>Buttplug Kick Reactions>Myself>Write To Log File",
                "Online>Protections>Buttplug Kick Reactions>Someone Else>Write To Log File",
                "Online>Protections>Knockoff Breakup Kick Reactions>Myself>Write To Log File",
                "Online>Protections>Knockoff Breakup Kick Reactions>Someone Else>Write To Log File",
            },
        }

        ToggleProtections = function(mode,state)
            local log_on, notification_on, enabled_state
            if state then
                log_on = protections_log
                notification_on = protections_notification
                enabled_state = ">Enabled"
                else
                log_on = false
                notification_on = false
                enabled_state = ">Disabled"
            end
            for _,path in pairs(protections[mode]) do
                ClickPath(path..">Block"..enabled_state)
                if protections_log and state then
                    ClickPath(path..">Write To Log File>Enabled")
                    ClickPath(path..">Write To Console>Enabled")
                else
                    ClickPath(path..">Write To Log File>Disabled")
                    ClickPath(path..">Write To Console>Disabled")
                end
                if protections_notification and state then
                    ClickPath(path..">Notification>Enabled")
                else
                    ClickPath(path..">Notification>Disabled")
                end
            end
            for _,path in pairs(protections["additional"]) do
                SetPathVal(path,state)
            end
            for _,path in pairs(protections["additional_bis"]) do
                ClickPath(path..enabled_state)
            end
            for _,path in pairs(protections["additional_log"]) do
                SetPathVal(path,log_on)
            end
            for _,path in pairs(protections["additional_notif"]) do
                SetPathVal(path,notification_on)
            end
            if stand_edition >= 2 then
                for _,path in pairs(protections["additional_regular_stand"]) do
                    SetPathVal(path,state)
                end
            end
        end

        Protections = function(str,toast=1)
            if str == "Normal" then
                menu.trigger_commands("novotekicks sctv")
                ToggleProtections("best",false)
                ToggleProtections("normal",true)
            elseif str == "Best" then
                menu.trigger_commands("novotekicks sctv")
                ToggleProtections("normal",true)
                ToggleProtections("best",true)
            elseif str == "None" then
                menu.trigger_commands("novotekicks off")
                ToggleProtections("normal",false)
                ToggleProtections("best",false)
            end
            if notifications_enabled and toast == 1 then
                Notify(Tr("Protections").." : "..Tr(str),false)
            end
        end

        protection:action(Tr("Best"),{},Tr("Enable all protections."),function()
            Protections("Best")
        end)

        protection:action(Tr("Normal"),{},Tr("Enable crash and kick protections."),function()
            Protections("Normal")
        end)

        protection:action(Tr("None"),{},Tr("Disable all protections."),function()
            Protections("None")
        end)

        protection:divider(Tr("Protections Settings"))

        protections_log = true
        protection:toggle(Tr("Log"),{},"",function(on)
            util.yield()
            protections_log = on
        end, true)

        protections_notification = true
        protection:toggle(Tr("Notifications"),{},"",function(on)
            util.yield()
            protections_notification = on
        end, true)

    --===============--
    -- Profile
    --===============--

        Profile = function(mode)
            ProfileOff(mode)
            if mode ~= "job" then
                for _,path in pairs(profiles["undetected"]) do
                    SetPathVal(path,true)
                end
                for _,ref in pairs(profiles["script"]) do
                    menu.set_value(ref,true)
                end
                if mode == "rockstar_admin" then
                    for _,path in pairs(profiles["rockstar_admin"]) do
                        SetPathVal(path,true)
                    end
                    for _,ref in pairs(profiles["script"]) do
                        menu.set_value(ref,true)
                    end
                elseif mode == "fight" then
                    for _,path in pairs(profiles["fight"]) do
                        SetPathVal(path,true)
                    end
                    menu.set_value(auto_bst,true)
                end
            end
        end

        ProfileOff = function(mode)
            if mode ~= "rockstar_admin" then
                for _,path in pairs(profiles["rockstar_admin"]) do
                    SetPathVal(path,false)
                end
            end
            if mode ~= "fight" then
                for _,path in pairs(profiles["fight"]) do
                    SetPathVal(path,false)
                end
            end
            if mode ~= "undetected" then
                for _,path in pairs(profiles["undetected"]) do
                    SetPathVal(path,false)
                end
                if mode ~= rockstar_admin then
                    for _,ref in pairs(profiles["script"]) do
                        menu.set_value(ref,false)
                    end
                end
            end
        end

        profile:action(Tr("Rockstar Admin"),{},Tr("Turn on all useful features so nobody can disturb you."),function()
            Profile("rockstar_admin")
            if notifications_enabled then
                Notify(Tr("Profile").." : "..Tr("Rockstar Admin"),false)
            end
        end)

        profile:action(Tr("Undetected"),{},Tr("Similar to Rockstar Admin but without the features that can trigger modder detections."),function()
            Profile("undetected")
            if notifications_enabled then
                Notify(Tr("Profile").." : "..Tr("Undetected"),false)
            end
        end)

        profile:action(Tr("Job & Heists"),{},Tr("Everything is turned off, you are now 'legit'."),function()
            Profile("job")
            if notifications_enabled then
                Notify(Tr("Profile").." : "..Tr("Job & Heists"),false)
            end
        end)

        profile:action(Tr("Fight"),{},Tr("Turn on Infinite Ammo, Never Wanted, No Recoil, No Spread and Thermal Scope."),function()
            Profile("fight")
            if notifications_enabled then
                Notify(Tr("Profile").." : "..Tr("Fight"),false)
            end
        end)

        local path_to_click = {
            "Online>Transitions>Join Group Override>Spectator",
        }

        local path_to_enable = {
            "Online>Transitions>Speed Up>Don't Wait For Data Broadcast",
            "Online>Transitions>Speed Up>Don't Wait For Mission Launcher",
            "Online>Transitions>Speed Up>Don't Ask For Permission To Spawn",
            "Online>Transitions>Skip Swoop Down",
            "Online>Transitions>Disable Spawn Activities",
            "Online>Session>Block Joins>From Kicked Players",
            "Online>Session>Player Leave Reasons>Notification",
            "Online>Session>Player Leave Reasons>Write To Log File",
            "Online>Session>Player Leave Reasons>Write To Console",
            "Online>Enhancements>Phone Animations",
            "Online>Enhancements>Disable Idle/AFK Kick",
            "Online>Enhancements>Speed Up Dialing",
            "Online>Enhancements>Disable Death Barriers",
            "Online>Enhancements>Disable Mechanic Cooldown",
            "Online>Enhancements>Disable Oppressor Mk II Cooldown",
            "Online>Enhancements>Disable VIP Work Cooldown",
            "Online>Enhancements>Disable Suicide Cooldown",
            "Online>Enhancements>Disable Passive Mode Cooldown",
            "Online>Enhancements>Disable Orbital Cannon Cooldown",
            "Online>Enhancements>Disable Event End Countdown Audio",
            "Online>Enhancements>Bypass Interior Restrictions",
            "Online>Enhancements>Bypass Interaction Menu Barriers",
            "Online>Enhancements>Bypass Casino Region Lock",
            "Online>Enhancements>Bypass Time Trial Vehicle Suitability",
            "Online>Enhancements>Notify On Commendation",
            "Online>Enhancements>Disable Daily Expenses",
            "Online>Chat>Typing Indicator>Typing Indicator",
            "Online>Chat>Log Chat Messages>Chat.txt",
            "Online>Chat>Log Chat Messages>Log.txt",
            "Online>Chat>Log Chat Messages>Console",
            "Online>Reveal Off The Radar Players",
            "Online>Reveal Invisible Players",
            "Online>Reactions>RID Join Reactions>Notification",
            "Online>Reactions>RID Join Reactions>Block",
            "Online>Reactions>RID Join Reactions>Write To Log File",
            "Online>Reactions>RID Join Reactions>Write To Console",
        }

        local path_to_disable = {
            "Online>Protections>Detections>Stand User Identification",
        }

        local path_to_set = {
            "Online>Reactions>Player Join Reactions>Notification",
            "Online>Reactions>Player Join Reactions>Write To Log File",
            "Online>Reactions>Player Join Reactions>Write To Console",
            "Online>Reactions>Host Change Reactions>Notification",
            "Online>Reactions>Host Change Reactions>Write To Log File",
            "Online>Reactions>Host Change Reactions>Write To Console",
        }

        profile:divider(Tr("Profile Features"))

        profile_editor = profile:list(Tr("Profile Editor"))

            local profile_list = {}
            local profile_list_c = 0
            local custom_profile_features
            local custom_profile_appearance
            local custom_profile_lua
            local custom_profile_running
            profiles_dir = filesystem.stand_dir().."\\Profiles"
            
            SelectProfiles = function()
                custom_profile_running = true
                profiles_dir = filesystem.stand_dir().."\\Profiles"
                for _, path in ipairs(filesystem.list_files(profiles_dir)) do
                    local filename, ext = string.match(path, '^.+\\(.+)%.(.+)$')
                    if ext == "txt" then
                        profile_list[profile_list_c+1] = profile_editor:list(filename,{},"",function() end)

                            profile_list[profile_list_c+1]:divider(Tr("Import").." : "..filename)
                            profile_list[profile_list_c+1]:action(Tr("Select Features"),{},"",function()
                                if not custom_profile_running then
                                    custom_profile_running = true
                                    local file = io.open(profiles_dir.."\\"..filename..".txt", "r")
                                    local file_content = file:read("*all")
                                    local selected_text = file_content:match("(.-)Stand\n\t")
                                    if not selected_text then
                                        selected_text = file_content:match("(.-)Lua Scripts\n\t")
                                        if not selected_text then
                                            selected_text = file_content
                                        end
                                    end
                                    custom_profile_features = selected_text
                                    file:close()
                                    DisplayProfilesFeatures(true)
                                    Notify(Tr("Features From Profile ")..filename..Tr(" selected !"),false)
                                    menu.set_menu_name(save_profile_features, Tr("Features From : ")..filename)
                                    custom_profile_running = false
                                else
                                    Notify("Program is running wait a few seconds then retry.")
                                end
                            end)
                    
                            profile_list[profile_list_c+1]:action(Tr("Select Appearance"),{},"",function()
                                if not custom_profile_running then
                                    custom_profile_running = true
                                    local file = io.open(profiles_dir.."\\"..filename..".txt", "r")
                                    local file_content = file:read("*all")
                                    local selected_text = string.match(file_content, "Stand\n\t(.-)Lua Scripts")
                                    if not selected_text then
                                        selected_text = string.match(file_content, "Stand\n\t.*")
                                    end
                                    custom_profile_appearance = "Stand\n\t"..selected_text
                                    file:close()
                                    DisplayProfilesFeatures(true)
                                    Notify(Tr("Appearance From Profile ")..filename..Tr(" selected !"),false)
                                    menu.set_menu_name(save_profile_appearance, Tr("Appearance From : ")..filename)
                                    custom_profile_running = false
                                else
                                    Notify("Program is running wait a few seconds then retry.")
                                end
                            end)
            
                            profile_list[profile_list_c+1]:action(Tr("Select Lua Settings"),{},"",function()
                                if not custom_profile_running then
                                    custom_profile_running = true
                                    local file = io.open(profiles_dir.."\\"..filename..".txt", "r")
                                    local file_content = file:read("*all")
                                    local selected_text = string.match(file_content, "Lua Scripts\n\t.*")
                                    if not selected_text then
                                        Notify("No lua settings found in this profile !")
                                        file:close()
                                        custom_profile_running = false
                                        return
                                    end
                                    custom_profile_lua = selected_text
                                    file:close()
                                    DisplayProfilesFeatures(true)
                                    Notify(Tr("Lua Settings From Profile ")..filename..Tr(" selected !"),false)
                                    menu.set_menu_name(save_profile_lua, Tr("Lua Settings From : ")..filename)
                                    custom_profile_running = false
                                else
                                    Notify("Program is running wait a few seconds then retry.")
                                end
                            end)

                            profile_list[profile_list_c+1]:divider(Tr("Load and Save"))
                            
                            local filename_format = filename:gsub("%s", ""):gsub("%p", ""):lower()
                            profile_list[profile_list_c+1]:action(Tr("Save Profile"),{},"",function()
                                if not custom_profile_running then
                                    custom_profile_running = true
                                    menu.trigger_commands("save"..filename_format)
                                    Notify(filename..Tr(" profile saved !"),false)
                                    custom_profile_running = false
                                else
                                    Notify("Program is running wait a few seconds then retry.")
                                end
                            end)

                            profile_list[profile_list_c+1]:action(Tr("Load Profile"),{},"",function()
                                if not custom_profile_running then
                                    custom_profile_running = true
                                    Notify(filename..Tr(" profile loaded !"),false)
                                    custom_profile_running = false
                                    menu.trigger_commands("load"..filename_format)
                                else
                                    Notify("Program is running wait a few seconds then retry.")
                                end
                            end)

                            profile_list_c = profile_list_c + 1
                    end
                end
                custom_profile_running = false
            end
            
            RefreshProfiles = function()
                for _, ref in pairs(profile_list) do
                    menu.delete(ref)
                end
                profile_list = {}
                SelectProfiles()
                DisplayProfilesFeatures(false)
            end

            DisplayProfilesFeatures = function(state)
                menu.set_visible(save_profile, state)
                if not state then
                    menu.trigger_command(save_profile_input, "")
                    custom_profile_features = nil
                    menu.set_menu_name(save_profile_features, Tr("Features From : ").."None")
                    custom_profile_appearance = nil
                    menu.set_menu_name(save_profile_appearance, Tr("Appearance From : ").."None")
                    custom_profile_lua = nil
                    menu.set_menu_name(save_profile_lua, Tr("Lua Settings From : ").."None")
                end
            end
            
            local explaintation_mess = "In each profile you can pick up the part you want to. For exemple :\nProfile1 has good appearance but bad features enabled and Profile2 has bad appearance but good features.\nSo you can Select Features of Profile2 and Select Appearance of Profile1 then\nYou can save it in Profile Editor>Save Custom Profile ! :D"
            profile_editor:action(Tr("Explaination"),{},explaintation_mess,function()
                Notify(explaintation_mess,false)
                util.toast(explaintation_mess, TOAST_CONSOLE)
            end)

            profile_editor:action(Tr("Profile Menu Shortcut"),{},"Stand>"..Tr("Profiles"),function()
                menu.focus(menu.ref_by_path("Stand>Profiles>Create Profile"))
            end)

            profile_refresh_button = profile_editor:action(Tr("Refresh"),{},"",function()
                if not custom_profile_running then
                    custom_profile_running = true
                    RefreshProfiles()
                    custom_profile_running = false
                else
                    Notify("Program is running wait a few seconds then retry.")
                end
            end)
            
            save_profile = profile_editor:list(Tr("Save Custom Profile"))
            save_profile_features = save_profile:action(Tr("Features From : ").."None",{},"",function() end)
            save_profile_appearance = save_profile:action(Tr("Appearance From : ").."None",{},"",function() end)
            save_profile_lua = save_profile:action(Tr("Lua Settings From : ").."None",{},"",function() end)
            save_profile_input = save_profile:text_input(Tr("Save Custom Profile"),{"mehscriptsaveprofile"},"",function(profile_name)
                util.yield()
                if profile_name and profile_name ~= "" then
                    if not custom_profile_running then
                        custom_profile_running = true
                        menu.trigger_commands("newprofile "..profile_name)
                        util.yield(1000)
                        io.remove(profiles_dir.."\\"..profile_name..".txt")
                        local custom_profile = io.open(profiles_dir.."\\"..profile_name..".txt", "w")
                        if not custom_profile_features then
                            custom_profile_features = "Finished Tutorial: Yes\n"
                        end
                        if not custom_profile_appearance then
                            custom_profile_appearance = ""
                            if custom_profile_lua then
                                custom_profile_appearance = "Stand\n\t"
                            end
                        end
                        if not custom_profile_lua then
                            custom_profile_lua = ""
                        end
                        custom_profile:write(custom_profile_features..custom_profile_appearance..custom_profile_lua)
                        custom_profile:close()
                        Notify(profile_name..Tr(" profile saved !"),false)
                        RefreshProfiles()
                        menu.focus(profile_refresh_button)
                        custom_profile_running = false
                    else
                        Notify("Program is running wait a few seconds then retry.")
                    end
                end
            end)
            
            DisplayProfilesFeatures(false)
            profile_editor:divider(Tr("Your Profiles"))
            SelectProfiles()

        profile:action(Tr("Apply Recommended Profile"),{},Tr("Will apply recommended profile.\nMake sure to have a backup of your profile."),function()
            Profile("undetected")
            Protections("Best",0)
            for _,path in pairs(path_to_click) do
                ClickPath(path)
            end
            for _,path in pairs(path_to_enable) do
                SetPathVal(path,true)
            end
            for _,path in pairs(path_to_disable) do
                SetPathVal(path,false)
            end
            for _,path in pairs(path_to_set) do
                SetPathVal(path,0)
            end
            Notify("Recommended Profile Applied.")
        end)

    --===============--
    -- Misc
    --===============--

        -- settings

            misc:divider(Tr("Settings"))

            notifications_mode = "Stand"
            misc:list_select(Tr("Notifications Mode"),{},"",{"Stand",Tr("Help Message")},1,function(selected_mode)
                notifications_mode = selected_mode
            end)

            notifications_enabled = true
            notifications_toggle = misc:toggle(Tr("Notifications"),{},"",function(on)
                util.yield()
                notifications_enabled = on
            end, true)

        -- about

            misc:divider(Tr("About"))
            misc:action(Tr("Version").." "..version,{},"",function() end)

            -- credits

                local credits = misc:list(Tr("Credits"))
                credits:divider("Made by Akatozi.")
                credits:action("Lance",{},"I took his aimbot then improved it.",function() end)
                credits:action("Scriptcat",{},"I took his Orbital Strike on Waipont to make it work on players and changed it a bit.",function() end)

            -- links

                misc:hyperlink("Github","https://github.com/akat0zi/mehScript")

--===============--
-- Player Menu
--===============--

    local attack = {
        crash = {
            "crash",
            "choke",
            "flashcrash",
            "ngcrash",
            "footlettuce",
        }
    }

    player_spectate = {}

    Crash = function(pid,name)
        if menu.get_value(menu.ref_by_path("Players>"..players.get_name_with_tags(pid)..">"..Tr("Attack")..">"..Tr("Add Block Join Reaction"))) then
            menu.trigger_commands("historyblock"..name.." on")
            Notify(Tr("Block Join Reaction Added to ")..name..".",false)
        end
        for _,cmd in pairs(attack["crash"]) do
            if players.exists(pid) and players.get_name(pid) == name then
                menu.trigger_commands(cmd..name)
            end
            util.yield(100)
        end
    end

    PlayerMenu = function(pid)
        local player = menu.player_root(pid)
        local player_name = players.get_name(pid)
        player:divider("mehScript")

        -- griefing

            local griefing = player:list(Tr("Griefing"),{},"")

            local bounty = griefing:list(Tr("Bounty"),{},"")
                local bounty_amount = 10000
                bounty:toggle_loop(Tr("Auto Bounty"),{},Tr("Loop that place a bounty on the player."),function()
                    if InSession() then
                        if players.get_bounty(pid) ~= bounty_amount then
                            menu.trigger_commands("bounty"..player_name.." "..bounty_amount)
                        end
                    end
                    util.yield(1000)
                end)

                bounty:slider(Tr("Bounty Amount"),{"mehbountyamount"},Tr("Chose the amount of the bounty offered automatically."),1,10000,10000,1000,function(amount)
                    bounty_amount = amount
                end)

            tactical_nuke = griefing:list(Tr("Tactical Nuke"))
                
                SendNuke = function(pid,nuke_session,height,owned)
                    if not players.is_in_interior(pid) then
                        if not players.is_godmode(pid) then
                            Notify("Tactical nuke incoming !")
                            AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "Air_Defences_Activated", PLAYER.GET_PLAYER_PED(pid), "DLC_sum20_Business_Battle_AC_Sounds", true, true)
                            util.yield(3000)
                            if not players.is_in_interior(pid) and not players.is_godmode(pid) then
                                local tactical_nuke_height_used = 1
                                local p_ped = PLAYER.GET_PLAYER_PED(pid)
                                local p_vec = PED.GET_VEHICLE_PED_IS_IN(p_ped,false)
                                util.toast(ENTITY.GET_ENTITY_SPEED(p_vec)..'\n'..ENTITY.GET_ENTITY_SPEED(p_ped))
                                if ENTITY.GET_ENTITY_SPEED(p_vec) < 5 and ENTITY.GET_ENTITY_SPEED(p_ped) < 5 then
                                    tactical_nuke_height_used = height
                                end
                                local pos = players.get_position(pid)
                                if not owned then
                                    for a = 1, tactical_nuke_height_used do
                                        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z + tactical_nuke_height_used * 5 - a * 5, 29, 10, true, false, 1, false)
                                        FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z + tactical_nuke_height_used * 5 - a * 5, 59, 10, true, false, 1, false)
                                        util.yield(20)
                                    end
                                else
                                    local player_ped = players.user_ped()
                                    for i = 1, tactical_nuke_height_used do
                                        FIRE.ADD_OWNED_EXPLOSION(player_ped, pos.x, pos.y, pos.z + tactical_nuke_height_used - i, 29, 10, true, false, 1)
                                        FIRE.ADD_OWNED_EXPLOSION(player_ped, pos.x, pos.y, pos.z + tactical_nuke_height_used - i, 59, 10, true, false, 1)
                                        util.yield(20)
                                    end
                                end
                            end
                        elseif not nuke_session then
                            Notify(player_name.." "..Tr("is godmode."),false)
                        end
                    elseif not nuke_session then
                        Notify(player_name.." "..Tr("is in interior."),false)
                    end
                end

                local tactical_nuke_owned = false
                tactical_nuke:action(Tr("Send Tactical Nuke"), {}, "", function()
                    SendNuke(pid,false,tactical_nuke_height,tactical_nuke_owned)
                end)

                tactical_nuke:toggle(Tr("Say Who Sent it"), {}, "", function(on)
                    tactical_nuke_owned = on
                end)

                tactical_nuke_height = 10
                tactical_nuke:slider(Tr("Nuke Height"), {}, "", 1, 50, tactical_nuke_height, 1,function(s)
                    tactical_nuke_height = s
                end)

            griefing:toggle_loop(Tr("Freeze"),{},Tr("Better than the Stand one."),function()
                if players.exists(pid) then
                    util.trigger_script_event(1 << pid,{0x4868BC31,pid,0,0,0,0,0}) -- credits to jinx
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                    menu.trigger_commands("freeze"..player_name.." on")
                end
                util.yield()
            end,function()
                if players.exists(pid) then
                    menu.trigger_commands("freeze"..player_name.." off")
                end
            end)

        -- attack

        if pid ~= players.user() then
            local attack = player:list(Tr("Attack"),{},"")

            local kick = attack:list(Tr("Kick"))

            kick:action_slider(Tr("Kick Player"),{},"",{Tr("Hard (Karma)"),Tr("Safe (Detectable)")},function(method)
                if method == 1 then
                    Notify(Tr("Attempt to kick ")..player_name,false)
                    Kick(pid, 1)
                else
                    Notify(Tr("Attempt to kick ")..player_name.."\n"..Tr("Should take less then 10 sec !"),false)
                    Kick(pid, 2)
                end
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

            kick:action_slider(Tr("Kick Organisation"),{},Tr("Kick all organisation members."),{Tr("Hard (Karma)"),Tr("Safe (Detectable)")},function(method)
                org_members = GetOrgMembers(pid)
                if #org_members>1 then
                    Notify(Tr("Attempt to kick ")..player_name.."'s"..Tr(" organisation."),false)
                else
                    Notify(Tr("Attempt to kick ")..player_name,false)
                end
                local add_block_join_reaction = menu.get_value(menu.ref_by_path("Players>"..players.get_name_with_tags(pid)..">"..Tr("Attack")..">"..Tr("Add Block Join Reaction")))
                for _,player_to_kick in pairs(org_members) do
                    if player_to_kick ~= players.user() then
                        if add_block_join_reaction then
                            menu.set_value(menu.ref_by_path("Players>"..players.get_name_with_tags(player_to_kick)..">"..Tr("Attack")..">"..Tr("Add Block Join Reaction")),add_block_join_reaction)
                        end
                        util.yield(10)
                        if not player_to_kick == pid then
                            menu.trigger_commands("mehkickmessage"..players.get_name(player_to_kick).." "..kick_message)
                        end
                        Kick(player_to_kick, method)
                    end
                end
            end)

            kick:text_input(Tr("Kick Message"),{"mehkickmessage"},Tr("Will send a private chat message to the player when kicking him."),function(str) 
                kick_message = str
            end)

            local preset_kick_message_table = {"Stand On Top !","You Suck Buddy ...","Taste the GIGACHAD power !","Can't Beat Kiddion's VIP Menu","10$ Stand>120$ VIP 2TAKE1","A femboy is a slang term for a young, usually cisgender male who displays traditionally feminine characteristics. While the term can be used as an insult, some in the LGBTQ community use the term positively to name forms of gender."}
            kick:list_action(Tr("Preset Message"),{},"",preset_kick_message_table,function(i)
                menu.trigger_commands("mehkickmessage"..player_name.." "..preset_kick_message_table[i])
            end)

            local crash = attack:list(Tr("Crash"))

            crash:action(Tr("Crash Player"),{},"",function()
                Notify(Tr("Attempt to crash ")..player_name,false)
                Crash(pid, player_name)
            end)

            crash:action(Tr("Crash Organisation"),{},Tr("Crash all organisation members."),function()
                org_members = GetOrgMembers(pid)
                if #org_members>1 then
                    Notify(Tr("Attempt to crash ")..player_name..Tr(" organisation."),false)
                else
                    Notify(Tr("Attempt to crash ")..player_name,false)
                end
                for _,player_to_crash in pairs(org_members) do
                    if player_to_crash ~= players.user() then
                        Crash(player_to_crash, players.get_name(player_to_crash))
                    end
                end
            end)

            attack:action(Tr("Nuke Button"),{},Tr("Take all risks to remove him.\nNote: You may be karma."),function()
                Notify(Tr("Nuke on ")..player_name,false)
                Crash(pid, player_name)
                util.yield(2000)
                if players.get_name(pid) == player_name then
                    Kick(pid)
                end
            end)

            attack:toggle(Tr("Add Block Join Reaction"),{},Tr("When removing the player, it'll add him the block join reaction so he will never join you again."),function()
            end)

            player:toggle(Tr("Spectate"),{"mehspectate"},"",function(on)
                if on then
                    if #player_spectate ~= 0 then
                        menu.trigger_commands("mehspectate"..player_spectate[1].." off")
                    end
                    table.insert(player_spectate,player_name)
                    menu.trigger_commands("spectate"..player_name.." on")
                else
                    if players.exists(pid) then
                        menu.trigger_commands("spectate"..player_spectate[1].." off")
                    end
                    table.remove(player_spectate,1)
                end
            end)
        end
    end
	
util.create_tick_handler(function()
	-- Vehicle
		if players.get_vehicle_model(players.user()) ~= 0 then
			vec = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(),false)
		else
			vec = 0
		end
end)

players.on_join(PlayerMenu)
players.on_join(Check)
players.dispatch_on_join()

if SCRIPT_MANUAL_START then
    async_http.init("raw.githubusercontent.com","/akat0zi/mehScript/main/news_message",function(content)
        if content ~= "404: Not Found" then
            local news_message = string.gsub(content, "\n$", "")
            main:action(Tr("News Message"),{},news_message,function() Notify(news_message,false) end)
            Notify(news_message,false)
        end
    end)
    async_http.dispatch()
    AUDIO.PLAY_SOUND(-1, "Virus_Eradicated", "LESTER1A_SOUNDS", 0, 0, 1)
end
