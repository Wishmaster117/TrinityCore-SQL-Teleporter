/*
TrinityCore Portal Master auto add script
By Wishmaster
*/

-- AUTO ADD A NEW CATEGORY WITH THE FIRST SUBMENU FOR TABLE HOTFIXES--
SET
@VBUILD         := 57388, -- Build Version
@TEXT_ID        := 900000000, -- Don't change this
@MAX_TEXT_ID    := 900000999, -- Don't change this
@BROADCAST_TEXT := "Put here the text will appear at the header of téléportation submenu"; -- Header Of The category


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