local internalNpcName = "Frans"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeEx = 3114
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
	{ itemName = "avalanche rune", clientId = 3161, buy = 57 * 5},
	{ itemName = "blank rune", clientId = 3147, buy = 10 * 5},
	{ itemName = "chameleon rune", clientId = 3178, buy = 210 * 5},
	{ itemName = "convince creature rune", clientId = 3177, buy = 80 * 5},
	{ itemName = "cure poison rune", clientId = 3153, buy = 65 * 5},
	{ itemName = "destroy field rune", clientId = 3148, buy = 15 * 5},
	{ itemName = "durable exercise rod", clientId = 35283, buy = 945000, count = 1800 },
	{ itemName = "durable exercise wand", clientId = 35284, buy = 945000, count = 1800 },
	{ itemName = "energy field rune", clientId = 3164, buy = 38 * 5},
	{ itemName = "energy wall rune", clientId = 3166, buy = 85 * 5},
	{ itemName = "exercise rod", clientId = 28556, buy = 262500, count = 500 },
	{ itemName = "exercise wand", clientId = 28557, buy = 262500, count = 500 },
	{ itemName = "explosion rune", clientId = 3200, buy = 31 * 5},
	{ itemName = "fire bomb rune", clientId = 3192, buy = 147 * 5},
	{ itemName = "fire field rune", clientId = 3188, buy = 28 * 5},
	{ itemName = "fire wall rune", clientId = 3190, buy = 61 * 5},
	{ itemName = "great fireball rune", clientId = 3191, buy = 57 * 5},
	{ itemName = "heavy magic missile rune", clientId = 3198, buy = 12 * 5},
	{ itemName = "intense healing rune", clientId = 3152, buy = 95 * 5},
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 7560000, count = 14400 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 7560000, count = 14400 },
	{ itemName = "light magic missile rune", clientId = 3174, buy = 4 * 5},
	{ itemName = "moonlight rod", clientId = 3070, buy = 1000 },
	{ itemName = "necrotic rod", clientId = 3069, buy = 5000 },
	{ itemName = "poison field rune", clientId = 3172, buy = 21 * 5},
	{ itemName = "poison wall rune", clientId = 3176, buy = 52 * 5},
	{ itemName = "snakebite rod", clientId = 3066, buy = 500 },
	{ itemName = "spellbook", clientId = 3059, buy = 150 },
	{ itemName = "spellwand", clientId = 651, sell = 299 },
	{ itemName = "stalagmite rune", clientId = 3179, buy = 12 * 5},
	{ itemName = "sudden death rune", clientId = 3155, buy = 135 * 5},
	{ itemName = "terra rod", clientId = 3065, buy = 10000 },
	{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 * 5},
	{ itemName = "wand of cosmic energy", clientId = 3073, buy = 10000 },
	{ itemName = "wand of decay", clientId = 3072, buy = 5000 },
	{ itemName = "wand of dragonbreath", clientId = 3075, buy = 1000 },
	{ itemName = "wand of vortex", clientId = 3074, buy = 500 }
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
