/*
TrinityCore Portal Master auto add script
By Wishmaster
*/

-- AUTO ADD SUBMENUS TO THE LAST CAT CREATED --
SET
@ENTRY           := 900000000, -- NPC ID
@GOSSIP_MENU     := 200000000, -- Don't change this
@MAX_GOSSIP_MENU := 200000999, -- Don't change this
@ICON            := NULL,
@SUB_MENU_BACK_ORDER :=  50, -- Don't change this
@TELE_NAME       := "Name Of The Teleport Location", -- Teleportation Location Name
@POPUP           := "Are you sure?", -- PopUp Menu
@REQ_LEVEL       := 80, -- Min level required
@FACTION         := 67, -- ConditionValue1 469 = Alliance, 67 = Horde 
@MAP             := 0, -- MapID
@X               := 0.0,
@Y               := 0.0,
@Z               := 0.0,
@O               := 0.0,
@COST            := 0; -- Amount of the téléportation cost in copper

-- -------------------------------------- --
--            World DB                    --
-- -------------------------------------- --

-- Calcul de @SUB_MENU basé sur la dernière valeur de MenuID dans la fourchette [@GOSSIP_MENU, @MAX_GOSSIP_MENU]
SET @SUB_MENU := (
    SELECT COALESCE(MAX(MenuID), @GOSSIP_MENU)
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
            SELECT MAX(OptionID) - @SUB_MENU_BACK_ORDER + 1
            FROM gossip_menu_option
            WHERE MenuID = @SUB_MENU
        )
        ELSE 0
    END
);

-- Calcul pour l'entée ID du smart script
SET @SID := (SELECT `id` FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type` = 0 ORDER BY `id` DESC LIMIT 1) + 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, IFNULL(@SID, 1), 0, 62, 0, 100, 0, @SUB_MENU, @SUB_MENU_ORDER, 0, 0, 62, @MAP, 0, 0, 0, 0, 0, 7, 0, 0, 0, @X, @Y, @Z, @O, CONCAT("Teleporter script - ", @TELE_NAME));

-- Teleportations options of the main Category
INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@SUB_MENU , @SUB_MENU_ORDER, @ICON , @TELE_NAME, 0, 0, 0, @COST, @POPUP);

-- Condition For Level
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 27, @REQ_LEVEL, 3, 0, CONCAT("Portal Master Level req - ", @TELE_NAME));

-- Condition for faction (uncomment if needed)
/* INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 6, @FACTION, 0, 0, CONCAT("Portal Master Fact req - ", @TELE_NAME)); */


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
(@SUB_MENU, @SUB_MENU_ORDER, 'zhTW', "TRANSLATED LOCATION NAME", "POPUP TRANSLATION ..Are you sure.......?");