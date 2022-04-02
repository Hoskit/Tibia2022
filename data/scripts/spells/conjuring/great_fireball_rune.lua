local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3191, 3)
end

spell:name("Great Fireball Rune")
spell:words("adori mas flam")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "knight;true", "elite knight;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(12)
spell:mana(530)
spell:soul(3)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
