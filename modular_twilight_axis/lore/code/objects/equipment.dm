/obj/item/rogueweapon/halberd/bardiche/twilight_matthios_spear
	name = "Kingslayer"
	desc = "«Rise, now, stand and fight, take your freedom, claim your right! Rise, now, stand and sing, storm the castle, kill the king!»"
	slot_flags = ITEM_SLOT_BACK
	icon_state = "ancient_bardiche"
	blade_dulling = DULLING_SHAFT_GRAND

/obj/item/clothing/suit/roguetown/armor/plate/full/matthios/twilight
	name = "rebel plate armor"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	icon_state = "ancientplate"

/obj/item/clothing/under/roguetown/platelegs/matthios/twilight
	name = "rebel plate chausses"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	icon_state = "ancientplate_legs"

/obj/item/clothing/shoes/roguetown/boots/armor/matthios/twilight
	name = "rebel plated boots"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	icon_state = "ancientboots"

/obj/item/clothing/gloves/roguetown/plate/matthios/twilight
	name = "rebel plate gauntlets"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	icon_state = "agauntlets"

/obj/item/clothing/head/roguetown/helmet/heavy/guard/paalloy/twilight_matthios
	name = "rebel savoyard"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	max_integrity = ARMOR_INT_HELMET_ANTAG
	icon_state = "ancientsavoyard"

/obj/item/clothing/head/roguetown/helmet/heavy/guard/paalloy/twilight_matthios/pickup(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_COMMIE))
		to_chat(user, "<font color='yellow'>UNWORTHY HANDS TOUCH THE VISAGE, CEASE OR BE PUNISHED</font>")
		user.adjust_fire_stacks(5)
		user.IgniteMob()
		user.Stun(40)
	..()

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/twilight_matthios
	name = "rebel hauberk"
	desc = "This ancient plate armor has been imbued with your lux and enhanced with Free-God's power. It will serve just as well as their shiny, polished plate sets. Their stolen wealth will not save them when we shatter every church and jail."
	icon_state = "ancienthauberk"
