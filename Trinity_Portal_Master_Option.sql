/*
TrinityCore Portal Master Option
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/

-- Add a catégory with submenus
SET
@VBUILD         := 57388,
@ENTRY          := 9000000, -- NPC ID
@GOSSIP_MENU :=  2000000,
@GOSSIP_MENU_POSITION :=  4,
@ICON := NULL,
@CAT_NAME :=  "Custom Location",
@SUB_MENU :=  20,
@SUB_MENU_ORDER :=  0,
@SUB_MENU_BACK_ORDER :=  15,
@TELE_NAME := "Custom Location",
@POPUP := "Are you sure?",
@FACTION := 67, -- ConditionValue1 469 = Alliance, 67 = Horde
@REQ_LEVEL :=  80,
@MAP := 0,
@X := 0.0,
@Y := 0.0,
@Z := 0.0,
@O := 0.0,
@TEXT_ID        := 9000000,
@LAST_TEXT_ID_PLUS_ONE        := 15,
@BROAD_TEXT     := 9000000,
@BROADCAST_TEXT     := "Put here the text will appear at the header of téléportation submenu",
;

INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION, @ICON, @CAT_NAME, @GOSSIP_MENU+@SUB_MENU, 0, 0, 0, NULL);

INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@GOSSIP_MENU+@SUB_MENU , @SUB_MENU_ORDER, @ICON , @TELE_NAME, 0, 0, 0, 0, @POPUP),
(@GOSSIP_MENU+@SUB_MENU , @SUB_MENU_BACK_ORDER, @ICON , "Back..", @GOSSIP_MENU, 0, 0, 0, NULL);

SET @SID := (SELECT `id` FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type` = 0 ORDER BY `id` DESC LIMIT 1) + 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, IFNULL(@SID, 1), 0, 62, 0, 100, 0, @GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 0, 0, 62, @MAP, 0, 0, 0, 0, 0, 7, 0, 0, 0, @X, @Y, @Z, @O, CONCAT("Teleporter script - ", @TELE_NAME));

-- Condition For Level
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 27, @REQ_LEVEL, 3, 0, CONCAT("Portal Master Level req - ", @TELE_NAME));

-- Condition for faction if Needed
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 6, @FACTION, 0, 0, CONCAT("Portal Master Fact req - ", @TELE_NAME));

INSERT INTO gossip_menu (`menuid`, `textid`, `VerifiedBuild`) VALUES
(@GOSSIP_MENU+@SUB_MENU, @TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, @VBUILD), -- New Starting Zone

INSERT INTO npc_text (`ID`, Probability0, `BroadcastTextID0`, `VerifiedBuild`) VALUES
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 1, @BROAD_TEXT+@LAST_TEXT_ID_PLUS_ONE, @VBUILD), -- New starting Zone

-- World DB

-- Table gossip_menu_option_locale for text header
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES 
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'deDE', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'esES', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'esMX', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'frFR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'itIT', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'koKR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'ptBR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'ruRU', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'zhCN', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_MENU_POSITION , 'zhTW', "ADD TRANSLATION", NULL),

-- Table gossip_menu_option_locale for submenus teleport locations

-- New Start Zone
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'deDE', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'esES', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'esMX', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'frFR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'itIT', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'koKR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'ptBR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'ruRU', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'zhCN', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_ORDER, 'zhTW', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),

(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'deDE', "Zurück..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'esES', "Volver..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'esMX', "Volver..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'frFR', "Retour..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'itIT', "Indietro..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'koKR', "뒤로..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'ptBR', "Voltar..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'ruRU', "Назад..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'zhCN', "返回..", NULL),
(@GOSSIP_MENU+@SUB_MENU, @SUB_MENU_BACK_ORDER, 'zhTW', "返回..", NULL);

-- Hotfixes DB --
-- Hotfix broadcast_text table -- Submenus headers
INSERT INTO `broadcast_text` (`Text`, `Text1`, `ID`, `LanguageID`, `ConditionID`, `EmotesID`, `Flags`, `ChatBubbleDurationMs`, `VoiceOverPriorityID`, `SoundKitID1`, `SoundKitID2`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `VerifiedBuild`) VALUES
(@BROADCAST_TEXT , '', @BROAD_TEXT+@LAST_TEXT_ID_PLUS_ONE, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- New starting Zone 

INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES 
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'deDE', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'esES', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'esMX', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'frFR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'itIT', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'koKR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'ptBR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'ruRU', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'zhCN', '$B ADD TRANSLATION $B', '', @VBUILD),
(@TEXT_ID+@LAST_TEXT_ID_PLUS_ONE, 'zhTW', '$B ADD TRANSLATION $B', '', @VBUILD),

-- Add submenus to a category

-- Have to be ported to master branch
SET
@NPC_ENTRY := 9000000, -- teleporter entry

@MENU_ID := 2000000, -- the menu's id, see gossip_menu_option.menu_id
@ID := 1, -- position in menu where you want the option to be in, see gossip_menu_option.id 0 to ......
@ICON := NULL,
@TELE_NAME := "Custom Location",
@POPUP := "Are you sure?",

@COST := 0, -- copper
@REQ_LEVEL := 0, -- 0 for no requirement
@FACTION := 0, -- 0 for no req. 469 - Alliance, 67 - Horde.

@MAP := 0,
@X := 0.0,
@Y := 0.0,
@Z := 0.0,
@O := 0.0;

UPDATE `gossip_menu_option` SET `optionid` = `optionid`+1 WHERE `menuid` = @MENU_ID AND `optionid` >= @ID ORDER BY `optionid` DESC;
UPDATE `conditions` SET `SourceEntry` = `SourceEntry`+1 WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MENU_ID AND `SourceEntry` >= @ID ORDER BY `SourceEntry` DESC;
UPDATE `smart_scripts` SET `event_param2` = `event_param2`+1 WHERE `entryorguid` = @NPC_ENTRY AND `source_type` = 0 AND `event_param1` = @MENU_ID AND `event_param2` >= @ID ORDER BY `event_param2` DESC;


INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OverrideIconID`, `OptionText`, `ActionMenuID`, ActionPoiID, BoxCoded, `BoxMoney`, `BoxText`) VALUES
(@MENU_ID, @ID, @ICON, @TELE_NAME, @MENU_ID, 0, 0, @COST, @POPUP);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @MENU_ID, @ID, 27, @REQ_LEVEL, 3, 0, CONCAT("Portal Master Level req - ", @TELE_NAME));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @MENU_ID, @ID, 6, @FACTION, 0, 0, CONCAT("Portal Master Fact req - ", @TELE_NAME));

SET @SID := (SELECT `id` FROM `smart_scripts` WHERE `entryorguid` = @NPC_ENTRY AND `source_type` = 0 ORDER BY `id` DESC LIMIT 1)+1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@NPC_ENTRY, 0, IFNULL(@SID, 1), 0, 62, 0, 100, 0, @MENU_ID, @ID, 0, 0, 62, @MAP, 0, 0, 0, 0, 0, 7, 0, 0, 0, @X, @Y, @Z, @O, CONCAT("Teleporter script - ", @TELE_NAME));

/*
TrinityCore Portal Master Option
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/
