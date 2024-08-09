#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit is wearing a parachute. Third party mods can technically set any backpack to be considered a parachute.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if unit has parachute, otherwise false <BOOL>
 *
 * Example:
 * [ace_player] call haf_common_fnc_empty;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];
TRACE_1("fnc_hasParachute",_unit);

if (isNull _unit) exitWith {};

private _backpack = backpackContainer _unit;
GVAR(parachuteCache) getOrDefaultCall [typeOf _backpack, {
    _backpack isKindOf "B_Parachute" or
    {getNumber (configOf _backpack >> QGVAR(isParachute)) >= 1};
}, true];