/datum/advclass/mercenary/twilight_gunslinger
	name = "Gunslinger"
	tutorial = "A lone wolf - that's exactly how you can characterize the life you're used to. You never liked to rely on \
	anyone but your pistol and saber. Traveling through Grimoria, you earned your food and lodging by collecting bounties \
	and fulfilling contracts abundantly provided by the rulers and commoners of many different lands. Working for the \
	Guild is a novelty for you, but perhaps this is where you'll find a camaraderie you've never known?"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/twilight_gunslinger
	min_pq = 10
	cmode_music = 'modular_axis/firearms/sound/music/combat_gunslinger.ogg'
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)

/datum/outfit/job/roguetown/mercenary/twilight_gunslinger/pre_equip(mob/living/carbon/human/H)
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/quiver/twilight_bullet/lead
	beltr = /obj/item/gun/ballistic/twilight_firearm/arquebus_pistol
	backl = /obj/item/storage/backpack/rogue/satchel/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	head = /obj/item/clothing/head/roguetown/bardhat/gunslinger
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft/gunslinger
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backr = /obj/item/rogueweapon/scabbard/sword
	r_hand = /obj/item/rogueweapon/sword/sabre
	cloak = /obj/item/clothing/cloak/black_cloak
	backpack_contents = list(/obj/item/roguekey/mercenary = 1, /obj/item/twilight_powderflask = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	if(iswoodelf(H))
		H.change_stat("strength", 1)
		H.change_stat("speed", -1)
	if(isdwarfmountain(H))
		H.change_stat("speed", 1)
		H.change_stat("endurance", -1)

	H.adjust_skillrank(/datum/skill/combat/twilight_firearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 2)
	H.change_stat("constitution", 1)
