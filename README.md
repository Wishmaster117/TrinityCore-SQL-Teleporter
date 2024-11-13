This is a NPC teleporter entirely based on SQL!<br/>

This is based upon the excellent work from <a href="https://rochet2.github.io/">Rochet2</a> and ported to TrinityCore Master branche by me.<br/>

1) First run <b>Trinity_Portal_Master.sql</b> and <b>Locale Translations.sql</b> in the World Database.<br/>
2) Run <b>Hotfixe_Translation</b> in the Hotfixes Database.<br/>
3) Add NPC's where you want to have teleporters (.npc add 9000000)<br/>

After thar i provide several sql scripts to auto add teleportations locations:<br/>

* One script to auto add a new category with a sub category. (Trinity_Portal_Auto_Add_Cat_and_Submenus_World.sql) for this one you have also to run (Trinity_Portal_Auto_Add_Cat_and_Submenus_Hotfixes.sql) to your Hotfixes database.<br/>
* One script to auto add a new sub category to the last category created. (Trinity_Portal_Auto_Add_Submenus_World.sql)<br/>
* One script to auto add a new sub category to a existing catégory. (Trinity_Portal_Add_Submenus_to_existing_cat_World.sql)<br/>
  
Enjoy.<br/>

Features :
* Multilangual<br/>
* Auto add teleportations categories and Teleportations sub categories<br/>

Credits :<br/>

<a href="https://rochet2.github.io/">Rochet2</a>
