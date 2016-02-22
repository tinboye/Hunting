private ["_goat","_animalSpawn"];

_spawnCenter = [6133,7156,0]; //Center of your map -- this is Stratis 
_min = 1; // minimum distance from the center position (Number) in meters
_max = 5000; // maximum distance from the center position (Number) in meters
_mindist = 2; // minimum distance from the nearest object (Number) in meters, ie. create waypoint this distance away from anything within x meters..
_water = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore

//if (count animalArray < maxAnimals) then
if (aliveArray < maxAnimals) then
{	
	//_amountToSpawn = maxAnimals - count animalArray;
	_amountToSpawn = maxAnimals - aliveArray;
	diag_log format ["Remaining animals to spawn:%1 animals",_amountToSpawn];

	for "_i" from 1 to _amountToSpawn do
	{	
		_animalSpawn = [_spawnCenter,_min,_max,_mindist,_water,1,_shoremode] call BIS_fnc_findSafePos;

		_goat = createAgent ["Cock_white_F", _animalSpawn, [], 5, "CAN_COLLIDE"];

		_goat addMPEventHandler["MPKilled",
		{
			aliveArray = aliveArray - 1;
		}];

		aliveArray = aliveArray + 1;

		diag_log format ["Spawned:%1 animals",aliveArray];

		if (debug) then
		{	
		_sheepMarker = createMarker ["Sheep",_animalSpawn];
		"Sheep" setMarkerType "mil_dot";
		"Sheep"	setMarkerText "Sheep";
		};
	};
};	
/*{
	if (!alive _x) then
	{
		aliveArray = aliveArray - 1;
	};	
} forEach aliveArray;*/

diag_log format ["Current amount of Spawned animals:%1",aliveArray];

