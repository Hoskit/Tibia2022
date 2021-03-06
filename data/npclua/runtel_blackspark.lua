local internalNpcName = "Runtel Blackspark"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 472,
	lookHead = 59,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	{ itemName = "animate dead rune", clientId = 3203, buy = 375 * 5},
	{ itemName = "avalanche rune", clientId = 3161, buy = 57 * 5},
	{ itemName = "blank rune", clientId = 3147, buy = 10 * 5},
	{ itemName = "chameleon rune", clientId = 3178, buy = 210 * 5},
	{ itemName = "convince creature rune", clientId = 3177, buy = 80 * 5},
	{ itemName = "cure poison rune", clientId = 3153, buy = 65 * 5},
	{ itemName = "destroy field rune", clientId = 3148, buy = 15 * 5},
	{ itemName = "disintegrate rune", clientId = 3197, buy = 26 * 5},
	{ itemName = "energy bomb rune", clientId = 3149, buy = 203 * 5},
	{ itemName = "energy field rune", clientId = 3164, buy = 38 * 5},
	{ itemName = "energy wall rune", clientId = 3166, buy = 85 * 5},
	{ itemName = "explosion rune", clientId = 3200, buy = 31 * 5},
	{ itemName = "fire bomb rune", clientId = 3192, buy = 147 * 5},
	{ itemName = "fire field rune", clientId = 3188, buy = 28 * 5},
	{ itemName = "fire wall rune", clientId = 3190, buy = 61 * 5},
	{ itemName = "fireball rune", clientId = 3189, buy = 30 * 5},
	{ itemName = "great fireball rune", clientId = 3191, buy = 57 * 5},
	{ itemName = "great health potion", clientId = 239, buy = 225 * 5 },
	{ itemName = "great mana potion", clientId = 238, buy = 144 * 5 },
	{ itemName = "great spirit potion", clientId = 7642, buy = 228 * 5 },
	{ itemName = "health potion", clientId = 266, buy = 50 * 5 },
	{ itemName = "heavy magic missile rune", clientId = 3198, buy = 12 * 5},
	{ itemName = "holy missile rune", clientId = 3182, buy = 16 * 5},
	{ itemName = "icicle rune", clientId = 3158, buy = 30 * 5},
	{ itemName = "intense healing rune", clientId = 3152, buy = 95 * 5},
	{ itemName = "light magic missile rune", clientId = 3174, buy = 4 * 5},
	{ itemName = "magic wall rune", clientId = 3180, buy = 116 * 5},
	{ itemName = "mana potion", clientId = 268, buy = 56 * 5 },
	{ itemName = "paralyze rune", clientId = 3165, buy = 700 * 5},
	{ itemName = "poison bomb rune", clientId = 3173, buy = 85 * 5},
	{ itemName = "poison field rune", clientId = 3172, buy = 21 * 5},
	{ itemName = "poison wall rune", clientId = 3176, buy = 52 * 5},
	{ itemName = "soulfire rune", clientId = 3195, buy = 46 * 5},
	{ itemName = "stalagmite rune", clientId = 3179, buy = 12 * 5},
	{ itemName = "stone shower rune", clientId = 3175, buy = 37 * 5},
	{ itemName = "strong health potion", clientId = 236, buy = 115 * 5 },
	{ itemName = "strong mana potion", clientId = 237, buy = 93 * 5 },
	{ itemName = "sudden death rune", clientId = 3155, buy = 135 * 5},
	{ itemName = "supreme health potion", clientId = 23375, buy = 625 * 5 },
	{ itemName = "thunderstorm rune", clientId = 3202, buy = 47 * 5},
	{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 * 5},
	{ itemName = "ultimate health potion", clientId = 7643, buy = 379 * 5 },
	{ itemName = "ultimate mana potion", clientId = 23373, buy = 379 * 5 },
	{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 * 5 },
	{ itemName = "wild growth rune", clientId = 3156, buy = 160 * 5}
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
