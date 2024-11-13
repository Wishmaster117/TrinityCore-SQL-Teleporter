/*
TrinityCore Portal Master auto add script
By Wishmaster
*/

-- AUTO ADD A NEW CATEGORY WITH THE FIRST SUBMENU --
SET
@VBUILD          := 57388, -- Build Version
@ENTRY           := 9000000, -- NPC ID
@GOSSIP_MENU     :=  2000000,
@MAX_GOSSIP_MENU :=  2000500,
@ICON            := NULL,
@CAT_NAME        :=  "Name Of The Main Category",
@SUB_MENU_BACK_ORDER :=  15,
@TELE_NAME       := "Name Of The Teleport Location",
@POPUP           := "Are you sure?",
@FACTION         := 67, -- ConditionValue1 469 = Alliance, 67 = Horde 
@REQ_LEVEL       :=  80,
@MAP             := 0,
@X               := 0.0,
@Y               := 0.0,
@Z               := 0.0,
@O               := 0.0,
@TEXT_ID         := 9000000,
@MAX_TEXT_ID     := 9000500,
@COST            := 0; -- copper

-- -------------------------------------- --
--            World DB                    --
-- -------------------------------------- --

-- Calcul de @GOSSIP_CATEGORY_POSITION basé sur la dernière valeur de OptionID pour le MenuID donné
SET @GOSSIP_CATEGORY_POSITION := (
    SELECT COALESCE(MAX(OptionID), 0) + 1
    FROM gossip_menu_option
    WHERE MenuID = @GOSSIP_MENU
);

-- Calcul de @SUB_MENU basé sur la dernière valeur de MenuID dans la fourchette [@GOSSIP_MENU, @MAX_GOSSIP_MENU]
SET @SUB_MENU := (
    SELECT COALESCE(MAX(MenuID), @GOSSIP_MENU) + 1
    FROM gossip_menu_option
    WHERE MenuID BETWEEN @GOSSIP_MENU AND @MAX_GOSSIP_MENU
);

-- Calcul de @SUB_MENU_ORDER basé sur la dernière valeur de OptionID pour le MenuID = @SUB_MENU
SET @SUB_MENU_ORDER := (
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM gossip_menu_option
            WHERE MenuID = @SUB_MENU
        ) THEN (
            SELECT MAX(OptionID) + 1
            FROM gossip_menu_option
            WHERE MenuID = @SUB_MENU
        )
        ELSE 0
    END
);

-- Calcul de @NEW_TEXT_ID basé sur la dernière valeur de textid dans la fourchette [@TEXT_ID, @MAX_TEXT_ID]
SET @NEW_TEXT_ID := (
    SELECT COALESCE(MAX(textid), @TEXT_ID) + 1
    FROM gossip_menu
    WHERE textid BETWEEN @TEXT_ID AND @MAX_TEXT_ID
);

-- Calcul pour l'entée ID du smart script
SET @SID := (SELECT `id` FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type` = 0 ORDER BY `id` DESC LIMIT 1) + 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, IFNULL(@SID, 1), 0, 62, 0, 100, 0, @SUB_MENU, @SUB_MENU_ORDER, 0, 0, 62, @MAP, 0, 0, 0, 0, 0, 7, 0, 0, 0, @X, @Y, @Z, @O, CONCAT("Teleporter script - ", @TELE_NAME));

-- Main Category
INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION, @ICON, @CAT_NAME, @SUB_MENU, 0, 0, 0, NULL);

-- Teleportations options of the main Category
INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@SUB_MENU , @SUB_MENU_ORDER, @ICON , @TELE_NAME, 0, 0, 0, @COST, @POPUP),
(@SUB_MENU , @SUB_MENU_BACK_ORDER, @ICON , "Back..", @GOSSIP_MENU, 0, 0, 0, NULL);

-- Condition For Level
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 27, @REQ_LEVEL, 3, 0, CONCAT("Portal Master Level req - ", @TELE_NAME));

-- Condition for faction (uncomment if needed)
/* INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 6, @FACTION, 0, 0, CONCAT("Portal Master Fact req - ", @TELE_NAME)); */

-- Text Links
INSERT INTO gossip_menu (`menuid`, `textid`, `VerifiedBuild`) VALUES
(@SUB_MENU, @NEW_TEXT_ID, @VBUILD);

INSERT INTO npc_text (`ID`, Probability0, `BroadcastTextID0`, `VerifiedBuild`) VALUES
(@NEW_TEXT_ID, 1, @NEW_TEXT_ID, @VBUILD);

-- Table gossip_menu_option_locale Translations for text header
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES 
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'deDE', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'esES', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'esMX', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'frFR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'itIT', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'koKR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'ptBR', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'ruRU', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'zhCN', "ADD TRANSLATION", NULL),
(@GOSSIP_MENU, @GOSSIP_CATEGORY_POSITION , 'zhTW', "ADD TRANSLATION", NULL);

-- Table gossip_menu_option_locale Translations for submenus teleport locations
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES 
(@SUB_MENU, @SUB_MENU_ORDER, 'deDE', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'esES', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'esMX', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'frFR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'itIT', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'koKR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'ptBR', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'ruRU', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'zhCN', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_ORDER, 'zhTW', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?"),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'deDE', "Zurück..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'esES', "Volver..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'esMX', "Volver..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'frFR', "Retour..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'itIT', "Indietro..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'koKR', "뒤로..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'ptBR', "Voltar..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'ruRU', "Назад..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'zhCN', "返回..", NULL),
(@SUB_MENU, @SUB_MENU_BACK_ORDER, 'zhTW', "返回..", NULL);

