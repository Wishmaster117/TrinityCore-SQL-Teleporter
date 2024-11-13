/*
TrinityCore Portal Master auto add script
By Wishmaster
*/

-- Add a category with submenus
SET
@VBUILD         := 57388, -- Build Version
@TEXT_ID        := 9000000,
@MAX_TEXT_ID    := 9000500,
@BROADCAST_TEXT := "Put here the text will appear at the header of téléportation submenu";


-- -------------------------------------- --
--            Hotfixes DB                 --
-- -------------------------------------- --

-- Calcul de @NEW_BROAD_TEXT_ID basé sur la dernière valeur de ID dans la fourchette [@TEXT_ID, @MAX_TEXT_ID]
SET @NEW_BROAD_TEXT_ID := (
    SELECT COALESCE(MAX(ID), @TEXT_ID) + 1
    FROM broadcast_text
    WHERE ID BETWEEN @TEXT_ID AND @MAX_TEXT_ID
);

-- Hotfix broadcast_text table -- Submenu header
INSERT INTO `broadcast_text` (`Text`, `Text1`, `ID`, `LanguageID`, `ConditionID`, `EmotesID`, `Flags`, `ChatBubbleDurationMs`, `VoiceOverPriorityID`, `SoundKitID1`, `SoundKitID2`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `VerifiedBuild`) VALUES
(@BROADCAST_TEXT , '', @NEW_BROAD_TEXT_ID, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD);

-- Hotfix broadcast_text table -- Submenu translation
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES 
(@NEW_BROAD_TEXT_ID, 'deDE', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'esES', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'esMX', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'frFR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'itIT', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'koKR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'ptBR', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'ruRU', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'zhCN', '$B ADD TRANSLATION $B', '', @VBUILD),
(@NEW_BROAD_TEXT_ID, 'zhTW', '$B ADD TRANSLATION $B', '', @VBUILD);





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
