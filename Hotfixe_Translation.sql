/* Ported to TrinityCore Master Branch by Wishmaster */

SET
@BROAD_TEXT     := 900000,
@VBUILD         := 56819;

-- Deleting code
DELETE FROM broadcast_text WHERE ID BETWEEN @BROAD_TEXT AND @BROAD_TEXT+4;
DELETE FROM broadcast_text_locale WHERE ID BETWEEN @BROAD_TEXT AND @BROAD_TEXT+4;

-- Table Hotfix -- Remettre le texte original de la ligne 200000 a chopper sur la bdd qui est en place sur le minipc
INSERT INTO `broadcast_text` (`Text`, `Text1`, `ID`, `LanguageID`, `ConditionID`, `EmotesID`, `Flags`, `ChatBubbleDurationMs`, `VoiceOverPriorityID`, `SoundKitID1`, `SoundKitID2`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `VerifiedBuild`) VALUES 
('$BRemember, Pandaria’s beauty is matched only by its danger. Last chance to chicken out!$B', '', @BROAD_TEXT+5, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Pandaria
('$BWhere would you like to be ported?$B', '', @BROAD_TEXT+4, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$BBe careful with choosing raids, I wont be there if you wipe.$B', '', @BROAD_TEXT+3, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$BUp for some dungeon exploring?$B', '', @BROAD_TEXT+2, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B For the Horde!$B', '', @BROAD_TEXT+1, 0, 0, 0, 67, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B For The Alliance!$B', '', @BROAD_TEXT, 0, 0, 0, 69, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD);

-- Table Hotfix locale
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES 
(@BROAD_TEXT, 'deDE', '$B Für die Allianz!$B', '', @VBUILD),
(@BROAD_TEXT, 'esES', '$B ¡Por la Alianza!$B', '', @VBUILD),
(@BROAD_TEXT, 'esMX', '$B ¡Por la Alianza!$B', '', @VBUILD),
(@BROAD_TEXT, 'frFR', '$B Pour l\'Alliance ! $B', '', @VBUILD),
(@BROAD_TEXT, 'itIT', '$B Per l\'Alleanza!$B', '', @VBUILD),
(@BROAD_TEXT, 'koKR', '$B 얼라이언스를 위해!$B', '', @VBUILD),
(@BROAD_TEXT, 'ptBR', '$B Pela Aliança!$B', '', @VBUILD),
(@BROAD_TEXT, 'ruRU', '$B За Альянс!$B', '', @VBUILD),
(@BROAD_TEXT, 'zhCN', '$B 为联盟而战！$B', '', @VBUILD),
(@BROAD_TEXT, 'zhTW', '$B 為聯盟而戰！$B', '', @VBUILD),
(@BROAD_TEXT+1, 'deDE', '$B Für die Horde!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'esES', '$B ¡Por la Horda!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'esMX', '$B ¡Por la Horda!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'frFR', '$B Pour la Horde ! $B', '', @VBUILD),
(@BROAD_TEXT+1, 'itIT', '$B Per l\'Orda!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'koKR', '$B 호드를 위해!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'ptBR', '$B Pela Horda!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'ruRU', '$B За Орду!$B', '', @VBUILD),
(@BROAD_TEXT+1, 'zhCN', '$B 为部落而战！$B', '', @VBUILD),
(@BROAD_TEXT+1, 'zhTW', '$B 為部落而戰！$B', '', @VBUILD),
(@BROAD_TEXT+2, 'deDE', '$B Bereit für einige Dungeon-Erkundungen?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'esES', '$B ¿Listo para explorar algunas mazmorras?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'esMX', '$B ¿Listo para explorar algunas mazmorras?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'frFR', '$B Prêt pour explorer des donjons ? $B', '', @VBUILD),
(@BROAD_TEXT+2, 'itIT', '$B Pronto per esplorare delle istanze?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'koKR', '$B 던전 탐험할 준비 되셨나요?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'ptBR', '$B Pronto para explorar algumas masmorras?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'ruRU', '$B Готовы к исследованию подземелий?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'zhCN', '$B 准备好探索一些副本了吗?$B', '', @VBUILD),
(@BROAD_TEXT+2, 'zhTW', '$B 準備好探索一些副本了嗎?$B', '', @VBUILD),
(@BROAD_TEXT+3, 'deDE', '$B Sei vorsichtig bei der Wahl von Raids, ich werde nicht da sein, wenn ihr wiped.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'esES', '$B Ten cuidado al elegir incursiones, no estaré allí si fallas.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'esMX', '$B Ten cuidado al elegir incursiones, no estaré allí si fallas.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'frFR', '$B Faites attention en choisissant des raids, je ne serai pas là si vous wipez.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'itIT', '$B Fai attenzione a scegliere le incursioni, non ci sarò se fallisci.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'koKR', '$B 공격대를 선택할 때 조심하세요, 내가 죽으면 없을 것입니다.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'ptBR', '$B Cuidado ao escolher raids, eu não estarei lá se vocês falharem.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'ruRU', '$B Будь осторожен с выбором рейдов, я не буду там, если вы упадете.$B', '', @VBUILD),
(@BROAD_TEXT+3, 'zhCN', '$B 选择团队副本时要小心，如果你们团灭我就不在了。$B', '', @VBUILD),
(@BROAD_TEXT+3, 'zhTW', '$B 選擇團隊副本時要小心，如果你們團滅我就不在了。$B', '', @VBUILD),
(@BROAD_TEXT+4, 'deDE', '$B Wo möchtest du hingepackt werden?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'esES', '$B ¿Dónde te gustaría ser transportado?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'esMX', '$B ¿Dónde te gustaría ser transportado?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'frFR', '$B Où aimeriez-vous être téléporté ? $B', '', @VBUILD),
(@BROAD_TEXT+4, 'itIT', '$B Dove vorresti essere teletrasportato?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'ptBR', '$B Para onde você gostaria de ser teletransportado?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'ruRU', '$B Куда вы хотите быть телепортированы?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'zhCN', '$B 你想要被传送到哪里？$B', '', @VBUILD),
(@BROAD_TEXT+4, 'zhTW', '$B 你想被傳送到哪裡？$B', '', @VBUILD);
