#Animal spawn and hunting

Installation -

Add contents to your mission file

Inisde your init.sqf -

JohnO_fnc_spawnAnimals = compileFinal preprocessFileLineNumbers "JohnO_fnc_spawnAnimals.sqf";
JohnO_fnc_isSick = compileFinal preprocessFileLineNumbers "JohnO_fnc_isSick.sqf";

[] execVM "config_animals.sqf";

Inside your mission config.cpp -

find

class CfgExileCustomCode 
{

	//add the line below this NOT THIS LINE.
	ExileClient_object_player_initialize = "ExileClient_object_player_initialize.sqf";
	
Configure config_animals.sqf to your liking.

Done