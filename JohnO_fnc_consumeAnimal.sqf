private ["_consume","_chanceForSick","_protected"];
player playMove "AinvPknlMstpSnonWnonDr_medic1";

_pos = getPos cursorObject;
deleteVehicle cursorObject;
[60] call BIS_fnc_bloodEffect;
sleep 10;

_targetA = player;
_distA = random 2;
_dirA = direction player - 180;
_posA = getpos _targetA;
_positionsA = [(_posA select 0) + (sin _dirA) * _distA, (_posA select 1) + (cos _dirA) * _distA, 0];

_weaponHolderA = createVehicle ["GroundWeaponHolder", _pos, [], 0, "CAN_COLLIDE"]; 
_weaponHolderA addItemCargoGlobal ["Exile_Item_BeefParts", 1];

if (("Exile_Item_Vishpirin" in (magazines player)) || ("Exile_Item_PlasticBottleFreshWater" in (magazines player))) then 
{
	
} 
else
{	
	_chanceForSick = random 1;
	if (_chanceForSick >= 0.7) then
	{	
		titleText ["Gutting the animal as made you sick..Sit down and you will recover faster","PLAIN"];
		call JohnO_fnc_isSick;	
	};	
};