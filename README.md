This is a NPC teleporter entirely based on SQL!
This is based upon the excellent work from Rochet2 and ported to TrinityCore Master branche by me.

1) Adjust the following variables according to your needs.

@ENTRY          := 9000000,
@NAME           := "Portal Master",
@SUBNAME        := "Where do you go ?",
@MODEL          := 21572,

@AURA           := "30540", -- "35766" = casting

@TEXT_ID        := 9000000,
@GOSSIP_MENU    := 2000000,
@BROAD_TEXT     := 9000000,
@VBUILD         := 57388;

and

@BROAD_TEXT     := 9000000,
@VBUILD         := 57388;

3) Run the file Trynity Portal Master.sql and Local Translation.sql in your World Database.
4) Tun the file Hotfix_Translation.sql in your Hotfixes Database
5) Add NPC's where you want to have teleporters (.npc add 9000000)

Enjoy.

Features : Multilangual

Credits :
Rochet2