local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

local area = createCombatArea({
	{0, 0, 0},
	{1, 3, 1},
	{0, 0, 0}
})
combat:setArea(area)

local morningStar = Weapon(WEAPON_SWORD)

function onUseWeapon(player, var)
	return combat:execute(player, var)
end

morningStar:id(3282)
morningStar:register()
