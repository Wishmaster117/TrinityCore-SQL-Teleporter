This is a NPC teleporter entirely based on SQL!<br/>

This is based upon the excellent work from <a href="https://rochet2.github.io/">Rochet2</a> and ported to TrinityCore Master branche by me.<br/>

1) Adjust the following variables according to your needs.<br/>

@ENTRY          := 9000000,<br/>
@NAME           := "Portal Master",<br/>
@SUBNAME        := "Where do you go ?",<br/>
@MODEL          := 21572,<br/>

@AURA           := "30540", -- "35766" = casting<br/><br/>

@TEXT_ID        := 9000000,<br/>
@GOSSIP_MENU    := 2000000,<br/>
@BROAD_TEXT     := 9000000,<br/>
@VBUILD         := 57388;<br/>

and<br/>

@BROAD_TEXT     := 9000000,<br/>
@VBUILD         := 57388;<br/>

3) Run the file Trynity Portal Master.sql and Local Translation.sql in your World Database.<br/>
4) Tun the file Hotfix_Translation.sql in your Hotfixes Database<br/>
5) Add NPC's where you want to have teleporters (.npc add 9000000)<br/>

Enjoy.<br/>

Features : Multilangual<br/>

Credits :<br/>

<a href="https://rochet2.github.io/">Rochet2</a>
