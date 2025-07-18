/datum/advclass/manorguard/twilight_grenadier
	name = "Grenadier"
	tutorial = "Вы — опытный солдат герцогства, повидавший немало сражений. За ваши заслуги вам довелось стать одним из тех немногих, кому было доверено новейшее пороховое оружие. Используйте его с умом и защитите державу от врагов внешних и внутренних."
	outfit = /datum/outfit/job/roguetown/manorguard/twilight_grenadier

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manorguard/twilight_grenadier/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/twilight_firearms, 4, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) // A little better; run fast, weak boy.
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC) //+1 spd, con, end, +2 per in town
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)


	H.change_stat("endurance", 1) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("perception", 2)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", 1)

	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord		
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/trou/leather

	H.adjust_blindness(-3)
	var/weapons = list("Аркебуза и свинцовые пули","Кулеврина и картечь")
	var/weapon_choice = input("Выберите свое оружие.", "К ОРУЖИЮ") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Аркебуза и свинцовые пули")
			beltr = /obj/item/quiver/twilight_bullet/lead
			beltl = /obj/item/rogueweapon/scabbard/sword
			r_hand = /obj/item/rogueweapon/sword/sabre
			backl = /obj/item/gun/ballistic/twilight_firearm/arquebus
		if("Кулеврина и картечь") 
			beltl = /obj/item/rogueweapon/scabbard/sword
			r_hand = /obj/item/rogueweapon/sword/sabre
			beltr = /obj/item/quiver/twilight_bullet/cannonball/grapeshot
			backl = /obj/item/gun/ballistic/twilight_firearm/handgonne

	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/keyring/guardcastle,
		/obj/item/twilight_powderflask = 1,
		)
	H.verbs |= /mob/proc/haltyell

	var/helmets = list(
	"Simple Helmet" 	= /obj/item/clothing/head/roguetown/helmet,
	"Kettle Helmet" 	= /obj/item/clothing/head/roguetown/helmet/kettle,
	"Bascinet Helmet"		= /obj/item/clothing/head/roguetown/helmet/bascinet,
	"Sallet Helmet"		= /obj/item/clothing/head/roguetown/helmet/sallet,
	"Winged Helmet" 	= /obj/item/clothing/head/roguetown/helmet/winged,
	"None"
	)
	var/helmchoice = input("Выберите свой шлем.", "НАДЕТЬ ДОСПЕХ") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]
