--[[
	ix.container.Register(model, {
		name = "Crate",
		description = "A simple wooden create.",
		width = 4,
		height = 4,
		locksound = "",
		opensound = ""
	})
]]--

ix.container.Register("models/props_junk/wood_crate001a.mdl", {
	name = "Ящик",
	description = "Простой деревянный ящик.",
	width = 4,
	height = 4,
})

ix.container.Register("models/props_c17/lockers001a.mdl", {
	name = "Запирающийся шкафчик",
	description = "Белый шкафчик.",
	width = 3,
	height = 5,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001a.mdl", {
	name = "Металлический Шкаф",
	description = "Зеленый металлический шкаф.",
	width = 4,
	height = 5,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001b.mdl", {
	name = "Металлический Шкаф",
	description = "Зеленый металлический шкаф.",
	width = 4,
	height = 5,
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet001a.mdl", {
	name = "Картотечный Шкаф",
	description = "Металлический картотечный шкаф.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet002a.mdl", {
	name = "Картотечный Шкаф",
	description = "Металлический картотечный шкаф.",
	width = 3,
	height = 6,
})

ix.container.Register("models/props_lab/filecabinet02.mdl", {
	name = "Картотечный Шкаф",
	description = "Металлический картотечный шкаф.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/furniturefridge001a.mdl", {
	name = "Холодильник",
	description = "Металлическая коробка для хранения продуктов.",
	width = 2,
	height = 3,
})

ix.container.Register("models/props_wasteland/kitchen_fridge001a.mdl", {
	name = "Большой Холодильник",
	description = "Большая металлическая коробка для хранения еще большего количества продуктов.",
	width = 4,
	height = 5,
})

ix.container.Register("models/props_junk/trashbin01a.mdl", {
	name = "Мусорное ведро",
	description = "Что вы ожидаете здесь найти?",
	width = 2,
	height = 2,
})

ix.container.Register("models/props_junk/trashdumpster01a.mdl", {
	name = "Мусорный контейнер",
	description = "Мусорный контейнер, предназначенный для хранения мусора. От него исходит неприятный запах.",
	width = 6,
	height = 3
})

ix.container.Register("models/items/ammocrate_smg1.mdl", {
	name = "Ящик с боеприпасами",
	description = "Тяжелый ящик для хранения боеприпасов.",
	width = 5,
	height = 3,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(2, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/reizer_props/srsp/sci_fi/armory_02_3/armory_02_3.mdl", {
	name = "Ящик хранения",
	description = "Тяжелый ящик для хранения вещей бойцов.",
	width = 9,
	height = 7,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(5, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/reizer_props/srsp/sci_fi/crate_01/crate_01.mdl", {
	name = "Ящик с боеприпасами",
	description = "Тяжелый ящик для хранения боеприпасов.",
	width = 5,
	height = 3,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(3, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/props_forest/footlocker01_closed.mdl", {
	name = "Сундучок",
	description = "Небольшой сундучок для хранения вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/Items/item_item_crate.mdl", {
	name = "Ящик для предметов",
	description = "Ящик для хранения некоторых вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/helios/sw/crate/closed.mdl", {
	name = "Ящик для предметов",
	description = "Ящик для хранения некоторых вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/prop_crates/imp_x64_a.mdl", {
	name = "Ящик для предметов",
	description = "Ящик для хранения некоторых вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/reizer_props/srsp/sci_fi/barrel_04/barrel_04.mdl", {
	name = "Ящик для предметов",
	description = "Ящик для хранения некоторых вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/lt_c/sci_fi/box_crate.mdl", {
	name = "Ящик для предметов",
	description = "Ящик для хранения некоторых вещей.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/cashregister01a.mdl", {
	name = "Кассовый аппарат",
	description = "Кассовый аппарат с несколькими кнопками и выдвижным ящиком.",
	width = 2,
	height = 1
})
