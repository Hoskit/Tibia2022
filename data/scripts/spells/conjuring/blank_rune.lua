local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(0, 3147, 2)
end

spell:name("Blank Rune")
spell:words("adori blank")
spell:group("support")
spell:vocation("druid;true", "paladin;true", "sorcerer;true", "elder druid;true", "royal paladin;true", "master sorcerer;true", "knight;true", "elite knight;true")
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(10)
spell:mana(100)
spell:soul(1)
spell:needLearn(false)
spell:register()
