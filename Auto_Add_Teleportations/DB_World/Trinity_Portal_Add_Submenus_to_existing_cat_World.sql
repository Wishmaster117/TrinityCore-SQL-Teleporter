/*
TrinityCore Portal Master auto add script
By Wishmaster
*/

-- AUTO ADD SUBMENUS TO A SPECIFIC CATEGORY --

SET
@ENTRY               := 9000000000, -- NPC ID
@GOSSIP_MENU         := 2000020, -- ID de la catégorie spécifique définie manuellement
@ICON                := NULL,
-- @SUB_MENU_BACK_ORDER := 15,
@TELE_NAME           := "Name Of The Teleport Location",
@POPUP               := "Are you sure?",
@REQ_LEVEL           := 80,
@FACTION             := 67, -- ConditionValue1 469 = Alliance, 67 = Horde
@MAP                 := 0,
@X                   := 0.0,
@Y                   := 0.0,
@Z                   := 0.0,
@O                   := 0.0,
@COST                := 0; -- copper

-- -------------------------------------- --
--            World DB                    --
-- -------------------------------------- --

-- Définition manuelle de @SUB_MENU avec le numéro de la catégorie cible
SET @SUB_MENU := @GOSSIP_MENU;

-- Récupération automatique de la valeur de @SUB_MENU_BACK_ORDER basée sur l'OptionID pour "Back.." et le MenuID
SET @SUB_MENU_BACK_ORDER := (
    SELECT OptionID
    FROM gossip_menu_option
    WHERE MenuID = @SUB_MENU
      AND OptionText = 'Back..'
    LIMIT 1
);

-- Calcul de @SUB_MENU_ORDER pour obtenir la prochaine valeur disponible (incrémenté de 1)
SET @SUB_MENU_ORDER := (
    SELECT MIN(n) 
    FROM (
        SELECT t1.i + t10.i * 10 AS n
        FROM (SELECT 0 AS i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
              UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS t1
        CROSS JOIN (SELECT 0 AS i UNION ALL SELECT 1) AS t10
    ) AS numbers
    WHERE n < @SUB_MENU_BACK_ORDER
      AND n > (
          SELECT COALESCE(MAX(OptionID), -1)
          FROM gossip_menu_option
          WHERE MenuID = @SUB_MENU
            AND OptionID < @SUB_MENU_BACK_ORDER
      )
);

-- Vérification du résultat final
-- SELECT @SUB_MENU_ORDER, @SUB_MENU_BACK_ORDER, @GOSSIP_MENU;

-- Calcul pour l'entrée ID du smart script
SET @SID := (SELECT `id` FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type` = 0 ORDER BY `id` DESC LIMIT 1) + 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, IFNULL(@SID, 1), 0, 62, 0, 100, 0, @SUB_MENU, @SUB_MENU_ORDER, 0, 0, 62, @MAP, 0, 0, 0, 0, 0, 7, 0, 0, 0, @X, @Y, @Z, @O, CONCAT("Teleporter script - ", @TELE_NAME));

-- Options de téléportation de la sous-catégorie spécifique
INSERT INTO gossip_menu_option (MenuID, OptionID, OverrideIconID, OptionText, ActionMenuID, ActionPoiID, BoxCoded, BoxMoney, BoxText) VALUES
(@SUB_MENU , @SUB_MENU_ORDER, @ICON , @TELE_NAME, 0, 0, 0, @COST, @POPUP);

-- Condition pour le niveau
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 27, @REQ_LEVEL, 3, 0, CONCAT("Portal Master Level req - ", @TELE_NAME));

-- Condition pour la faction (décommentez si nécessaire)
/* INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `Comment`) VALUES
(15, @SUB_MENU, @SUB_MENU_ORDER, 6, @FACTION, 0, 0, CONCAT("Portal Master Faction req - ", @TELE_NAME)); */

-- Traductions dans gossip_menu_option_locale pour les sous-menus de téléportation
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
