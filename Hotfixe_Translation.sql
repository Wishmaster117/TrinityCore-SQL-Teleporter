/* Ported to TrinityCore Master Branch by Wishmaster */

SET
@BROAD_TEXT     := 900000,
@VBUILD         := 56819;

-- Deleting code
DELETE FROM broadcast_text WHERE ID BETWEEN @BROAD_TEXT AND @BROAD_TEXT+4;
DELETE FROM broadcast_text_locale WHERE ID BETWEEN @BROAD_TEXT AND @BROAD_TEXT+4;

-- Table Hotfix -- Remettre le texte original de la ligne 200000 a chopper sur la bdd qui est en place sur le minipc
INSERT INTO `broadcast_text` (`Text`, `Text1`, `ID`, `LanguageID`, `ConditionID`, `EmotesID`, `Flags`, `ChatBubbleDurationMs`, `VoiceOverPriorityID`, `SoundKitID1`, `SoundKitID2`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `VerifiedBuild`) VALUES
('$B Steady yourself… you’re heading into the heart of conflict. The War Within waits, no turning back from here! $B', '', @BROAD_TEXT+11, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Shadowlands 
('$B Wings ready? The Dragon Isles call, but the skies are no place for the faint-hearted. Last chance to stay grounded! $B', '', @BROAD_TEXT+10, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Shadowlands 
('$B Take a deep breath… the Shadowlands don’t offer return tickets. Last chance to stay among the living! $B', '', @BROAD_TEXT+9, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Shadowlands 
('$B Grab your courage! Azeroth’s battlefields await, and it’s every hero for themselves. Last call to back out! $B', '', @BROAD_TEXT+8, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- BFA 
('$B Ready your weapons! The Legion waits, and it doesn’t take kindly to visitors. Last chance to retreat! $B', '', @BROAD_TEXT+7, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Legion 
('$B Hold tight! Draenor’s wild and unforgiving—last call to back out if you’re not ready for a rough ride! $B', '', @BROAD_TEXT+6, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Draenor 
('$B Remember, Pandaria’s beauty is matched only by its danger. Last chance to chicken out! $B', '', @BROAD_TEXT+5, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD), -- Pandaria
('$B Where would you like to be ported? $B', '', @BROAD_TEXT+4, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B Be careful with choosing raids, I wont be there if you wipe. $B', '', @BROAD_TEXT+3, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B Up for some dungeon exploring? $B', '', @BROAD_TEXT+2, 0, 0, 0, 68, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B For the Horde! $B', '', @BROAD_TEXT+1, 0, 0, 0, 67, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD),
('$B For The Alliance! $B', '', @BROAD_TEXT, 0, 0, 0, 69, 0, 0, 58268, 0, 0, 0, 0, 0, 0, 0, @VBUILD);

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
(@BROAD_TEXT+4, 'koKR', '$B 어디로 순간이동하고 싶으신가요?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'ptBR', '$B Para onde você gostaria de ser teletransportado?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'ruRU', '$B Куда вы хотите быть телепортированы?$B', '', @VBUILD),
(@BROAD_TEXT+4, 'zhCN', '$B 你想要被传送到哪里？$B', '', @VBUILD),
(@BROAD_TEXT+4, 'zhTW', '$B 你想被傳送到哪裡？$B', '', @VBUILD),
(@BROAD_TEXT+5, 'deDE', '$B Denke daran, Pandarias Schönheit wird nur von seiner Gefahr übertroffen. Letzte Chance, einen Rückzieher zu machen!$B', '', @VBUILD),
(@BROAD_TEXT+5, 'esES', '$B Recuerda, la belleza de Pandaria solo es igualada por su peligro. ¡Última oportunidad para echarse atrás!$B', '', @VBUILD),
(@BROAD_TEXT+5, 'esMX', '$B Recuerda, la belleza de Pandaria solo es igualada por su peligro. ¡Última oportunidad para acobardarse!$B', '', @VBUILD),
(@BROAD_TEXT+5, 'frFR', '$B Souviens-toi, la beauté de la Pandarie n’a d’égal que ses dangers. Dernière chance pour rebrousser chemin !$B', '', @VBUILD), 
(@BROAD_TEXT+5, 'itIT', '$B Ricorda, la bellezza di Pandaria è pari solo al suo pericolo. Ultima occasione per tirarsi indietro!$B', '', @VBUILD),
(@BROAD_TEXT+5, 'koKR', '$B 판다리아의 아름다움은 그만큼의 위험을 동반합니다. 지금이 마지막으로 돌아갈 기회입니다!$B', '', @VBUILD), 
(@BROAD_TEXT+5, 'ptBR', '$B Lembre-se, a beleza de Pandária é igualada apenas pelo seu perigo. Última chance para desistir!$B', '', @VBUILD),
(@BROAD_TEXT+5, 'ruRU', '$B Помните, красота Пандарии сопоставима лишь с её опасностью. Последний шанс передумать!$B', '', @VBUILD), 
(@BROAD_TEXT+5, 'zhCN', '$B 记住，潘达利亚的美丽与危险并存。最后的机会退出！$B', '', @VBUILD),
(@BROAD_TEXT+5, 'zhTW', '$B 記住，潘達利亞的美麗伴隨著危險。最後的機會退出！$B', '', @VBUILD),
(@BROAD_TEXT+6, 'deDE', '$B Halt dich fest! Draenor ist wild und unerbittlich – letzte Chance zum Rückzug, wenn du nicht bereit für die raue Reise bist!$B', '', @VBUILD),
(@BROAD_TEXT+6, 'esES', '$B ¡Agárrate fuerte! Draenor es salvaje e implacable—última llamada para echarse atrás si no estás listo para un viaje movido!$B', '', @VBUILD),
(@BROAD_TEXT+6, 'esMX', '$B ¡Agárrate bien! Draenor es salvaje e implacable—última oportunidad para echarse atrás si no estás listo para un viaje duro!$B', '', @VBUILD),
(@BROAD_TEXT+6, 'frFR', '$B Accroche-toi ! Draenor est sauvage et impitoyable – dernière chance de faire demi-tour si tu n’es pas prêt pour une aventure rude !$B', '', @VBUILD), 
(@BROAD_TEXT+6, 'itIT', '$B Tieniti forte! Draenor è selvaggia e implacabile—ultima chiamata per tirarsi indietro se non sei pronto per un viaggio difficile!$B', '', @VBUILD),
(@BROAD_TEXT+6, 'koKR', '$B 단단히 붙잡으세요! 드레노어는 거칠고 가차 없습니다—험난한 여정을 준비하지 않았다면 마지막으로 돌아갈 기회입니다!$B', '', @VBUILD), 
(@BROAD_TEXT+6, 'ptBR', '$B Segure-se firme! Draenor é selvagem e implacável—última chance para desistir se não estiver pronto para uma jornada intensa!$B', '', @VBUILD),
(@BROAD_TEXT+6, 'ruRU', '$B Держитесь крепче! Дренор – дикий и беспощадный. Последний шанс отступить, если вы не готовы к суровым испытаниям!$B', '', @VBUILD), 
(@BROAD_TEXT+6, 'zhCN', '$B 抓紧了！德拉诺野性十足且无情—如果没准备好艰难旅程，现在是最后退出的机会！$B', '', @VBUILD),
(@BROAD_TEXT+6, 'zhTW', '$B 抓緊了！德拉諾充滿野性且無情—如果還沒準備好迎接艱辛旅程，現在是最後的退出機會！$B', '', @VBUILD),
(@BROAD_TEXT+7, 'deDE', '$B Mach deine Waffen bereit! Die Legion wartet und ist nicht freundlich zu Besuchern. Letzte Chance zum Rückzug!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'esES', '$B ¡Prepara tus armas! La Legión te espera, y no trata bien a los visitantes. ¡Última oportunidad para retirarse!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'esMX', '$B ¡Prepara tus armas! La Legión aguarda y no es amable con los visitantes. ¡Última oportunidad para retirarse!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'frFR', '$B Préparez vos armes ! La Légion attend, et elle n’aime pas les visiteurs. Dernière chance de battre en retraite !$B', '', @VBUILD),
(@BROAD_TEXT+7, 'itIT', '$B Prepara le tue armi! La Legione ti aspetta e non ama i visitatori. Ultima occasione per ritirarsi!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'koKR', '$B 무기를 준비하세요! 군단이 기다리고 있으며, 방문객을 반기지 않습니다. 철수할 마지막 기회입니다!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'ptBR', '$B Prepare suas armas! A Legião aguarda e não é amigável com visitantes. Última chance para recuar!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'ruRU', '$B Приготовьте оружие! Легион ждет и не рад гостям. Последний шанс отступить!$B', '', @VBUILD),
(@BROAD_TEXT+7, 'zhCN', '$B 准备好你的武器！军团在等待，且不欢迎访客。最后的撤退机会！$B', '', @VBUILD),
(@BROAD_TEXT+7, 'zhTW', '$B 準備好你的武器！燃燒軍團在等著，且不歡迎訪客。最後的撤退機會！$B', '', @VBUILD),
(@BROAD_TEXT+8, 'deDE', '$B Nimm all deinen Mut zusammen! Die Schlachtfelder von Azeroth erwarten dich – hier kämpft jeder Held für sich. Letzte Chance zum Rückzug!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'esES', '$B ¡Agarra tu valor! Los campos de batalla de Azeroth te esperan, y cada héroe está solo. ¡Última oportunidad para retroceder!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'esMX', '$B ¡Toma tu valentía! Los campos de batalla de Azeroth te esperan, y cada héroe pelea por sí mismo. ¡Última oportunidad para echarse atrás!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'frFR', '$B Empare-toi de ton courage ! Les champs de bataille d’Azeroth t’attendent, chaque héros pour soi. Dernière chance de battre en retraite !$B', '', @VBUILD),
(@BROAD_TEXT+8, 'itIT', '$B Prendi il tuo coraggio! I campi di battaglia di Azeroth ti aspettano, e ogni eroe è per conto suo. Ultima occasione per tirarsi indietro!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'koKR', '$B 용기를 잡으세요! 아제로스의 전장이 기다리고 있으며, 각 영웅은 혼자 싸웁니다. 철수할 마지막 기회입니다!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'ptBR', '$B Pegue sua coragem! Os campos de batalha de Azeroth te esperam, e cada herói está por conta própria. Última chance para recuar!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'ruRU', '$B Соберите всю свою храбрость! Поля сражений Азерота ждут, каждый герой сражается сам за себя. Последний шанс отступить!$B', '', @VBUILD),
(@BROAD_TEXT+8, 'zhCN', '$B 鼓起你的勇气！艾泽拉斯的战场等待着，每个英雄都靠自己。最后的退出机会！$B', '', @VBUILD),
(@BROAD_TEXT+8, 'zhTW', '$B 鼓起你的勇氣！艾澤拉斯的戰場等待著，每位英雄都靠自己。最後的退出機會！$B', '', @VBUILD),
(@BROAD_TEXT+9, 'deDE', '$B Hol tief Luft… die Schattenlande bieten keine Rückfahrtickets an. Letzte Chance, unter den Lebenden zu bleiben!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'esES', '$B Respira hondo... las Tierras Sombrías no ofrecen billetes de regreso. ¡Última oportunidad de quedarse entre los vivos!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'esMX', '$B Toma una gran bocanada de aire... las Tierras de las Sombras no ofrecen boletos de regreso. ¡Última oportunidad de quedarte entre los vivos!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'frFR', '$B Prends une grande inspiration… les terres de l’Ombre n’offrent pas de billet retour. Dernière chance de rester parmi les vivants !$B', '', @VBUILD),
(@BROAD_TEXT+9, 'itIT', '$B Fai un bel respiro... le Terretetre non offrono biglietti di ritorno. Ultima occasione per rimanere tra i vivi!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'koKR', '$B 깊게 숨 쉬세요... 어둠땅은 돌아오는 티켓이 없습니다. 살아있는 자로 남을 마지막 기회입니다!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'ptBR', '$B Respire fundo... as Terras Sombrias não oferecem passagens de volta. Última chance para permanecer entre os vivos!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'ruRU', '$B Сделайте глубокий вдох... в Темные земли билеты в оба конца не продают. Последний шанс остаться среди живых!$B', '', @VBUILD),
(@BROAD_TEXT+9, 'zhCN', '$B 深吸一口气... 暗影界没有回程票。留在人间的最后机会！$B', '', @VBUILD),
(@BROAD_TEXT+9, 'zhTW', '$B 深吸一口氣…暗影界沒有回程票。留在人間的最後機會！$B', '', @VBUILD),
(@BROAD_TEXT+10, 'deDE', '$B Bereit zum Abflug? Die Dracheninseln rufen, aber die Lüfte sind nichts für schwache Nerven. Letzte Chance, am Boden zu bleiben!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'esES', '$B ¿Alas listas? Las Islas Dragón te llaman, pero los cielos no son para los débiles. ¡Última oportunidad para quedarse en tierra!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'esMX', '$B ¿Listo para volar? Las Islas Dragón te llaman, pero los cielos no son para los débiles. ¡Última oportunidad para quedarse en tierra!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'frFR', '$B Prêt à prendre ton envol ? Les îles aux Dragons t’appellent, mais les cieux ne sont pas pour les âmes sensibles. Dernière chance de rester au sol !$B', '', @VBUILD),
(@BROAD_TEXT+10, 'itIT', '$B Ali pronte? Le Isole dei Draghi chiamano, ma i cieli non sono per i deboli di cuore. Ultima occasione per restare a terra!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'koKR', '$B 날 준비 되었나요? 용의 섬이 부르지만, 하늘은 약한 자의 자리가 아닙니다. 지상에 머물 마지막 기회입니다!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'ptBR', '$B Asas prontas? As Ilhas do Dragão chamam, mas os céus não são para os fracos. Última chance de ficar no chão!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'ruRU', '$B Крылья готовы? Драконьи острова зовут, но небеса не для слабонервных. Последний шанс остаться на земле!$B', '', @VBUILD),
(@BROAD_TEXT+10, 'zhCN', '$B 准备好翅膀了吗？巨龙群岛在召唤，但天空不适合胆小的人。最后的机会留在地面！$B', '', @VBUILD),
(@BROAD_TEXT+10, 'zhTW', '$B 翅膀準備好了嗎？巨龍群島在呼喚，但天空不是給膽小鬼的地方。最後的機會留在地面！$B', '', @VBUILD),
(@BROAD_TEXT+11, 'deDE', '$B Mach dich bereit... du betrittst das Herz des Konflikts. Der Krieg in dir wartet, kein Zurück mehr von hier!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'esES', '$B Prepárate... te diriges al corazón del conflicto. La Guerra Interior te espera, ¡no hay vuelta atrás desde aquí!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'esMX', '$B Prepárate... te diriges al corazón del conflicto. La Guerra Interna te espera, ¡no hay vuelta atrás desde aquí!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'frFR', '$B Prépare-toi… tu te diriges vers le cœur du conflit. La Guerre Intérieure t’attend, plus de retour possible ! $B', '', @VBUILD),
(@BROAD_TEXT+11, 'itIT', '$B Preparati... stai entrando nel cuore del conflitto. La Guerra Interiore ti attende, non si torna indietro da qui!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'koKR', '$B 마음을 단단히 하세요… 갈등의 중심으로 향하고 있습니다. 내면의 전쟁이 기다리고 있습니다. 여기서 돌아갈 길은 없습니다!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'ptBR', '$B Prepare-se... você está indo para o coração do conflito. A Guerra Interior espera, sem volta a partir daqui!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'ruRU', '$B Соберитесь с духом… вы направляетесь в центр конфликта. Война внутри ждет, пути назад нет!$B', '', @VBUILD),
(@BROAD_TEXT+11, 'zhCN', '$B 稳住自己…你正走向冲突的核心。内战在等待，从这里没有回头路！$B', '', @VBUILD),
(@BROAD_TEXT+11, 'zhTW', '$B 穩住自己…你正走向衝突的核心。內戰在等待，從此無回頭路！$B', '', @VBUILD);







