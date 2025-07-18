/**
 * Special runelock ammo
 * Meant to be LIMITED, but reusable
 */

/obj/projectile/bullet/reusable/twilight_runelock
	name = "runed sphere"
	damage = 40
	armor_penetration = 50
	speed = 0.6
	damage_type = BRUTE
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball"
	ammo_type = /obj/item/ammo_casing/caseless/twilight_lead/runelock
	range = 30
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"

/**
 * Generic ammo used by handgonnes and arquebuses
 */

/obj/projectile/bullet/twilight_lead
	name = "lead sphere"
	damage = 75	//higher damage than crossbow
	damage_type = BRUTE
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/twilight_lead
	range = 25		
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	armor_penetration = 75 
	speed = 0.1		

/obj/projectile/bullet/twilight_cannonball
	name = "cannonball"
	damage = 30
	damage_type = BRUTE
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/twilight_lead
	range = 25		
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 0
	woundclass = BCLASS_STAB
	flag = "bullet"
	armor_penetration = 75 
	speed = 0.1		

/obj/projectile/bullet/twilight_grapeshot
	name = "grapeshot"
	damage = 15
	damage_type = BRUTE
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/twilight_lead
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	armor_penetration = 75 
	speed = 0.1		

/obj/projectile/bullet/twilight_lead/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		var/list/screams = list("painscream", "paincrit")
		var/check = rand(1, 20)
		if(isliving(target))
			if(check > M.STACON)
				M.emote(screams)
				M.Knockdown(rand(15,30))
				M.Immobilize(rand(30,60))

/obj/projectile/bullet/twilight_cannonball/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/turf/T = get_turf(target)
	explosion(T, light_impact_range = 1, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))

/obj/item/ammo_casing/caseless/twilight_lead
	name = "lead sphere"
	desc = "Небольшая свинцовая сфера. Хорошо сочетается с порохом."
	projectile_type = /obj/projectile/bullet/twilight_lead
	caliber = "lead_sphere"
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball"
	dropshrink = 0.5
	max_integrity = 0.1

/obj/item/ammo_casing/caseless/twilight_lead/runelock
	name = "runed sphere"
	desc = "Небольшой, идеально круглый металлический шар, покрытый псайдонитскими рунами. Смертоносен на высокой скорости."
	projectile_type = /obj/projectile/bullet/reusable/twilight_runelock
	caliber = "runed_sphere"
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball"
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0
	w_class = WEIGHT_CLASS_TINY
	smeltresult = /obj/item/rogueore/iron

/obj/item/ammo_casing/caseless/twilight_cannonball
	name = "lead cannonball"
	desc = "Крупная свинцовая сфера. Важен не размер ствола, а размер отверстия, что он делает в вашем противнике."
	projectile_type = /obj/projectile/bullet/twilight_cannonball
	caliber = "cannonball"
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "musketball"
	dropshrink = 0.5
	max_integrity = 0.1
	grid_width = 32
	grid_height = 64

/obj/item/ammo_casing/caseless/twilight_cannonball/grapeshot
	name = "grapeshot"
	desc = "Плотно упакованный в бумагу набор небольших металлических шариков. Хорошо сочетается с порохом."
	projectile_type = /obj/projectile/bullet/twilight_grapeshot
	caliber = "cannonball"
	icon = 'modular_axis/firearms/icons/ammo.dmi'
	icon_state = "grapeshot"
	dropshrink = 0.5
	max_integrity = 0.1
	pellets = 6
	variance = 30
