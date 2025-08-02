/obj/structure/ritualcircle/astrata/attack_hand(mob/living/user) 
	if((user.patron?.type) != /datum/patron/divine/astrata)
		to_chat(user,span_smallred("I don't know the proper rites for this..."))
		return
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user,span_smallred("I don't know the proper rites for this...")) // You need ritualist to use them
		return
	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user,span_smallred("I have performed enough rituals for the day... I must rest before communing more.")) // If you have already done a ritual in the last 30 minutes, you cannot do another.
		return
	var/riteselection = input(user, "Rituals of the Sun", src) as null|anything in solarrites // When you use a open hand on a rune, It'll give you a selection of all the rites available from that rune
	switch(riteselection) // rite selection goes in this section, try to do something fluffy. Presentation is most important here, truthfully.
		if("Guiding Light") // User selects Guiding Light, begins the stuff for it
			if(do_after(user, 50)) // just flavor stuff before activation
				user.say("I beseech to ye, Guardian of Order!!")
				if(do_after(user, 50))
					user.say("To bring Justice to a world of naught!!")
					if(do_after(user, 50))
						user.say("Place your gaze upon me, oh Radiant one!!")
						to_chat(user,span_danger("You feel the eye of Astrata turned upon you. Her warmth dances upon your cheek. You feel yourself warming up...")) // A bunch of flavor stuff, slow incanting.
						icon_state = "astrata_active"
						if(!HAS_TRAIT(user, TRAIT_CHOSEN)) //Priests don't burst into flames.
							loc.visible_message(span_warning("[user]'s bursts to flames! Embraced by Her Warmth wholly!"))
							playsound(loc, 'sound/combat/hits/burn (1).ogg', 100, FALSE, -1)
							user.adjust_fire_stacks(10)
							user.IgniteMob()
							user.flash_fullscreen("redflash3")
							user.emote("firescream")
						guidinglight(src) // Actually starts the proc for applying the buff
						user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
						spawn(120)
							icon_state = "astrata_chalky"

/obj/structure/ritualcircle/noc/attack_hand(mob/living/user)
	if((user.patron?.type) != /datum/patron/divine/noc)
		to_chat(user,span_smallred("I don't know the proper rites for this..."))
		return
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user,span_smallred("I don't know the proper rites for this..."))
		return
	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user,span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return
	var/riteselection = input(user, "Rituals of the Moon", src) as null|anything in lunarrites
	switch(riteselection) // put ur rite selection here
		if("Moonlight Dance")
			if(do_after(user, 50))
				user.say("I beseech the Mistress of the Night!!")
				if(do_after(user, 50))
					user.say("To bring Wisdom to a world of naught!!")
					if(do_after(user, 50))
						user.say("Place your gaze upon me, oh wise one!!")
						to_chat(user,span_cultsmall("The Goddess of Knowledge looks down upon the world at night, searching for worthy disciples. With some effort, her gaze can be drawn upon supplicants."))
						playsound(loc, 'sound/magic/holyshield.ogg', 80, FALSE, -1)
						moonlightdance(src)
						user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)

// TIME FOR THE ASCENDANT. These can be stronger. As they are pretty much antag exclusive - Iconoclast for Matthios, Lich for ZIZO. ZIZO!

/obj/structure/ritualcircle/zizo
	name = "Rune of Undeath"
	desc = "A Holy Rune of ZIZO. The last enemy to be destroyed is death."

/obj/structure/ritualcircle/matthios
	name = "Rune of Brotherhood"
	desc = "A Holy Rune of Matthios. Freedom for all, no matter the cost."

/obj/structure/ritualcircle/matthios/attack_hand(mob/living/user)
	if((user.patron?.type) != /datum/patron/inhumen/matthios)
		to_chat(user,span_smallred("I don't know the proper rites for this..."))
		return
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user,span_smallred("I don't know the proper rites for this..."))
		return
	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user,span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return
	var/riteselection = input(user, "Rituals of Brotherhood", src) as null|anything in matthiosrites
	switch(riteselection) // put ur rite selection here
		if("Rite of Armaments")
			var/onrune = view(1, loc)
			var/list/folksonrune = list()
			for(var/mob/living/carbon/human/persononrune in onrune)
				if(HAS_TRAIT(persononrune, TRAIT_COMMIE))
					folksonrune += persononrune
			var/target = input(user, "Choose a host") as null|anything in folksonrune
			if(!target)
				return
			if(!do_after(user, 5 SECONDS))
				return
			user.say("Lord of No Realm, heed my call!!")
			if(!do_after(user, 5 SECONDS))
				return
			user.say("The hour draws closer for tyrants to fall!!")
			if(!do_after(user, 5 SECONDS))
				return
			user.say("The arms of freedom, to crush them by nightfall!!")
			if(!do_after(user, 5 SECONDS))
				return
			icon_state = "matthios_active"
			user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
			twilight_matthiosarmaments(target)
			spawn(120)
				icon_state = "matthios_chalky"
		if("Defenestration")
			if(!do_after(user, 5 SECONDS))
				return
			user.say("Father of freedon, pay heed to our litany!!")
			if(!do_after(user, 5 SECONDS))
				return
			user.say("To thou we offer - a scion of tyranny!!")
			if(!do_after(user, 5 SECONDS))
				return
			user.say("Ravage their soul, a penance for villainy!!")
			if(!do_after(user, 5 SECONDS))
				return
			icon_state = "matthios_active"
			if(defenestration())
				to_chat(user, span_cultsmall("The ritual is complete, the noble gift of Astrata has been taken!"))
				user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
			else
				to_chat(user, span_cultsmall("The ritual fails. A noble must be in the center of the circle!"))
			spawn(120)
				icon_state = "matthios_chalky"

/obj/structure/ritualcircle/matthios/proc/twilight_matthiosarmaments(mob/living/carbon/human/target)
	if(!HAS_TRAIT(target, TRAIT_COMMIE))
		loc.visible_message(span_cult("THE RITE REJECTS ONES WHO BOW DOWN TO TYRANNY!!"))
		return
	target.Stun(60)
	target.Knockdown(60)
	to_chat(target, span_userdanger("UNIMAGINABLE PAIN!"))
	target.emote("Agony")
	playsound(loc, 'sound/misc/smelter_fin.ogg', 50)
	loc.visible_message(span_cult("[target]'s lux pours from their nose, into the rune, and the scent of rust fills the air. Molten metals burst from the ground, swirl into armor, seered to their skin."))
	spawn(20)
		playsound(loc, 'sound/combat/hits/onmetal/grille (2).ogg', 50)
		target.equipOutfit(/datum/outfit/job/roguetown/twilight_matthiosarmaments)
		target.apply_status_effect(/datum/status_effect/debuff/devitalised)
		spawn(40)
			to_chat(target, span_cult("Take up these arms, and claim your right."))

/datum/outfit/job/roguetown/twilight_matthiosarmaments/pre_equip(mob/living/carbon/human/H)
	..()
	var/list/items = list()
	items |= H.get_equipped_items(TRUE)
	for(var/I in items)
		H.dropItemToGround(I, TRUE)
	H.drop_all_held_items()
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/matthios/twilight
	pants = /obj/item/clothing/under/roguetown/platelegs/matthios/twilight
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/matthios/twilight
	gloves = /obj/item/clothing/gloves/roguetown/plate/matthios/twilight
	head = /obj/item/clothing/head/roguetown/helmet/heavy/guard/paalloy/twilight_matthios
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	backr = /obj/item/rogueweapon/halberd/bardiche/twilight_matthios_spear
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/twilight_matthios

/obj/structure/ritualcircle/psydon
	name = "Rune of Sacrament"
