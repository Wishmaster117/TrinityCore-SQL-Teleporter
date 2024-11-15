/*
TrinityCore Portal Master
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
Ported to TrinityCore Master Branch by Wishmaster
*/

SET
@ENTRY          := 900000000, -- NPC Entry
@NAME           := "Portal Master", -- NPC Name
@SUBNAME        := "Where do you go ?", -- NPC Guild
@MODEL          := 21572, -- New value: 86569 -- Original value: 21572
@AURA           := "30540", -- "35766" = casting (Visual effect of the NPC)
@TEXT_ID        := 900000000, -- Don't change this
@GOSSIP_MENU    := 200000000, -- Don't change this
@BROAD_TEXT     := 900000000, -- Don't change this
@SCALE          := 1, -- Scale of creature
@VBUILD         := 57388;

-- Deleting code
DELETE FROM creature_template WHERE entry = @ENTRY;
DELETE FROM creature_template_addon WHERE Entry = @ENTRY ;
DELETE FROM creature_template_gossip WHERE CreatureID = @ENTRY ;
DELETE FROM gossip_menu WHERE menuid BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+999;
DELETE FROM npc_text WHERE ID BETWEEN @TEXT_ID AND @TEXT_ID+999;
DELETE FROM gossip_menu_option WHERE menuid BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+999;
DELETE FROM smart_scripts WHERE entryorguid = @ENTRY AND source_type = 0;
DELETE FROM conditions WHERE (SourceTypeOrReferenceId = 15 OR SourceTypeOrReferenceId = 14) AND SourceGroup BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+999;
DELETE from creature WHERE ID = @ENTRY;
DELETE from creature_template_model WHERE CreatureID = @ENTRY;

-- Teleporter
-- Create Creature
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`) 
VALUES (@ENTRY, 0, 0, @NAME, NULL, @SUBNAME, NULL, 'Directions', 0, 0, 35, 1, 1.14286, 1.25, 1, 2, 0, 0, 0, 1, 1, 1, 4, 0, 0, 0, 0, 7, 0, 'SmartAI', 0, 1, 0, 0, 0, 0, 1, 0, 2, '', NULL, @VBUILD);

-- Teleporter aura
INSERT INTO `creature_template_addon` (`entry`, `PathId`, `mount`, `MountCreatureID`, `StandState`, `AnimTier`, `VisFlags`, `SheathState`, `PvPFlags`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`) 
VALUES (@ENTRY, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, @AURA);

-- Teleporter MODEL
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) 
VALUES (@ENTRY , 0, @MODEL , @SCALE, 1, @VBUILD);

-- Link menu to creature
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) 
VALUES (@ENTRY , @GOSSIP_MENU, @VBUILD);

-- Gossip header text link to menus
INSERT INTO gossip_menu (`menuid`, `textid`, `VerifiedBuild`) VALUES
(@GOSSIP_MENU+19, @TEXT_ID+14, @VBUILD), -- New Starting Zone
(@GOSSIP_MENU+18, @TEXT_ID+13, @VBUILD), -- PvP Zones
(@GOSSIP_MENU+17, @TEXT_ID+12, @VBUILD), -- Capitals and cities
(@GOSSIP_MENU+10, @TEXT_ID+11, @VBUILD), -- War Within header
(@GOSSIP_MENU+16, @TEXT_ID+10, @VBUILD), -- Dragonflight header
(@GOSSIP_MENU+15, @TEXT_ID+9, @VBUILD), -- Shadowlands header
(@GOSSIP_MENU+14, @TEXT_ID+8, @VBUILD), -- BFA header
(@GOSSIP_MENU+13, @TEXT_ID+7, @VBUILD), -- Legion header
(@GOSSIP_MENU+12, @TEXT_ID+6, @VBUILD), -- Draenor header
(@GOSSIP_MENU+11, @TEXT_ID+5, @VBUILD), -- Pandaria header
(@GOSSIP_MENU+4, @TEXT_ID+3, @VBUILD),
(@GOSSIP_MENU+3, @TEXT_ID+2, @VBUILD),
(@GOSSIP_MENU+2, @TEXT_ID+2, @VBUILD),
(@GOSSIP_MENU+1, @TEXT_ID+2, @VBUILD),
(@GOSSIP_MENU+8, @TEXT_ID+4, @VBUILD),
(@GOSSIP_MENU+7, @TEXT_ID+4, @VBUILD),
(@GOSSIP_MENU+6, @TEXT_ID+4, @VBUILD),
(@GOSSIP_MENU+5, @TEXT_ID+4, @VBUILD),
(@GOSSIP_MENU, @TEXT_ID+1, @VBUILD),
(@GOSSIP_MENU, @TEXT_ID, @VBUILD);

-- Gossip header texts
INSERT INTO npc_text (`ID`, Probability0, `BroadcastTextID0`, `VerifiedBuild`) VALUES
(@TEXT_ID+14, 1, @BROAD_TEXT+14, @VBUILD), -- New starting Zone
(@TEXT_ID+13, 1, @BROAD_TEXT+13, @VBUILD), -- PvP Zones
(@TEXT_ID+12, 1, @BROAD_TEXT+12, @VBUILD), -- Capitals and cities
(@TEXT_ID+11, 1, @BROAD_TEXT+11, @VBUILD), -- War Within header
(@TEXT_ID+10, 1, @BROAD_TEXT+10, @VBUILD), -- Dragonflight header
(@TEXT_ID+9, 1, @BROAD_TEXT+9, @VBUILD), -- Shadowlands header
(@TEXT_ID+8, 1, @BROAD_TEXT+8, @VBUILD), -- BFA header
(@TEXT_ID+7, 1, @BROAD_TEXT+7, @VBUILD), -- Legion header
(@TEXT_ID+6, 1, @BROAD_TEXT+6, @VBUILD), -- Draenor header
(@TEXT_ID+5, 1, @BROAD_TEXT+5, @VBUILD), -- Pandaria header
(@TEXT_ID+4, 1, @BROAD_TEXT+4, @VBUILD),
(@TEXT_ID+3, 1, @BROAD_TEXT+3, @VBUILD),
(@TEXT_ID+2, 1, @BROAD_TEXT+2, @VBUILD),
(@TEXT_ID+1, 1, @BROAD_TEXT+1, @VBUILD),
(@TEXT_ID, 1, @BROAD_TEXT, @VBUILD);

-- Conditions for gossip option and menu factions : ConditionValue1 469 = Alliance, 67 = Horde , [SourceGroup = OptionID of gossip_menu_option table]
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ConditionTypeOrReference, ConditionValue1, `Comment`) VALUES
(15, @GOSSIP_MENU+1, 0, 6, 469, "Gnomeregan"),
(15, @GOSSIP_MENU+1, 1, 6, 469, "The Deadmines"),
(15, @GOSSIP_MENU+1, 2, 6, 469, "The Stockade"),
(15, @GOSSIP_MENU+1, 3, 6, 67, "Ragefire Chasm"),
(15, @GOSSIP_MENU+1, 4, 6, 67, "Razorfen Downs"),
(15, @GOSSIP_MENU+1, 5, 6, 67, "Razorfen Kraul"),
(15, @GOSSIP_MENU+1, 6, 6, 67, "Scarlet Monastery"),
(15, @GOSSIP_MENU+1, 7, 6, 67, "Shadowfang Keep"),
(15, @GOSSIP_MENU+1, 8, 6, 67, "Wailing Caverns"),
(15, @GOSSIP_MENU+4, 22, 6, 67, "Zul'Aman"),
(15, @GOSSIP_MENU+5, 2, 6, 469, "Dun Morogh"),
(15, @GOSSIP_MENU+5, 3, 6, 67, "Tirisfal Glades"),
(15, @GOSSIP_MENU+5, 4, 6, 67, "Ghostlands"),
(15, @GOSSIP_MENU+5, 5, 6, 469, "Loch modan"),
(15, @GOSSIP_MENU+5, 6, 6, 67, "Silverpine Forest"),
(15, @GOSSIP_MENU+5, 7, 6, 469, "Westfall"),
(15, @GOSSIP_MENU+5, 8, 6, 469, "Redridge mountains"),
(15, @GOSSIP_MENU+5, 9, 6, 469, "Duskwood"),
(15, @GOSSIP_MENU+5, 11, 6, 469, "Wetlands"),
(15, @GOSSIP_MENU+5, 1, 6, 67, "Eversong Woods"),
(15, @GOSSIP_MENU+5, 0, 6, 469, "Elwynn Forest"),
(15, @GOSSIP_MENU+6, 0, 6, 469, "Azuremyst Isle"),
(15, @GOSSIP_MENU+6, 1, 6, 469, "Teldrassil"),
(15, @GOSSIP_MENU+6, 2, 6, 67, "Durotar"),
(15, @GOSSIP_MENU+6, 3, 6, 67, "Mulgore"),
(15, @GOSSIP_MENU+6, 4, 6, 469, "Bloodmyst Isle"),
(15, @GOSSIP_MENU+6, 5, 6, 469, "Darkshore"),
(15, @GOSSIP_MENU+6, 6, 6, 67, "The Barrens"),
(15, @GOSSIP_MENU+6, 9, 6, 67, "Thousand Needles"),
(15, @GOSSIP_MENU+11, 0, 6, 67, "Sanctuaire des deux lunes"), -- Pandarie Horde
(15, @GOSSIP_MENU+11, 1, 6, 469, "Sanctuaire des sept étoiles"), -- Pandarie Alliance
(15, @GOSSIP_MENU+11, 3, 6, 649, "Portal Master - Level req Pao'don Alliance"),
(15, @GOSSIP_MENU+11, 2, 6, 67, "Portal Master - Level req Rosée de Miel Horde"),
(14, @GOSSIP_MENU, @TEXT_ID+1, 6, 67, "For the Alliance"),
(14, @GOSSIP_MENU, @TEXT_ID, 6, 469, "For the Horde"),
-- Capitals and cities
(15, @GOSSIP_MENU+17, 1, 6, 469, "Stormwind"),
(15, @GOSSIP_MENU+17, 2, 6, 67, "Orgrimmar"),
(15, @GOSSIP_MENU+17, 3, 6, 469, "Darnassus"),
(15, @GOSSIP_MENU+17, 4, 6, 469, "Ironforge"),
(15, @GOSSIP_MENU+17, 5, 6, 469, "Exodar"),
(15, @GOSSIP_MENU+17, 6, 6, 67, "Thunder bluff"),
(15, @GOSSIP_MENU+17, 7, 6, 67, "Undercity"),
(15, @GOSSIP_MENU+17, 8, 6, 67, "Silvermoon city");

-- Conditions for gossip option levels (SourceEntry /* Référence au numéro du menu dans  gossip_menu_option*/, ConditionTypeOrReference/* Niveau requis */)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, `Comment`) VALUES
-- Northrend Teleport level restrictions
(15, @GOSSIP_MENU+8, 9, 27, 25, 3, 0, "Portal Master - Level req Wintergrasp"),
(15, @GOSSIP_MENU+8, 8, 27, 25, 3, 0, "Portal Master - Level req Icecrown"),
(15, @GOSSIP_MENU+8, 7, 27, 25, 3, 0, "Portal Master - Level req Storm Peaks"),
(15, @GOSSIP_MENU+8, 6, 27, 25, 3, 0, "Portal Master - Level req Crystalsong Forest"),
(15, @GOSSIP_MENU+8, 5, 27, 20, 3, 0, "Portal Master - Level req Sholazar Basin"),
(15, @GOSSIP_MENU+8, 4, 27, 20, 3, 0, "Portal Master - Level req Zul'Drak"),
(15, @GOSSIP_MENU+8, 3, 27, 15, 3, 0, "Portal Master - Level req Grizzly Hills"),
(15, @GOSSIP_MENU+8, 2, 27, 15, 3, 0, "Portal Master - Level req Dragonblight"),
(15, @GOSSIP_MENU+8, 1, 27, 10, 3, 0, "Portal Master - Level req Howling Fjord"),
(15, @GOSSIP_MENU+8, 0, 27, 10, 3, 0, "Portal Master - Level req Borean Tundra"),
-- Outland Teleport level restrictions
(15, @GOSSIP_MENU+7, 6, 27, 25, 3, 0, "Portal Master - Level req Shadowmoon Valley"),
(15, @GOSSIP_MENU+7, 5, 27, 25, 3, 0, "Portal Master - Level req Netherstorm"),
(15, @GOSSIP_MENU+7, 4, 27, 20, 3, 0, "Portal Master - Level req Blade's Edge Mountains"),
(15, @GOSSIP_MENU+7, 3, 27, 15, 3, 0, "Portal Master - Level req Nagrand"),
(15, @GOSSIP_MENU+7, 2, 27, 15, 3, 0, "Portal Master - Level req Terokkar Forest"),
(15, @GOSSIP_MENU+7, 1, 27, 10, 3, 0, "Portal Master - Level req Zangarmarsh"),
(15, @GOSSIP_MENU+7, 0, 27, 10, 3, 0, "Portal Master - Level req Hellfire Peninsula"),
-- Kalimdor teleport level restrictions // Ajouter uldum
(15, @GOSSIP_MENU+6, 19, 27, 15, 3, 0, "Portal Master - Level req Uldum"),
(15, @GOSSIP_MENU+6, 18, 27, 15, 3, 0, "Portal Master - Level req Winterspring"),
(15, @GOSSIP_MENU+6, 17, 27, 15, 3, 0, "Portal Master - Level req Silithus"),
(15, @GOSSIP_MENU+6, 16, 27, 15, 3, 0, "Portal Master - Level req Un'Goro Crater"),
(15, @GOSSIP_MENU+6, 15, 27, 15, 3, 0, "Portal Master - Level req Felwood"),
(15, @GOSSIP_MENU+6, 14, 27, 5, 3, 0, "Portal Master - Level req Azshara"),
(15, @GOSSIP_MENU+6, 13, 27, 15, 3, 0, "Portal Master - Level req Tanaris Desert"),
(15, @GOSSIP_MENU+6, 12, 27, 15, 3, 0, "Portal Master - Level req Feralas"),
(15, @GOSSIP_MENU+6, 11, 27, 15, 3, 0, "Portal Master - Level req Dustwallow Marsh"),
(15, @GOSSIP_MENU+6, 10, 27, 10, 3, 0, "Portal Master - Level req Desolace"),
(15, @GOSSIP_MENU+6, 9, 27, 15, 3, 0, "Portal Master - Level req Thousand Needles"),
(15, @GOSSIP_MENU+6, 8, 27, 7, 3, 0, "Portal Master - Level req Ashenvale Forest"),
(15, @GOSSIP_MENU+6, 7, 27, 10, 3, 0, "Portal Master - Level req Stonetalon Mountains"),
(15, @GOSSIP_MENU+6, 6, 27, 5, 3, 0, "Portal Master - Level req The Barrens"),
(15, @GOSSIP_MENU+6, 5, 27, 5, 3, 0, "Portal Master - Level req Darkshore"),
(15, @GOSSIP_MENU+6, 4, 27, 1, 3, 0, "Portal Master - Level req Bloodmyst Isle"),
-- Eastern Kingdoms level restrictions
(15, @GOSSIP_MENU+5, 23, 27, 25, 3, 0, "Portal Master - Level req Isle of Quel'Danas"),
(15, @GOSSIP_MENU+5, 22, 27, 15, 3, 0, "Portal Master - Level req Eastern Plaguelands"),
(15, @GOSSIP_MENU+5, 21, 27, 15, 3, 0, "Portal Master - Level req Western Plaguelands"),
(15, @GOSSIP_MENU+5, 20, 27, 15, 3, 0, "Portal Master - Level req Burning Steppes"),
(15, @GOSSIP_MENU+5, 19, 27, 15, 3, 0, "Portal Master - Level req The Blasted Lands"),
(15, @GOSSIP_MENU+5, 18, 27, 15, 3, 0, "Portal Master - Level req Searing Gorge"),
(15, @GOSSIP_MENU+5, 17, 27, 10, 3, 0, "Portal Master - Level req The Hinterlands"),
(15, @GOSSIP_MENU+5, 16, 27, 15, 3, 0, "Portal Master - Level req Swamp of Sorrows"),
(15, @GOSSIP_MENU+5, 15, 27, 15, 3, 0, "Portal Master - Level req Badlands"),
(15, @GOSSIP_MENU+5, 14, 27, 10, 3, 0, "Portal Master - Level req Stranglethorn Vale"),
(15, @GOSSIP_MENU+5, 13, 27, 10, 3, 0, "Portal Master - Level req Arathi Highlands"),
(15, @GOSSIP_MENU+5, 12, 27, 10, 3, 0, "Portal Master - Level req Alterac Mountains"),
(15, @GOSSIP_MENU+5, 11, 27, 10, 3, 0, "Portal Master - Level req Wetlands"),
(15, @GOSSIP_MENU+5, 10, 27, 7, 3, 0, "Portal Master - Level req Hillsbrad Foothills"),
(15, @GOSSIP_MENU+5, 9, 27, 10, 3, 0, "Portal Master - Level req Duskwood"),
(15, @GOSSIP_MENU+5, 8, 27, 7, 3, 0, "Portal Master - Level req Redridge mountains"),
(15, @GOSSIP_MENU+5, 7, 27, 5, 3, 0, "Portal Master - Level req Westfall"),
(15, @GOSSIP_MENU+5, 6, 27, 5, 3, 0, "Portal Master - Level req Silverpine Forest"),
(15, @GOSSIP_MENU+5, 5, 27, 5, 3, 0, "Portal Master - Level req Loch modan"),
(15, @GOSSIP_MENU+5, 4, 27, 1, 3, 0, "Portal Master - Level req Ghostlands"),
-- Raid Teleports level restrictions
(15, @GOSSIP_MENU+4, 22, 27, 30, 3, 0, "Portal Master - Level req Zul'Aman"),
(15, @GOSSIP_MENU+4, 21, 27, 35, 3, 0, "Portal Master - Level req Zul'Gurub"),
(15, @GOSSIP_MENU+4, 19, 27, 30, 3, 0, "Portal Master - Level req Vault of Archavon"),
(15, @GOSSIP_MENU+4, 18, 27, 30, 3, 0, "Portal Master - Level req Ulduar"),
(15, @GOSSIP_MENU+4, 17, 27, 30, 3, 0, "Portal Master - Level req The Obsidian Sanctum"),
(15, @GOSSIP_MENU+4, 16, 27, 30, 3, 0, "Portal Master - Level req The Eye of Eternity"),
(15, @GOSSIP_MENU+4, 15, 27, 30, 3, 0, "Portal Master - Level req Temple of Ahn'Qiraj"),
(15, @GOSSIP_MENU+4, 14, 27, 30, 3, 0, "Portal Master - Level req The Eye"),
(15, @GOSSIP_MENU+4, 13, 27, 30, 3, 0, "Portal Master - Level req Sunwell Plateau"),
(15, @GOSSIP_MENU+4, 12, 27, 30, 3, 0, "Portal Master - Level req Ruins of Ahn'Qiraj"),
(15, @GOSSIP_MENU+4, 11, 27, 30, 3, 0, "Portal Master - Level req Onyxia's Lair"),
(15, @GOSSIP_MENU+4, 10, 27, 30, 3, 0, "Portal Master - Level req Naxxramas"),
(15, @GOSSIP_MENU+4, 9, 27, 30, 3, 0, "Portal Master - Level req Molten Core"),
(15, @GOSSIP_MENU+4, 8, 27, 30, 3, 0, "Portal Master - Level req Karazhan"),
(15, @GOSSIP_MENU+4, 7, 27, 30, 3, 0, "Portal Master - Level req Icecrown Citadel"),
(15, @GOSSIP_MENU+4, 6, 27, 30, 3, 0, "Portal Master - Level req Magtheridon's Lair"),
(15, @GOSSIP_MENU+4, 5, 27, 30, 3, 0, "Portal Master - Level req Gruul's Lair"),
(15, @GOSSIP_MENU+4, 4, 27, 30, 3, 0, "Portal Master - Level req Trial of the Crusader"),
(15, @GOSSIP_MENU+4, 3, 27, 30, 3, 0, "Portal Master - Level req Serpentshrine Cavern"),
(15, @GOSSIP_MENU+4, 2, 27, 30, 3, 0, "Portal Master - Level req Hyjal Summit"),
(15, @GOSSIP_MENU+4, 1, 27, 30, 3, 0, "Portal Master - Level req Blackwing Lair"),
(15, @GOSSIP_MENU+4, 0, 27, 30, 3, 0, "Portal Master - Level req Black Temple"),
-- Wrath Dungeons level restrictions
(15, @GOSSIP_MENU+3, 11, 27, 20, 3, 0, "Portal Master - Level req Utgarde Pinnacle"),
(15, @GOSSIP_MENU+3, 10, 27, 30, 3, 0, "Portal Master - Level req Utgarde Keep"),
(15, @GOSSIP_MENU+3, 9, 27, 20, 3, 0, "Portal Master - Level req Halls of Stone"),
(15, @GOSSIP_MENU+3, 8, 27, 30, 3, 0, "Portal Master - Level req Halls of Lightning"),
(15, @GOSSIP_MENU+3, 7, 27, 10, 3, 0, "Portal Master - Level req The Violet Hold"),
(15, @GOSSIP_MENU+3, 6, 27, 15, 3, 0, "Portal Master - Level req The Nexus Dungeons"),
(15, @GOSSIP_MENU+3, 5, 27, 25, 3, 0, "Portal Master - Level req Icecrown Citadel Dungeons"),
(15, @GOSSIP_MENU+3, 4, 27, 20, 3, 0, "Portal Master - Level req Gundrak"),
(15, @GOSSIP_MENU+3, 3, 27, 30, 3, 0, "Portal Master - Level req Drak'Tharon Keep"),
(15, @GOSSIP_MENU+3, 2, 27, 25, 3, 0, "Portal Master - Level req Trial of the Champion"),
(15, @GOSSIP_MENU+3, 1, 27, 25, 3, 0, "Portal Master - Level req The Culling of Stratholme"),
(15, @GOSSIP_MENU+3, 0, 27, 30, 3, 0, "Portal Master - Level req Azjol-Nerub"),
-- BC Dungeons level restrictions
(15, @GOSSIP_MENU+2, 5, 27, 30, 3, 0, "Portal Master - Level req Tempest Keep"),
(15, @GOSSIP_MENU+2, 4, 27, 25, 3, 0, "Portal Master - Level req Magisters' Terrace"),
(15, @GOSSIP_MENU+2, 3, 27, 10, 3, 0, "Portal Master - Level req Hellfire Citadel"),
(15, @GOSSIP_MENU+2, 2, 27, 10, 3, 0, "Portal Master - Level req Coilfang Reservoir"),
(15, @GOSSIP_MENU+2, 1, 27, 30, 3, 0, "Portal Master - Level req Caverns of Time"),
(15, @GOSSIP_MENU+2, 0, 27, 20, 3, 0, "Portal Master - Level req Auchindoun"),
-- Classic Dungeons level restriction
(15, @GOSSIP_MENU+1, 18, 27, 15, 3, 0, "Portal Master - Level req Zul'Farrak"),
(15, @GOSSIP_MENU+1, 17, 27, 15, 3, 0, "Portal Master - Level req Uldaman"),
(15, @GOSSIP_MENU+1, 16, 27, 20, 3, 0, "Portal Master - Level req Sunken Temple"),
(15, @GOSSIP_MENU+1, 15, 27, 20, 3, 0, "Portal Master - Level req Stratholme"),
(15, @GOSSIP_MENU+1, 14, 27, 10, 3, 0, "Portal Master - Level req Scholomance"),
(15, @GOSSIP_MENU+1, 13, 27, 10, 3, 0, "Portal Master - Level req Maraudon"),
(15, @GOSSIP_MENU+1, 12, 27, 15, 3, 0, "Portal Master - Level req Dire Maul"),
(15, @GOSSIP_MENU+1, 11, 27, 20, 3, 0, "Portal Master - Level req Blackrock Spire"),
(15, @GOSSIP_MENU+1, 10, 27, 20, 3, 0, "Portal Master - Level req Blackrock Depths"),
(15, @GOSSIP_MENU+1, 9, 27, 10, 3, 0, "Portal Master - Level req Blackfathom Deeps"),
(15, @GOSSIP_MENU+1, 8, 27, 8, 3, 0, "Portal Master - Level req Wailing Caverns"),
(15, @GOSSIP_MENU+1, 7, 27, 8, 3, 0, "Portal Master - Level req Shadowfang Keep"),
(15, @GOSSIP_MENU+1, 6, 27, 10, 3, 0, "Portal Master - Level req Scarlet Monastery"),
(15, @GOSSIP_MENU+1, 5, 27, 10, 3, 0, "Portal Master - Level req Razorfen Kraul"),
(15, @GOSSIP_MENU+1, 4, 27, 15, 3, 0, "Portal Master - Level req Razorfen Downs"),
(15, @GOSSIP_MENU+1, 3, 27, 7, 3, 0, "Portal Master - Level req Ragefire Chasm"),
(15, @GOSSIP_MENU+1, 2, 27, 10, 3, 0, "Portal Master - Level req The Stockade"),
(15, @GOSSIP_MENU+1, 1, 27, 7, 3, 0, "Portal Master - Level req The Deadmines"),
(15, @GOSSIP_MENU+1, 0, 27, 10, 3, 0, "Portal Master - Level req Gnomeregan"),
-- Main Cats level restrictions
(15, @GOSSIP_MENU, 21, 27, 70, 3, 0, "Portal Master - Level req The War Within"),
(15, @GOSSIP_MENU, 22, 27, 15, 3, 0, "Portal Master - Level req Pandaria"),
(15, @GOSSIP_MENU, 23, 27, 15, 3, 0, "Portal Master - Level req Draenor"),
(15, @GOSSIP_MENU, 24, 27, 10, 3, 0, "Portal Master - Level req Legion"),
(15, @GOSSIP_MENU, 25, 27, 10, 3, 0, "Portal Master - Level req BFA"),
(15, @GOSSIP_MENU, 26, 27, 10, 3, 0, "Portal Master - Level req Shadowlands"),
(15, @GOSSIP_MENU, 27, 27, 10, 3, 0, "Portal Master - Level req Dragonflight"),
(15, @GOSSIP_MENU, 20, 27, 30, 3, 0, "Portal Master - Level req Old Raid Teleports"),
(15, @GOSSIP_MENU, 19, 27, 15, 3, 0, "Portal Master - Level req Wrath Dungeons"),
(15, @GOSSIP_MENU, 18, 27, 10, 3, 0, "Portal Master - Level req BC Dungeons"),
(15, @GOSSIP_MENU, 17, 27, 7, 3, 0, "Portal Master - Level req Classic Dungeons"),
(15, @GOSSIP_MENU, 16, 27, 10, 3, 0, "Portal Master - Level req Northrend"),
(15, @GOSSIP_MENU, 15, 27, 10, 3, 0, "Portal Master - Level req Outland"),
(15, @GOSSIP_MENU, 2, 27, 10, 3, 0, "Portal Master - Level req PvP Zones"),
-- Fin
-- Ajout The War Within
(15, @GOSSIP_MENU+10, 3, 27, 78, 3, 0, "Portal Master - Level req Weaver's Lair(Azj-Kahet)"),
(15, @GOSSIP_MENU+10, 2, 27, 75, 3, 0, "Portal Master - Level req Mereldar (Hallowfall)"),
(15, @GOSSIP_MENU+10, 1, 27, 73, 3, 0, "Portal Master - Level req Taelloch (The Ringing Deeps"),
(15, @GOSSIP_MENU+10, 0, 27, 70, 3, 0, "Portal Master - Level req Dornogal (Isle of Dorn)"),
-- Pandaria
(15, @GOSSIP_MENU+11, 3, 27, 23, 3, 0, "Portal Master - Level req Pao'don Alliance"),
(15, @GOSSIP_MENU+11, 2, 27, 23, 3, 0, "Portal Master - Level req Rosée de Miel Horde"),
(15, @GOSSIP_MENU+11, 1, 27, 23, 3, 0, "Portal Master - Level req Sanctuaire des Sept étoiles Alliance"), -- Sanctuaire des Sept étoiles Alliance
(15, @GOSSIP_MENU+11, 0, 27, 23, 3, 0, "Portal Master - Level req Sanctuaire des deux lunes Horde"), -- Sanctuaire des deux lunes Horde
-- Draenor
(15, @GOSSIP_MENU+12, 5, 27, 35, 3, 0, "Portal Master - Level req Nagrand"),
(15, @GOSSIP_MENU+12, 4, 27, 20, 3, 0, "Portal Master - Level req Talador"),
(15, @GOSSIP_MENU+12, 3, 27, 23, 3, 0, "Portal Master - Level req Shadowmoon Valley"),
(15, @GOSSIP_MENU+12, 2, 27, 30, 3, 0, "Portal Master - Level req Spires of Arak"),
(15, @GOSSIP_MENU+12, 1, 27, 15, 3, 0, "Portal Master - Level req Gorgrond"),
(15, @GOSSIP_MENU+12, 0, 27, 23, 3, 0, "Portal Master - Level req Frostfire Ridge"),
-- Legion
(15, @GOSSIP_MENU+13, 5, 27, 45, 3, 0, "Portal Master - Level req Argus"),
(15, @GOSSIP_MENU+13, 4, 27, 10, 3, 0, "Portal Master - Level req Val'sharah"),
(15, @GOSSIP_MENU+13, 3, 27, 10, 3, 0, "Portal Master - Level req Highmountain"),
(15, @GOSSIP_MENU+13, 2, 27, 10, 3, 0, "Portal Master - Level req Stormheim"),
(15, @GOSSIP_MENU+13, 1, 27, 45, 3, 0, "Portal Master - Level req Suramar"),
(15, @GOSSIP_MENU+13, 0, 27, 10, 3, 0, "Portal Master - Level req Azsuna" ),
-- BFA
(15, @GOSSIP_MENU+14, 5, 27, 10, 3, 0, "Portal Master - Level req Zuldazar"),
(15, @GOSSIP_MENU+14, 4, 27, 20, 3, 0, "Portal Master - Level req Nazmir"),
(15, @GOSSIP_MENU+14, 3, 27, 30, 3, 0, "Portal Master - Level req Vol'dun"),
(15, @GOSSIP_MENU+14, 2, 27, 10, 3, 0, "Portal Master - Level req Tiragarde Sound"),
(15, @GOSSIP_MENU+14, 1, 27, 20, 3, 0, "Portal Master - Level req Drustvar"),
(15, @GOSSIP_MENU+14, 0, 27, 30, 3, 0, "Portal Master - Level req Stormsong Valley"),
-- Shadowlands
(15, @GOSSIP_MENU+15, 5, 27, 10, 3, 0, "Portal Master - Level req - The Maw"),
(15, @GOSSIP_MENU+15, 4, 27, 10, 3, 0, "Portal Master - Level req - Revendreth"),
(15, @GOSSIP_MENU+15, 3, 27, 10, 3, 0, "Portal Master - Level req - Ardenweald"),
(15, @GOSSIP_MENU+15, 2, 27, 10, 3, 0, "Portal Master - Level req - Bastion"),
(15, @GOSSIP_MENU+15, 1, 27, 10, 3, 0, "Portal Master - Level req - Maldraxxus"),
(15, @GOSSIP_MENU+15, 0, 27, 10, 3, 0, "Portal Master - Level req - Oribos"),
-- Dragonflight
(15, @GOSSIP_MENU+16, 6, 27, 70, 3, 0, "Portal Master - Level req Dragonscale Basecamp(Zaralek Cavern)"),
(15, @GOSSIP_MENU+16, 5, 27, 70, 3, 0, "Portal Master - Level req Bel'ameth(Amirdrassil)"),
(15, @GOSSIP_MENU+16, 4, 27, 70, 3, 0, "Portal Master - Level req Old Weyrn Grounds(The Forbidden Reach)"),
(15, @GOSSIP_MENU+16, 3, 27, 30, 3, 0, "Portal Master - Level req Camp Antonidas(The Azure Span)"),
(15, @GOSSIP_MENU+16, 2, 27, 20, 3, 0, "Portal Master - Level req Maruukai(Ohn'ahran Plains)"),
(15, @GOSSIP_MENU+16, 1, 27, 10, 3, 0, "Portal Master - Level req The Concord Observatory(The Waking Shores)"),
(15, @GOSSIP_MENU+16, 0, 27, 40, 3, 0, "Portal Master - Level req Valdrakken (Thaldraszus)"),
-- Cities
(15, @GOSSIP_MENU+17, 9, 27, 10, 3, 0, "Portal Master - Level req Dalaran"),
(15, @GOSSIP_MENU+17, 10, 27, 10, 3, 0, "Portal Master - Level req Shattrath"),
-- Pvp
(15, @GOSSIP_MENU+18, 0, 27, 10, 3, 0, "Portal Master - Level req Gurubashi"),
-- New starting Zone
(15, @GOSSIP_MENU+19, 0, 27, 2, 3, 0, "Portal Master - Level req");

-- Gossip options:
INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
-- Main Categories
(@GOSSIP_MENU, 1, NULL, "Capitals & Cities", @GOSSIP_MENU+17, 0, 0, 0, NULL), -- Viles et capitales = menu + 17
(@GOSSIP_MENU, 2, NULL, "PvP Zones", @GOSSIP_MENU+18, 0, 0, 0, NULL), -- Viles et capitales = menu + 18
(@GOSSIP_MENU, 3, NULL, "New Starting Zone", @GOSSIP_MENU+19, 0, 0, 0, NULL), -- Nouvelle zone de départ = menu + 19
(@GOSSIP_MENU, 13, NULL, "Eastern Kingdoms", @GOSSIP_MENU+5, 0, 0, 0, NULL),
(@GOSSIP_MENU, 14, NULL, "Kalimdor", @GOSSIP_MENU+6, 0, 0, 0, NULL),
(@GOSSIP_MENU, 15, NULL, "Outland", @GOSSIP_MENU+7, 0, 0, 0, NULL),
(@GOSSIP_MENU, 16, NULL, "Northrend", @GOSSIP_MENU+8, 0, 0, 0, NULL),
(@GOSSIP_MENU, 17, NULL, "Classic Dungeons", @GOSSIP_MENU+1, 0, 0, 0, NULL),
(@GOSSIP_MENU, 18, NULL, "BC Dungeons", @GOSSIP_MENU+2, 0, 0, 0, NULL),
(@GOSSIP_MENU, 19, NULL, "Wrath Dungeons", @GOSSIP_MENU+3, 0, 0, 0, NULL),
(@GOSSIP_MENU, 20, NULL, "Old Raid Teleports", @GOSSIP_MENU+4, 0, 0, 0, NULL),
(@GOSSIP_MENU, 21, NULL, "The War Within", @GOSSIP_MENU+10, 0, 0, 0, NULL), -- Ajout The War Within = menu + 10
(@GOSSIP_MENU, 22, NULL, "Pandaria", @GOSSIP_MENU+11, 0, 0, 0, NULL), -- Ajout Pandaria = menu + 11
(@GOSSIP_MENU, 23, NULL, "Draenor", @GOSSIP_MENU+12, 0, 0, 0, NULL), -- Ajout Draenor = menu + 12
(@GOSSIP_MENU, 24, NULL, "Legion", @GOSSIP_MENU+13, 0, 0, 0, NULL), -- Ajout Legion = menu + 13
(@GOSSIP_MENU, 25, NULL, "BFA", @GOSSIP_MENU+14, 0, 0, 0, NULL), -- Ajout BFA = menu + 14
(@GOSSIP_MENU, 26, NULL, "Shadowlands", @GOSSIP_MENU+15, 0, 0, 0, NULL), -- Ajout Shadowlands = menu + 15
(@GOSSIP_MENU, 27, NULL, "Dragonflight", @GOSSIP_MENU+16, 0, 0, 0, NULL), -- Ajout Dragonflight = menu + 16
-- Sub Categories
(@GOSSIP_MENU+1, 0, NULL, "Gnomeregan", 0, 0, 0, 0, "Are you sure, that you want to go to Gnomeregan?"),
(@GOSSIP_MENU+1, 1, NULL, "The Deadmines", 0, 0, 0, 0, "Are you sure, that you want to go to The Deadmines?"),
(@GOSSIP_MENU+1, 2, NULL, "The Stockade", 0, 0, 0, 0, "Are you sure, that you want to go to The Stockade?"),
(@GOSSIP_MENU+1, 3, NULL, "Ragefire Chasm", 0, 0, 0, 0, "Are you sure, that you want to go to Ragefire Chasm?"),
(@GOSSIP_MENU+1, 4, NULL, "Razorfen Downs", 0, 0, 0, 0, "Are you sure, that you want to go to Razorfen Downs?"),
(@GOSSIP_MENU+1, 5, NULL, "Razorfen Kraul", 0, 0, 0, 0, "Are you sure, that you want to go to Razorfen Kraul?"),
(@GOSSIP_MENU+1, 6, NULL, "Scarlet Monastery", 0, 0, 0, 0, "Are you sure, that you want to go to Scarlet Monastery?"),
(@GOSSIP_MENU+1, 7, NULL, "Shadowfang Keep", 0, 0, 0, 0, "Are you sure, that you want to go to Shadowfang Keep?"),
(@GOSSIP_MENU+1, 8, NULL, "Wailing Caverns", 0, 0, 0, 0, "Are you sure, that you want to go to Wailing Caverns?"),
(@GOSSIP_MENU+1, 9, NULL, "Blackfathom Deeps", 0, 0, 0, 0, "Are you sure, that you want to go to Blackfathom Deeps?"),
(@GOSSIP_MENU+1, 10, NULL, "Blackrock Depths", 0, 0, 0, 0, "Are you sure, that you want to go to Blackrock Depths?"),
(@GOSSIP_MENU+1, 11, NULL, "Blackrock Spire", 0, 0, 0, 0, "Are you sure, that you want to go to Blackrock Spire?"),
(@GOSSIP_MENU+1, 12, NULL, "Dire Maul", 0, 0, 0, 0, "Are you sure, that you want to go to Dire Maul?"),
(@GOSSIP_MENU+1, 13, NULL, "Maraudon", 0, 0, 0, 0, "Are you sure, that you want to go to Maraudon?"),
(@GOSSIP_MENU+1, 14, NULL, "Scholomance", 0, 0, 0, 0, "Are you sure, that you want to go to Scholomance?"),
(@GOSSIP_MENU+1, 15, NULL, "Stratholme", 0, 0, 0, 0, "Are you sure, that you want to go to Stratholme?"),
(@GOSSIP_MENU+1, 16, NULL, "Sunken Temple", 0, 0, 0, 0, "Are you sure, that you want to go to Sunken Temple?"),
(@GOSSIP_MENU+1, 17, NULL, "Uldaman", 0, 0, 0, 0, "Are you sure, that you want to go to Uldaman?"),
(@GOSSIP_MENU+1, 18, NULL, "Zul'Farrak", 0, 0, 0, 0, "Are you sure, that you want to go to Zul'Farrak?"),
(@GOSSIP_MENU+1, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+2, 0, NULL, "Auchindoun", 0, 0, 0, 0, "Are you sure, that you want to go to Auchindoun?"),
(@GOSSIP_MENU+2, 1, NULL, "Caverns of Time", 0, 0, 0, 0, "Are you sure, that you want to go to Caverns of Time?"),
(@GOSSIP_MENU+2, 2, NULL, "Coilfang Reservoir", 0, 0, 0, 0, "Are you sure, that you want to go to Coilfang Reservoir?"),
(@GOSSIP_MENU+2, 3, NULL, "Hellfire Citadel", 0, 0, 0, 0, "Are you sure, that you want to go to Hellfire Citadel?"),
(@GOSSIP_MENU+2, 4, NULL, "Magisters' Terrace", 0, 0, 0, 0, "Are you sure, that you want to go to Magisters' Terrace?"),
(@GOSSIP_MENU+2, 5, NULL, "Tempest Keep", 0, 0, 0, 0, "Are you sure, that you want to go to Tempest Keep?"),
(@GOSSIP_MENU+2, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+3, 0, NULL, "Azjol-Nerub", 0, 0, 0, 0, "Are you sure, that you want to go to Azjol-Nerub?"),
(@GOSSIP_MENU+3, 1, NULL, "The Culling of Stratholme", 0, 0, 0, 0, "Are you sure, that you want to go to The Culling of Stratholme?"),
(@GOSSIP_MENU+3, 2, NULL, "Trial of the Champion", 0, 0, 0, 0, "Are you sure, that you want to go to Trial of the Champion?"),
(@GOSSIP_MENU+3, 3, NULL, "Drak'Tharon Keep", 0, 0, 0, 0, "Are you sure, that you want to go to Drak'Tharon Keep?"),
(@GOSSIP_MENU+3, 4, NULL, "Gundrak", 0, 0, 0, 0, "Are you sure, that you want to go to Gundrak?"),
(@GOSSIP_MENU+3, 5, NULL, "Icecrown Citadel Dungeons", 0, 0, 0, 0, "Are you sure, that you want to go to Icecrown Citadel Dungeons?"),
(@GOSSIP_MENU+3, 6, NULL, "The Nexus Dungeons", 0, 0, 0, 0, "Are you sure, that you want to go to The Nexus Dungeons?"),
(@GOSSIP_MENU+3, 7, NULL, "The Violet Hold", 0, 0, 0, 0, "Are you sure, that you want to go to The Violet Hold?"),
(@GOSSIP_MENU+3, 8, NULL, "Halls of Lightning", 0, 0, 0, 0, "Are you sure, that you want to go to Halls of Lightning?"),
(@GOSSIP_MENU+3, 9, NULL, "Halls of Stone", 0, 0, 0, 0, "Are you sure, that you want to go to Halls of Stone?"),
(@GOSSIP_MENU+3, 10, NULL, "Utgarde Keep", 0, 0, 0, 0, "Are you sure, that you want to go to Utgarde Keep?"),
(@GOSSIP_MENU+3, 11, NULL, "Utgarde Pinnacle", 0, 0, 0, 0, "Are you sure, that you want to go to Utgarde Pinnacle?"),
(@GOSSIP_MENU+3, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+4, 0, NULL, "Black Temple", 0, 0, 0, 0, "Are you sure, that you want to go to Black Temple?"),
(@GOSSIP_MENU+4, 1, NULL, "Blackwing Lair", 0, 0, 0, 0, "Are you sure, that you want to go to Blackwing Lair?"),
(@GOSSIP_MENU+4, 2, NULL, "Hyjal Summit", 0, 0, 0, 0, "Are you sure, that you want to go to Hyjal Summit?"),
(@GOSSIP_MENU+4, 3, NULL, "Serpentshrine Cavern", 0, 0, 0, 0, "Are you sure, that you want to go to Serpentshrine Cavern?"),
(@GOSSIP_MENU+4, 4, NULL, "Trial of the Crusader", 0, 0, 0, 0, "Are you sure, that you want to go to Trial of the Crusader?"),
(@GOSSIP_MENU+4, 5, NULL, "Gruul's Lair", 0, 0, 0, 0, "Are you sure, that you want to go to Gruul's Lair?"),
(@GOSSIP_MENU+4, 6, NULL, "Magtheridon's Lair", 0, 0, 0, 0, "Are you sure, that you want to go to Magtheridon's Lair?"),
(@GOSSIP_MENU+4, 7, NULL, "Icecrown Citadel", 0, 0, 0, 0, "Are you sure, that you want to go to Icecrown Citadel?"),
(@GOSSIP_MENU+4, 8, NULL, "Karazhan", 0, 0, 0, 0, "Are you sure, that you want to go to Karazhan?"),
(@GOSSIP_MENU+4, 9, NULL, "Molten Core", 0, 0, 0, 0, "Are you sure, that you want to go to Molten Core?"),
(@GOSSIP_MENU+4, 10, NULL, "Naxxramas", 0, 0, 0, 0, "Are you sure, that you want to go to Naxxramas?"),
(@GOSSIP_MENU+4, 11, NULL, "Onyxia's Lair", 0, 0, 0, 0, "Are you sure, that you want to go to Onyxia's Lair?"),
(@GOSSIP_MENU+4, 12, NULL, "Ruins of Ahn'Qiraj", 0, 0, 0, 0, "Are you sure, that you want to go to Ruins of Ahn'Qiraj?"),
(@GOSSIP_MENU+4, 13, NULL, "Sunwell Plateau", 0, 0, 0, 0, "Are you sure, that you want to go to Sunwell Plateau?"),
(@GOSSIP_MENU+4, 14, NULL, "The Eye", 0, 0, 0, 0, "Are you sure, that you want to go to The Eye?"),
(@GOSSIP_MENU+4, 15, NULL, "Temple of Ahn'Qiraj", 0, 0, 0, 0, "Are you sure, that you want to go to Temple of Ahn'Qiraj?"),
(@GOSSIP_MENU+4, 16, NULL, "The Eye of Eternity", 0, 0, 0, 0, "Are you sure, that you want to go to The Eye of Eternity?"),
(@GOSSIP_MENU+4, 17, NULL, "The Obsidian Sanctum", 0, 0, 0, 0, "Are you sure, that you want to go to The Obsidian Sanctum?"),
(@GOSSIP_MENU+4, 18, NULL, "Ulduar", 0, 0, 0, 0, "Are you sure, that you want to go to Ulduar?"),
(@GOSSIP_MENU+4, 19, NULL, "Vault of Archavon", 0, 0, 0, 0, "Are you sure, that you want to go to Vault of Archavon?"),
(@GOSSIP_MENU+4, 21, NULL, "Zul'Gurub", 0, 0, 0, 0, "Are you sure, that you want to go to Zul'Gurub?"),
(@GOSSIP_MENU+4, 22, NULL, "Zul'Aman", 0, 0, 0, 0, "Are you sure, that you want to go to Zul'Aman?"),
(@GOSSIP_MENU+4, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+5, 0, NULL, "Elwynn Forest", 0, 0, 0, 0, "Are you sure, that you want to go to Elwynn Forest?"),
(@GOSSIP_MENU+5, 1, NULL, "Eversong Woods", 0, 0, 0, 0, "Are you sure, that you want to go to Eversong Woods?"),
(@GOSSIP_MENU+5, 2, NULL, "Dun Morogh", 0, 0, 0, 0, "Are you sure, that you want to go to Dun Morogh?"),
(@GOSSIP_MENU+5, 3, NULL, "Tirisfal Glades", 0, 0, 0, 0, "Are you sure, that you want to go to Tirisfal Glades?"),
(@GOSSIP_MENU+5, 4, NULL, "Ghostlands", 0, 0, 0, 0, "Are you sure, that you want to go to Ghostlands?"),
(@GOSSIP_MENU+5, 5, NULL, "Loch modan", 0, 0, 0, 0, "Are you sure, that you want to go to Loch modan?"),
(@GOSSIP_MENU+5, 6, NULL, "Silverpine Forest", 0, 0, 0, 0, "Are you sure, that you want to go to Silverpine Forest?"),
(@GOSSIP_MENU+5, 7, NULL, "Westfall", 0, 0, 0, 0, "Are you sure, that you want to go to Westfall?"),
(@GOSSIP_MENU+5, 8, NULL, "Redridge mountains", 0, 0, 0, 0, "Are you sure, that you want to go to Redridge mountains?"),
(@GOSSIP_MENU+5, 9, NULL, "Duskwood", 0, 0, 0, 0, "Are you sure, that you want to go to Duskwood?"),
(@GOSSIP_MENU+5, 10, NULL, "Hillsbrad Foothills", 0, 0, 0, 0, "Are you sure, that you want to go to Hillsbrad Foothills?"),
(@GOSSIP_MENU+5, 11, NULL, "Wetlands", 0, 0, 0, 0, "Are you sure, that you want to go to Wetlands?"),
(@GOSSIP_MENU+5, 12, NULL, "Alterac Mountains", 0, 0, 0, 0, "Are you sure, that you want to go to Alterac Mountains?"),
(@GOSSIP_MENU+5, 13, NULL, "Arathi Highlands", 0, 0, 0, 0, "Are you sure, that you want to go to Arathi Highlands?"),
(@GOSSIP_MENU+5, 14, NULL, "Stranglethorn Vale", 0, 0, 0, 0, "Are you sure, that you want to go to Stranglethorn Vale?"),
(@GOSSIP_MENU+5, 15, NULL, "Badlands", 0, 0, 0, 0, "Are you sure, that you want to go to Badlands?"),
(@GOSSIP_MENU+5, 16, NULL, "Swamp of Sorrows", 0, 0, 0, 0, "Are you sure, that you want to go to Swamp of Sorrows?"),
(@GOSSIP_MENU+5, 17, NULL, "The Hinterlands", 0, 0, 0, 0, "Are you sure, that you want to go to The Hinterlands?"),
(@GOSSIP_MENU+5, 18, NULL, "Searing Gorge", 0, 0, 0, 0, "Are you sure, that you want to go to Searing Gorge?"),
(@GOSSIP_MENU+5, 19, NULL, "The Blasted Lands", 0, 0, 0, 0, "Are you sure, that you want to go to The Blasted Lands?"),
(@GOSSIP_MENU+5, 20, NULL, "Burning Steppes", 0, 0, 0, 0, "Are you sure, that you want to go to Burning Steppes?"),
(@GOSSIP_MENU+5, 21, NULL, "Western Plaguelands", 0, 0, 0, 0, "Are you sure, that you want to go to Western Plaguelands?"),
(@GOSSIP_MENU+5, 22, NULL, "Eastern Plaguelands", 0, 0, 0, 0, "Are you sure, that you want to go to Eastern Plaguelands?"),
(@GOSSIP_MENU+5, 23, NULL, "Isle of Quel'Danas", 0, 0, 0, 0, "Are you sure, that you want to go to Isle of Quel'Danas?"),
(@GOSSIP_MENU+5, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+6, 0, NULL, "Azuremyst Isle", 0, 0, 0, 0, "Are you sure, that you want to go to Azuremyst Isle?"),
(@GOSSIP_MENU+6, 1, NULL, "Teldrassil", 0, 0, 0, 0, "Are you sure, that you want to go to Teldrassil?"),
(@GOSSIP_MENU+6, 2, NULL, "Durotar", 0, 0, 0, 0, "Are you sure, that you want to go to Durotar?"),
(@GOSSIP_MENU+6, 3, NULL, "Mulgore", 0, 0, 0, 0, "Are you sure, that you want to go to Mulgore?"),
(@GOSSIP_MENU+6, 4, NULL, "Bloodmyst Isle", 0, 0, 0, 0, "Are you sure, that you want to go to Bloodmyst Isle?"),
(@GOSSIP_MENU+6, 5, NULL, "Darkshore", 0, 0, 0, 0, "Are you sure, that you want to go to Darkshore?"),
(@GOSSIP_MENU+6, 6, NULL, "The Barrens", 0, 0, 0, 0, "Are you sure, that you want to go to The Barrens?"),
(@GOSSIP_MENU+6, 7, NULL, "Stonetalon Mountains", 0, 0, 0, 0, "Are you sure, that you want to go to Stonetalon Mountains?"),
(@GOSSIP_MENU+6, 8, NULL, "Ashenvale Forest", 0, 0, 0, 0, "Are you sure, that you want to go to Ashenvale Forest?"),
(@GOSSIP_MENU+6, 9, NULL, "Thousand Needles", 0, 0, 0, 0, "Are you sure, that you want to go to Thousand Needles?"),
(@GOSSIP_MENU+6, 10, NULL, "Desolace", 0, 0, 0, 0, "Are you sure, that you want to go to Desolace?"),
(@GOSSIP_MENU+6, 11, NULL, "Dustwallow Marsh", 0, 0, 0, 0, "Are you sure, that you want to go to Dustwallow Marsh?"),
(@GOSSIP_MENU+6, 12, NULL, "Feralas", 0, 0, 0, 0, "Are you sure, that you want to go to Feralas?"),
(@GOSSIP_MENU+6, 13, NULL, "Tanaris Desert", 0, 0, 0, 0, "Are you sure, that you want to go to Tanaris Desert?"),
(@GOSSIP_MENU+6, 14, NULL, "Azshara", 0, 0, 0, 0, "Are you sure, that you want to go to Azshara?"),
(@GOSSIP_MENU+6, 15, NULL, "Felwood", 0, 0, 0, 0, "Are you sure, that you want to go to Felwood?"),
(@GOSSIP_MENU+6, 16, NULL, "Un'Goro Crater", 0, 0, 0, 0, "Are you sure, that you want to go to Un'Goro Crater?"),
(@GOSSIP_MENU+6, 17, NULL, "Silithus", 0, 0, 0, 0, "Are you sure, that you want to go to Silithus?"),
(@GOSSIP_MENU+6, 18, NULL, "Winterspring", 0, 0, 0, 0, "Are you sure, that you want to go to Winterspring?"),
(@GOSSIP_MENU+6, 19, NULL, "Uldum", 0, 0, 0, 0, "Are you sure, that you want to go to Uldum?"),
(@GOSSIP_MENU+6, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+7, 0, NULL, "Hellfire Peninsula", 0, 0, 0, 0, "Are you sure, that you want to go to Hellfire Peninsula?"),
(@GOSSIP_MENU+7, 1, NULL, "Zangarmarsh", 0, 0, 0, 0, "Are you sure, that you want to go to Zangarmarsh?"),
(@GOSSIP_MENU+7, 2, NULL, "Terokkar Forest", 0, 0, 0, 0, "Are you sure, that you want to go to Terokkar Forest?"),
(@GOSSIP_MENU+7, 3, NULL, "Nagrand", 0, 0, 0, 0, "Are you sure, that you want to go to Nagrand?"),
(@GOSSIP_MENU+7, 4, NULL, "Blade's Edge Mountains", 0, 0, 0, 0, "Are you sure, that you want to go to Blade's Edge Mountains?"),
(@GOSSIP_MENU+7, 5, NULL, "Netherstorm", 0, 0, 0, 0, "Are you sure, that you want to go to Netherstorm?"),
(@GOSSIP_MENU+7, 6, NULL, "Shadowmoon Valley", 0, 0, 0, 0, "Are you sure, that you want to go to Shadowmoon Valley?"),
(@GOSSIP_MENU+7, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
(@GOSSIP_MENU+8, 0, NULL, "Borean Tundra", 0, 0, 0, 0, "Are you sure, that you want to go to Borean Tundra?"),
(@GOSSIP_MENU+8, 1, NULL, "Howling Fjord", 0, 0, 0, 0, "Are you sure, that you want to go to Howling Fjord?"),
(@GOSSIP_MENU+8, 2, NULL, "Dragonblight", 0, 0, 0, 0, "Are you sure, that you want to go to Dragonblight?"),
(@GOSSIP_MENU+8, 3, NULL, "Grizzly Hills", 0, 0, 0, 0, "Are you sure, that you want to go to Grizzly Hills?"),
(@GOSSIP_MENU+8, 4, NULL, "Zul'Drak", 0, 0, 0, 0, "Are you sure, that you want to go to Zul'Drak?"),
(@GOSSIP_MENU+8, 5, NULL, "Sholazar Basin", 0, 0, 0, 0, "Are you sure, that you want to go to Sholazar Basin?"),
(@GOSSIP_MENU+8, 6, NULL, "Crystalsong Forest", 0, 0, 0, 0, "Are you sure, that you want to go to Crystalsong Forest?"),
(@GOSSIP_MENU+8, 7, NULL, "Storm Peaks", 0, 0, 0, 0, "Are you sure, that you want to go to Storm Peaks?"),
(@GOSSIP_MENU+8, 8, NULL, "Icecrown", 0, 0, 0, 0, "Are you sure, that you want to go to Icecrown?"),
(@GOSSIP_MENU+8, 9, NULL, "Wintergrasp", 0, 0, 0, 0, "Are you sure, that you want to go to Wintergrasp?"),
(@GOSSIP_MENU+8, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Ajout The War Within
(@GOSSIP_MENU+10, 0, NULL, "Dornogal (Isle of Dorn)", 0, 0, 0, 0, "Are you sure, that you want to go to Dornogal?"),
(@GOSSIP_MENU+10, 1, NULL, "Taelloch (The Ringing Deeps)", 0, 0, 0, 0, "Are you sure, that you want to go to Taelloch?"),
(@GOSSIP_MENU+10, 2, NULL, "Mereldar (Hallowfall)", 0, 0, 0, 0, "Are you sure, that you want to go to Hallowfall?"),
(@GOSSIP_MENU+10, 3, NULL, "Weaver's Lair(Azj-Kahet)", 0, 0, 0, 0, "Are you sure, that you want to go to The Weaver's Lair?"),
(@GOSSIP_MENU+10, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Pandaria
(@GOSSIP_MENU+11, 0, NULL, "Sanctuaire des Deux Lunes", 0, 0, 0, 0, "Are you sure, that you want to go to Sanctuaire des Deux Lunes?"), -- Sanctuaire des deux lunes
(@GOSSIP_MENU+11, 1, NULL, "Sanctuaire des Sept étoiles", 0, 0, 0, 0, "Are you sure, that you want to go to Sanctuaire des Sept étoiles?"), -- Sanctuaire des Sept étoiles Alliance
(@GOSSIP_MENU+11, 2, NULL, "Honeydew Village", 0, 0, 0, 0, "Are you sure, that you want to go to Honeydew Village?"),
(@GOSSIP_MENU+11, 3, NULL, "Paw'don Village", 0, 0, 0, 0, "Are you sure, that you want to go to Paw'don Village?"),
(@GOSSIP_MENU+11, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
  -- Draenor
(@GOSSIP_MENU+12, 0, NULL, "Frostfire Ridge", 0, 0, 0, 0, "Are you sure, that you want to go to Frostfire Ridge?"),
(@GOSSIP_MENU+12, 1, NULL, "Gorgrond", 0, 0, 0, 0, "Are you sure, that you want to go to Gorgrond?"),
(@GOSSIP_MENU+12, 2, NULL, "Spires of Arak", 0, 0, 0, 0, "Are you sure, that you want to go to Spires of Arak?"),
(@GOSSIP_MENU+12, 3, NULL, "Shadowmoon Valley", 0, 0, 0, 0, "Are you sure, that you want to go to Shadowmoon Valley?"),
(@GOSSIP_MENU+12, 4, NULL, "Talador", 0, 0, 0, 0, "Are you sure, that you want to go to Talador?"),
(@GOSSIP_MENU+12, 5, NULL, "Nagrand", 0, 0, 0, 0, "Are you sure, that you want to go to Nagrand?"),
(@GOSSIP_MENU+12, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Legion
(@GOSSIP_MENU+13, 0, NULL, "Azsuna", 0, 0, 0, 0, "Are you sure, that you want to go to Azsuna?"),
(@GOSSIP_MENU+13, 1, NULL, "Suramar", 0, 0, 0, 0, "Are you sure, that you want to go to Suramar?"),
(@GOSSIP_MENU+13, 2, NULL, "Stormheim", 0, 0, 0, 0, "Are you sure, that you want to go to Stormheim?"),
(@GOSSIP_MENU+13, 3, NULL, "Highmountain", 0, 0, 0, 0, "Are you sure, that you want to go to Highmountain?"),
(@GOSSIP_MENU+13, 4, NULL, "Val'sharah", 0, 0, 0, 0, "Are you sure, that you want to go to Val'sharah?"),
(@GOSSIP_MENU+13, 5, NULL, "Argus", 0, 0, 0, 0, "Are you sure, that you want to go to Argus?"),
(@GOSSIP_MENU+13, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- BFA
(@GOSSIP_MENU+14, 0, NULL, "Stormsong Valley", 0, 0, 0, 0, "Are you sure, that you want to go to Stormsong Valley?"),
(@GOSSIP_MENU+14, 1, NULL, "Drustvar", 0, 0, 0, 0, "Are you sure, that you want to go to Drustvar?"),
(@GOSSIP_MENU+14, 2, NULL, "Tiragarde Sound", 0, 0, 0, 0, "Are you sure, that you want to go to Tiragarde Sound?"),
(@GOSSIP_MENU+14, 3, NULL, "Vol'dun", 0, 0, 0, 0, "Are you sure, that you want to go to Vol'dun?"),
(@GOSSIP_MENU+14, 4, NULL, "Nazmir", 0, 0, 0, 0, "Are you sure, that you want to go to Nazmir?"),
(@GOSSIP_MENU+14, 5, NULL, "Zuldazar", 0, 0, 0, 0, "Are you sure, that you want to go to Zuldazar?"),
(@GOSSIP_MENU+14, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Shadowlands
(@GOSSIP_MENU+15, 0, NULL, "Oribos", 0, 0, 0, 0, "Are you sure, that you want to go to Oribos?"),
(@GOSSIP_MENU+15, 1, NULL, "Maldraxxus", 0, 0, 0, 0, "Are you sure, that you want to go to Maldraxxus?"),
(@GOSSIP_MENU+15, 2, NULL, "Bastion", 0, 0, 0, 0, "Are you sure, that you want to go to Bastion?"),
(@GOSSIP_MENU+15, 3, NULL, "Ardenweald", 0, 0, 0, 0, "Are you sure, that you want to go to Ardenweald?"),
(@GOSSIP_MENU+15, 4, NULL, "Revendreth", 0, 0, 0, 0, "Are you sure, that you want to go to Revendreth?"),
(@GOSSIP_MENU+15, 5, NULL, "The Maw", 0, 0, 0, 0, "Are you sure, that you want to go to The Maw?"),
(@GOSSIP_MENU+15, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Dragonflight
(@GOSSIP_MENU+16, 0, NULL, "Valdrakken (Thaldraszus)", 0, 0, 0, 0, "Are you sure, that you want to go to Valdrakken?"),
(@GOSSIP_MENU+16, 1, NULL, "The Concord Observatory(The Waking Shores)", 0, 0, 0, 0, "Are you sure, that you want to go to The Concord Observatory?"),
(@GOSSIP_MENU+16, 2, NULL, "Maruukai(Ohn'ahran Plains)", 0, 0, 0, 0, "Are you sure, that you want to go to Maruukai?"),
(@GOSSIP_MENU+16, 3, NULL, "Camp Antonidas(The Azure Span)", 0, 0, 0, 0, "Are you sure, that you want to go to Camp Antonidas?"),
(@GOSSIP_MENU+16, 4, NULL, "Old Weyrn Grounds(The Forbidden Reach)", 0, 0, 0, 0, "Are you sure, that you want to go to Old Weyrn Grounds?"),
(@GOSSIP_MENU+16, 5, NULL, "Bel'ameth(Amirdrassil)", 0, 0, 0, 0, "Are you sure, that you want to go to Bel'ameth?"),
(@GOSSIP_MENU+16, 6, NULL, "Dragonscale Basecamp(Zaralek Cavern)", 0, 0, 0, 0, "Are you sure, that you want to go to Dragonscale Basecamp?"),
(@GOSSIP_MENU+16, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Viles et Capitales --
(@GOSSIP_MENU+17, 1, NULL, "Stormwind", 0, 0, 0, 0, "Are you sure, that you want to go to Stormwind?"),
(@GOSSIP_MENU+17, 2, NULL, "Orgrimmar", 0, 0, 0, 0, "Are you sure, that you want to go to Orgrimmar?"),
(@GOSSIP_MENU+17, 3, NULL, "Darnassus", 0, 0, 0, 0, "Are you sure, that you want to go to Darnassus?"),
(@GOSSIP_MENU+17, 4, NULL, "Ironforge", 0, 0, 0, 0, "Are you sure, that you want to go to Ironforge?"),
(@GOSSIP_MENU+17, 5, NULL, "Exodar", 0, 0, 0, 0, "Are you sure, that you want to go to Exodar?"),
(@GOSSIP_MENU+17, 6, NULL, "Thunder bluff", 0, 0, 0, 0, "Are you sure, that you want to go to Thunder bluff?"),
(@GOSSIP_MENU+17, 7, NULL, "Undercity", 0, 0, 0, 0, "Are you sure, that you want to go to Undercity?"),
(@GOSSIP_MENU+17, 8, NULL, "Silvermoon city", 0, 0, 0, 0, "Are you sure, that you want to go to Silvermoon city?"),
(@GOSSIP_MENU+17, 9, NULL, "Dalaran", 0, 0, 0, 0, "Are you sure, that you want to go to Dalaran?"),
(@GOSSIP_MENU+17, 10, NULL, "Shattrath", 0, 0, 0, 0, "Are you sure, that you want to go to Shattrath?"),
(@GOSSIP_MENU+17, 11, NULL, "Booty bay", 0, 0, 0, 0, "Are you sure, that you want to go to Booty bay?"),
(@GOSSIP_MENU+17, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- Pvp menu
(@GOSSIP_MENU+18, 0, NULL, "Gurubashi arena", 0, 0, 0, 0, "Are you sure, that you want to go to Gurubashi arena?"),
(@GOSSIP_MENU+18, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL),
-- New start zones
(@GOSSIP_MENU+19, 0, NULL, "Murloc Lair", 0, 0, 0, 0, "Are you sure, that you want to go to Murloc Lair?"),
(@GOSSIP_MENU+19, 50, NULL, "Back..", @GOSSIP_MENU, 0, 0, 0, NULL);

-- Teleport scripts:
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, `comment`) VALUES 
(@ENTRY, 0, 1, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8842.09, 626.358, 94.0867, 3.61363, "Teleporter script Hurlevent"),
(@ENTRY, 0, 2, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1579.580933, -4392.408203, 16.305311, 0.543025, "Teleporter script Orgrimmar"),
(@ENTRY, 0, 3, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -14281.9, 552.564, 8.90422, 0.860144, "Teleporter script Baie du butin"),
(@ENTRY, 0, 4, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 10, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1887.62, 5359.09, -12.4279, 4.40435, "Teleporter script Shattrath"),
(@ENTRY, 0, 5, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5809.55, 503.975, 657.526, 2.38338, "Teleporter script Dalaran"),
(@ENTRY, 0, 7, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9869.91, 2493.58, 1315.88, 2.78897, "Teleporter script Darnassus"),
(@ENTRY, 0, 8, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 4, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4900.47, -962.585, 501.455, 5.40538, "Teleporter script Forgefer"),
(@ENTRY, 0, 9, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3864.92, -11643.7, -137.644, 5.50862, "Teleporter script Exodar"),
(@ENTRY, 0, 10, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1274.45, 71.8601, 128.159, 2.80623, "Teleporter script pitons du tonnerre"),
(@ENTRY, 0, 11, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1633.75, 240.167, -43.1034, 6.26128, "Teleporter script Fossoyeuses"),
(@ENTRY, 0, 12, 0, 62, 0, 100, 0, @GOSSIP_MENU+17, 8, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9738.28, -7454.19, 13.5605, 0.043914, "Teleporter script Lune D'argent"),

(@ENTRY, 0, 13, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5163.54, 925.423, 257.181, 1.57423, "Teleporter script"),
(@ENTRY, 0, 14, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11209.6, 1666.54, 24.6974, 1.42053, "Teleporter script"),
(@ENTRY, 0, 15, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8799.15, 832.718, 97.6348, 6.04085, "Teleporter script"),
(@ENTRY, 0, 16, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1811.78, -4410.5, -18.4704, 5.20165, "Teleporter script"),
(@ENTRY, 0, 17, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4657.3, -2519.35, 81.0529, 4.54808, "Teleporter script"),
(@ENTRY, 0, 18, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4470.28, -1677.77, 81.3925, 1.16302, "Teleporter script"),
(@ENTRY, 0, 19, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2873.15, -764.523, 160.332, 5.10447, "Teleporter script"),
(@ENTRY, 0, 20, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -234.675, 1561.63, 76.8921, 1.24031, "Teleporter script"),
(@ENTRY, 0, 21, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -731.607, -2218.39, 17.0281, 2.78486, "Teleporter script"),
(@ENTRY, 0, 22, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4249.99, 740.102, -25.671, 1.34062, "Teleporter script"),
(@ENTRY, 0, 23, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7179.34, -921.212, 165.821, 5.09599, "Teleporter script"),
(@ENTRY, 0, 24, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7527.05, -1226.77, 285.732, 5.29626, "Teleporter script"),
(@ENTRY, 0, 25, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3520.14, 1119.38, 161.025, 4.70454, "Teleporter script"),
(@ENTRY, 0, 26, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1421.42, 2907.83, 137.415, 1.70718, "Teleporter script"),
(@ENTRY, 0, 27, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1269.64, -2556.21, 93.6088, 0.620623, "Teleporter script"),
(@ENTRY, 0, 28, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3352.92, -3379.03, 144.782, 6.25978, "Teleporter script"),
(@ENTRY, 0, 29, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10177.9, -3994.9, -111.239, 6.01885, "Teleporter script"),
(@ENTRY, 0, 30, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6071.37, -2955.16, 209.782, 0.015708, "Teleporter script"),
(@ENTRY, 0, 31, 0, 62, 0, 100, 0, @GOSSIP_MENU+1, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6801.19, -2893.02, 9.00388, 0.158639, "Teleporter script"),
(@ENTRY, 0, 32, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3324.49, 4943.45, -101.239, 4.63901, "Teleporter script"),
(@ENTRY, 0, 33, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8369.65, -4253.11, -204.272, -2.70526, "Teleporter script"),
(@ENTRY, 0, 34, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 738.865, 6865.77, -69.4659, 6.27655, "Teleporter script"),
(@ENTRY, 0, 35, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -347.29, 3089.82, 21.394, 5.68114, "Teleporter script"),
(@ENTRY, 0, 36, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12884.6, -7317.69, 65.5023, 4.799, "Teleporter script"),
(@ENTRY, 0, 37, 0, 62, 0, 100, 0, @GOSSIP_MENU+2, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3100.48, 1536.49, 190.3, 4.62226, "Teleporter script"),
(@ENTRY, 0, 38, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3707.86, 2150.23, 36.76, 3.22, "Teleporter script"),
(@ENTRY, 0, 39, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8756.39, -4440.68, -199.489, 4.66289, "Teleporter script"),
(@ENTRY, 0, 40, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8590.95, 791.792, 558.235, 3.13127, "Teleporter script"),
(@ENTRY, 0, 41, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4765.59, -2038.24, 229.363, 0.887627, "Teleporter script"),
(@ENTRY, 0, 42, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6722.44, -4640.67, 450.632, 3.91123, "Teleporter script"),
(@ENTRY, 0, 43, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5643.16, 2028.81, 798.274, 4.60242, "Teleporter script"),
(@ENTRY, 0, 44, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3782.89, 6965.23, 105.088, 6.14194, "Teleporter script"),
(@ENTRY, 0, 45, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5693.08, 502.588, 652.672, 4.0229, "Teleporter script"),
(@ENTRY, 0, 46, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9136.52, -1311.81, 1066.29, 5.19113, "Teleporter script"),
(@ENTRY, 0, 47, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8922.12, -1009.16, 1039.56, 1.57044, "Teleporter script"),
(@ENTRY, 0, 48, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1203.41, -4868.59, 41.2486, 0.283237, "Teleporter script"),
(@ENTRY, 0, 49, 0, 62, 0, 100, 0, @GOSSIP_MENU+3, 11, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1267.24, -4857.3, 215.764, 3.22768, "Teleporter script"),
(@ENTRY, 0, 50, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3649.92, 317.469, 35.2827, 2.94285, "Teleporter script"),
(@ENTRY, 0, 51, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 1, 0, 0, 62, 229, 0, 0, 0, 0, 0, 7, 0, 0, 0, 152.451, -474.881, 116.84, 0.001073, "Teleporter script"),
(@ENTRY, 0, 52, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8177.89, -4181.23, -167.552, 0.913338, "Teleporter script"),
(@ENTRY, 0, 53, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 797.855, 6865.77, -65.4165, 0.005938, "Teleporter script"),
(@ENTRY, 0, 54, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8515.61, 714.153, 558.248, 1.57753, "Teleporter script"),
(@ENTRY, 0, 55, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3530.06, 5104.08, 3.50861, 5.51117, "Teleporter script"),
(@ENTRY, 0, 56, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -336.411, 3130.46, -102.928, 5.20322, "Teleporter script"),
(@ENTRY, 0, 57, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5855.22, 2102.03, 635.991, 3.57899, "Teleporter script"),
(@ENTRY, 0, 58, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11118.9, -2010.33, 47.0819, 0.649895, "Teleporter script"),
(@ENTRY, 0, 59, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 9, 0, 0, 62, 230, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1126.64, -459.94, -102.535, 3.46095, "Teleporter script"),
(@ENTRY, 0, 60, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3668.72, -1262.46, 243.622, 4.785, "Teleporter script"),
(@ENTRY, 0, 61, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4708.27, -3727.64, 54.5589, 3.72786, "Teleporter script"),
(@ENTRY, 0, 62, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8409.82, 1499.06, 27.7179, 2.51868, "Teleporter script"),
(@ENTRY, 0, 63, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 13, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12574.1, -6774.81, 15.0904, 3.13788, "Teleporter script"),
(@ENTRY, 0, 64, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 14, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3088.49, 1381.57, 184.863, 4.61973, "Teleporter script"),
(@ENTRY, 0, 65, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8240.09, 1991.32, 129.072, 0.941603, "Teleporter script"),
(@ENTRY, 0, 66, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 16, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3784.17, 7028.84, 161.258, 5.79993, "Teleporter script"),
(@ENTRY, 0, 67, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 17, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3472.43, 264.923, -120.146, 3.27923, "Teleporter script"),
(@ENTRY, 0, 68, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 18, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9222.88, -1113.59, 1216.12, 6.27549, "Teleporter script"),
(@ENTRY, 0, 69, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 19, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5453.72, 2840.79, 421.28, 0, "Teleporter script"),
(@ENTRY, 0, 70, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11916.7, -1215.72, 92.289, 4.72454, "Teleporter script"),
(@ENTRY, 0, 71, 0, 62, 0, 100, 0, @GOSSIP_MENU+4, 22, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6851.78, -7972.57, 179.242, 4.64691, "Teleporter script"),
(@ENTRY, 0, 72, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9449.06, 64.8392, 56.3581, 3.07047, "Teleporter script"),
(@ENTRY, 0, 73, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9024.37, -6682.55, 16.8973, 3.14131, "Teleporter script"),
(@ENTRY, 0, 74, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5603.76, -482.704, 396.98, 5.23499, "Teleporter script"),
(@ENTRY, 0, 75, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 3, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2274.95, 323.918, 34.1137, 4.24367, "Teleporter script"),
(@ENTRY, 0, 76, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7595.73, -6819.6, 84.3718, 2.56561, "Teleporter script"),
(@ENTRY, 0, 77, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 5, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5405.85, -2894.15, 341.972, 5.48238, "Teleporter script"),
(@ENTRY, 0, 78, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 505.126, 1504.63, 124.808, 1.77987, "Teleporter script"),
(@ENTRY, 0, 79, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10684.9, 1033.63, 32.5389, 6.07384, "Teleporter script"),
(@ENTRY, 0, 80, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9447.8, -2270.85, 71.8224, 0.283853, "Teleporter script"),
(@ENTRY, 0, 81, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 9, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10531.7, -1281.91, 38.8647, 1.56959, "Teleporter script"),
(@ENTRY, 0, 82, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -385.805, -787.954, 54.6655, 1.03926, "Teleporter script"),
(@ENTRY, 0, 83, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3517.75, -913.401, 8.86625, 2.60705, "Teleporter script"),
(@ENTRY, 0, 84, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 275.049, -652.044, 130.296, 0.502032, "Teleporter script"),
(@ENTRY, 0, 85, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 13, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1581.45, -2704.06, 35.4168, 0.490373, "Teleporter script"),
(@ENTRY, 0, 86, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11921.7, -59.544, 39.7262, 3.73574, "Teleporter script"),
(@ENTRY, 0, 87, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6782.56, -3128.14, 240.48, 5.65912, "Teleporter script"),
(@ENTRY, 0, 88, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10368.6, -2731.3, 21.6537, 5.29238, "Teleporter script"),
(@ENTRY, 0, 89, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 112.406, -3929.74, 136.358, 0.981903, "Teleporter script"),
(@ENTRY, 0, 90, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 18, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6686.33, -1198.55, 240.027, 0.916887, "Teleporter script"),
(@ENTRY, 0, 91, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 19, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11184.7, -3019.31, 7.29238, 3.20542, "Teleporter script"),
(@ENTRY, 0, 92, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 20, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7979.78, -2105.72, 127.919, 5.10148, "Teleporter script"),
(@ENTRY, 0, 93, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1743.69, -1723.86, 59.6648, 5.23722, "Teleporter script"),
(@ENTRY, 0, 94, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 22, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2280.64, -5275.05, 82.0166, 4.7479, "Teleporter script"),
(@ENTRY, 0, 95, 0, 62, 0, 100, 0, @GOSSIP_MENU+5, 23, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12806.5, -6911.11, 41.1156, 2.22935, "Teleporter script"),
(@ENTRY, 0, 96, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4192.62, -12576.7, 36.7598, 1.62813, "Teleporter script"),
(@ENTRY, 0, 97, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9889.03, 915.869, 1307.43, 1.9336, "Teleporter script"),
(@ENTRY, 0, 98, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 228.978, -4741.87, 10.1027, 0.416883, "Teleporter script"),
(@ENTRY, 0, 99, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2473.87, -501.225, -9.42465, 0.6525, "Teleporter script"),
(@ENTRY, 0, 100, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2095.7, -11841.1, 51.1557, 6.19288, "Teleporter script"),
(@ENTRY, 0, 101, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6463.25, 683.986, 8.92792, 4.33534, "Teleporter script"),
(@ENTRY, 0, 102, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -575.772, -2652.45, 95.6384, 0.006469, "Teleporter script"),
(@ENTRY, 0, 103, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 7, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1574.89, 1031.57, 137.442, 3.8013, "Teleporter script"),
(@ENTRY, 0, 104, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1919.77, -2169.68, 94.6729, 6.14177, "Teleporter script"),
(@ENTRY, 0, 105, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5375.53, -2509.2, -40.432, 2.41885, "Teleporter script"),
(@ENTRY, 0, 106, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 10, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -656.056, 1510.12, 88.3746, 3.29553, "Teleporter script"),
(@ENTRY, 0, 107, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3350.12, -3064.85, 33.0364, 5.12666, "Teleporter script"),
(@ENTRY, 0, 108, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4808.31, 1040.51, 103.769, 2.90655, "Teleporter script"),
(@ENTRY, 0, 109, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6940.91, -3725.7, 48.9381, 3.11174, "Teleporter script"),
(@ENTRY, 0, 110, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 14, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3117.12, -4387.97, 91.9059, 5.49897, "Teleporter script"),
(@ENTRY, 0, 111, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3898.8, -1283.33, 220.519, 6.24307, "Teleporter script"),
(@ENTRY, 0, 112, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 16, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6291.55, -1158.62, -258.138, 0.457099, "Teleporter script"),
(@ENTRY, 0, 113, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 17, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6815.25, 730.015, 40.9483, 2.39066, "Teleporter script"),
(@ENTRY, 0, 114, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6658.57, -4553.48, 718.019, 5.18088, "Teleporter script"),
(@ENTRY, 0, 197, 0, 62, 0, 100, 0, @GOSSIP_MENU+6, 19, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9565.059570, -925.044983, 100.353996, 3.106690, "Teleporter script Uldum"),
(@ENTRY, 0, 115, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -207.335, 2035.92, 96.464, 1.59676, "Teleporter script"),
(@ENTRY, 0, 116, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -220.297, 5378.58, 23.3223, 1.61718, "Teleporter script"),
(@ENTRY, 0, 117, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2266.23, 4244.73, 1.47728, 3.68426, "Teleporter script"),
(@ENTRY, 0, 118, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1610.85, 7733.62, -17.2773, 1.33522, "Teleporter script"),
(@ENTRY, 0, 119, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2029.75, 6232.07, 133.495, 1.30395, "Teleporter script"),
(@ENTRY, 0, 120, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3271.2, 3811.61, 143.153, 3.44101, "Teleporter script"),
(@ENTRY, 0, 121, 0, 62, 0, 100, 0, @GOSSIP_MENU+7, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3681.01, 2350.76, 76.587, 4.25995, "Teleporter script"),
(@ENTRY, 0, 122, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2954.24, 5379.13, 60.4538, 2.55544, "Teleporter script"),
(@ENTRY, 0, 123, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 1, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 682.848, -3978.3, 230.161, 1.54207, "Teleporter script"),
(@ENTRY, 0, 124, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2678.17, 891.826, 4.37494, 0.101121, "Teleporter script"),
(@ENTRY, 0, 125, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4017.35, -3403.85, 290, 5.35431, "Teleporter script"),
(@ENTRY, 0, 126, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5560.23, -3211.66, 371.709, 5.55055, "Teleporter script"),
(@ENTRY, 0, 127, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5614.67, 5818.86, -69.722, 3.60807, "Teleporter script"),
(@ENTRY, 0, 128, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5411.17, -966.37, 167.082, 1.57167, "Teleporter script"),
(@ENTRY, 0, 129, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6120.46, -1013.89, 408.39, 5.12322, "Teleporter script"),
(@ENTRY, 0, 130, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8323.28, 2763.5, 655.093, 2.87223, "Teleporter script"),
(@ENTRY, 0, 131, 0, 62, 0, 100, 0, @GOSSIP_MENU+8, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4522.23, 2828.01, 389.975, 0.215009, "Teleporter script"),
-- The War Within
(@ENTRY, 0, 132, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 0, 0, 0, 62, 2552, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2871.7, -2444.6, 266.761, 3.93463, "Dornogal"),
(@ENTRY, 0, 133, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 1, 0, 0, 62, 2601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1024.496338, -4057.271973, 127.450256, 4.602788, "Taelloch"),
(@ENTRY, 0, 134, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 2, 0, 0, 62, 2601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1889.526611, 902.888611, 126.953232, 5.164327, "Mereldar"),
(@ENTRY, 0, 135, 0, 62, 0, 100, 0, @GOSSIP_MENU+10, 3, 0, 0, 62, 2601, 0, 0, 0, 0, 0, 7, 0, 0, 0, -351.960938, -1401.111328, -1087.506348, 5.839779, "Weaver's Lair"),
-- Pandaria 
(@ENTRY, 0, 136, 0, 62, 0, 100, 0, @GOSSIP_MENU+11, 0, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1581.477051, 918.753906, 473.700897, 6.224266, "Sanctuaire des deux lunes"), -- Sanctuaire des deux lunes Horde
(@ENTRY, 0, 137, 0, 62, 0, 100, 0, @GOSSIP_MENU+11, 1, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 891.921082, 305.094269, 506.095520, 3.648135, "Sanctuaire des Sept étoiles"),-- Sanctuaire des Sept étoiles Alliance
(@ENTRY, 0, 138, 0, 62, 0, 100, 0, @GOSSIP_MENU+11, 2, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3013.943604, -561.714844, 251.631882, 4.730609, "Rosée de Miel Horde"),
(@ENTRY, 0, 139, 0, 62, 0, 100, 0, @GOSSIP_MENU+11, 3, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, -268.999146, -1749.277344, 61.838829, 0.010637, "Pao'don Alliance"),
-- Draenor
(@ENTRY, 0, 140, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 0, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5942.060547, 3073.001465, 156.752869, 1.698809, "Frostfire Ridge"),
(@ENTRY, 0, 141, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 1, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6803.529785, 1219.949951, 69.685204, 0.398962, "Gorgrond"),
(@ENTRY, 0, 141, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 2, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 918.395569, 923.785278, 179.189331, 3.654449, "Spires of Arak"),
(@ENTRY, 0, 143, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 3, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1426.820679, 29.369268, 63.870968, 0.515623, "Shadowmoon Valley?"),
(@ENTRY, 0, 144, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 4, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3130.451172, 3331.752698, 45.991688, 1.086193, "Talador"),
(@ENTRY, 0, 145, 0, 62, 0, 100, 0, @GOSSIP_MENU+12, 5, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3049.108154, 4674.790039, 132.576553, 0.037684, "Nagrand"),
-- Legion
(@ENTRY, 0, 146, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 0, 0, 0, 62, 1220, 0, 0, 0, 0, 0, 7, 0, 0, 0, -119.738823, 6696.608887, 39.665440, 1.215372, "Azsuna"),
(@ENTRY, 0, 147, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 1, 0, 0, 62, 1220, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1718.557861, 4622.358398, 123.946373, 5.184787, "Suramar"),
(@ENTRY, 0, 148, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 2, 0, 0, 62, 1220, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3877.694580, 2066.170898, 248.422531, 1.737664, "Stormheim"),
(@ENTRY, 0, 149, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 3, 0, 0, 62, 1220, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3844.965088, 5142.033203, 646.669006, 5.326949, "Highmountain"),
(@ENTRY, 0, 150, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 4, 0, 0, 62, 1220, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2810.769287, 6454.503418, 208.198471, 0.744141, "Val'sharah"),
(@ENTRY, 0, 151, 0, 62, 0, 100, 0, @GOSSIP_MENU+13, 5, 0, 0, 62, 1669, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5646.250000, -6504.490234, 177.514999, 5.385670, "Argus"),
-- BFA
(@ENTRY, 0, 152, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 0, 0, 0, 62, 1643, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2110.827637, 51.675644, 111.290985, 4.652913, "Stormsong Valley"),
(@ENTRY, 0, 153, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 1, 0, 0, 62, 1643, 0, 0, 0, 0, 0, 7, 0, 0, 0, -634.309998, 3140.370117, 323.536987, 4.798200, "Drustvar"),
(@ENTRY, 0, 154, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 2, 0, 0, 62, 1643, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1224.989868, -878.398560, 95.142876, 4.177746, "Tiragarde Sound"),
(@ENTRY, 0, 155, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 3, 0, 0, 62, 1642, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2364.734131, 3887.955322, 45.039127, 5.361872, "Vol'dun"),
(@ENTRY, 0, 156, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 4, 0, 0, 62, 1642, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2146.342773, 645.582947, 31.128311, 6.151201, "Nazmir"),
(@ENTRY, 0, 157, 0, 62, 0, 100, 0, @GOSSIP_MENU+14, 5, 0, 0, 62, 1642, 0, 0, 0, 0, 0, 7, 0, 0, 0, -750.597656, 199.699860, 207.755981, 0.150769, "Zuldazar"),
-- Shadowlands
(@ENTRY, 0, 158, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 0, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1834.00, 1542.00, 5274.156250, 4.71239, "Oribos"),
(@ENTRY, 0, 159, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 1, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2585.715088, -2525.375488, 3307.614502, 5.431034, "Maldraxxus"),
(@ENTRY, 0, 160, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 2, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2943.555664, -4871.619629, 6704.122559, 1.531532, "Bastion"),
(@ENTRY, 0, 161, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 3, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6927.196289, 884.558716, 5668.544434, 1.134904, "Ardenweald"),
(@ENTRY, 0, 162, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 4, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2628.641846, 6034.142578, 4115.692871, 4.708455, "Revendreth"),
(@ENTRY, 0, 163, 0, 62, 0, 100, 0, @GOSSIP_MENU+15, 5, 0, 0, 62, 2222, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4608.442871, 6795.189941, 4868.089844, 5.749121, "The Maw"),
-- Dragonflight
(@ENTRY, 0, 164, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 0, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, 115.639, -939.723, 836.586, 0, "Valdrakken"),
(@ENTRY, 0, 165, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 1, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2934.35, 188.591, 498.596, 0, "The Concord Observatory"),
(@ENTRY, 0, 166, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 2, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, -620.498, 2198.33, 436.668, 0, "Maruukai"),
(@ENTRY, 0, 167, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 3, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3817.34, 505.7, 647.829, 0, "Camp Antonidas"),
(@ENTRY, 0, 168, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 4, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6510.56, -3318.14, 162.985, 0, "Old Weyrn Grounds"),
(@ENTRY, 0, 169, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 5, 0, 0, 62, 2444, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1697.679688, 7147.415039, 200.854599, 0, "Bel'ameth"),
(@ENTRY, 0, 170, 0, 62, 0, 100, 0, @GOSSIP_MENU+16, 6, 0, 0, 62, 2454, 0, 0, 0, 0, 0, 7, 0, 0, 0, -982.407410, 3150.312744, 44.202740, 0.891442, "Dragonscale Basecamp"),
-- Pvp menu
(@ENTRY, 0, 171, 0, 62, 0, 100, 0, @GOSSIP_MENU+18, 0/*position from gossipMenuOption*/, 0, 0, 62, 0/*map*/, 0, 0, 0, 0, 0, 7, 0, 0, 0, -13181.8, 339.356, 42.9805, 1.18013, "Teleporter script Gurubashi"),
-- New starting Zone
(@ENTRY, 0, 172, 0, 62, 0, 100, 0, @GOSSIP_MENU+19, 0, 0, 0, 62, 2175, 0, 0, 0, 0, 0, 7, 0, 0, 0, -447.384033, -2160.622803, 0.340489, 0.195470, "Murloc Lair");
