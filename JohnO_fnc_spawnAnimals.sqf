private ["_goat","_animalSpawn","_animalArray","_animal"];
_spawnCenter = [6133,7156,0]; //Center of your map -- this is Stratis 
_min = 1; // minimum distance from the center position (Number) in meters
_max = 5120; // maximum distance from the center position (Number) in meters
_mindist = 2; // minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
_water = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore
_animalArray = ["Cock_white_F","Rabbit_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F"];
if (aliveArray < maxAnimals) then
{
	_amountToSpawn = maxAnimals - aliveArray;
	diag_log format ["Remaining animals to spawn:%1 animals",_amountToSpawn];
	for "_i" from 1 to _amountToSpawn do
	{
		_animal = _animalArray call BIS_fnc_SelectRandom;
		_animalSpawn = [_spawnCenter,_min,_max,_mindist,_water,1,_shoremode] call BIS_fnc_findSafePos;
		_goat = createAgent [_animal, _animalSpawn, [], 5, "CAN_COLLIDE"];
		_goat addMPEventHandler["MPKilled",{aliveArray = aliveArray - 1;}];
		_animalskin = nil;
		_sheepskin = [
		"brown_sheep_co",
		"blackwhite_sheep_co",
		"sheep_co",
		"white_sheep_co"];
		
		_goatskin = [
		"black_goat_co",
		"goat_co",
		"old_goat_co",
		"white_goat_co"];

		if (TypeOf _goat == "Sheep_random_F") then 
		{

		_randomskin = _sheepskin call BIS_fnc_SelectRandom;
		_animalskin = format ["\A3\animals_f_beta\Sheep\data\%1.paa",_randomskin];		
		} else {
		if (TypeOf _goat == "Goat_random_F") then 
		{
		_randomskin = _goatskin call BIS_fnc_SelectRandom;
		_animalskin = format ["\A3\animals_f_beta\Goat\data\%1.paa",_randomskin];
			};
		};
		
		if !(isNil "_animalskin") then {
		_goat setObjectTexture [0, _animalskin];
		};
		
		aliveArray = aliveArray + 1;
		if (debug) then
		{	
		_sheepMarker = createMarker ["Sheep",_animalSpawn];
		"Sheep" setMarkerType "mil_dot";
		"Sheep"	setMarkerText "Sheep";
		};
	};
};
diag_log format ["Current amount of Spawned animals:%1",aliveArray];
