/datum/crafting_recipe/roguetown/survival/twilight_arquebus_bayonet
	name = "bayonet"
	category = "Ranged"
	result = /obj/item/gun/ballistic/twilight_firearm/arquebus/bayonet
	reqs = list(/obj/item/rogueweapon/huntingknife, /obj/item/gun/ballistic/twilight_firearm/arquebus = 1)
	verbage_simple = "fix"
	verbage = "fixes"
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/twilight_arquebus_bayonet/dagger_steel
	reqs = list(/obj/item/rogueweapon/huntingknife/idagger/steel, /obj/item/gun/ballistic/twilight_firearm/arquebus = 1)

/datum/crafting_recipe/roguetown/survival/twilight_arquebus_bayonet/dagger
	reqs = list(/obj/item/rogueweapon/huntingknife/idagger, /obj/item/gun/ballistic/twilight_firearm/arquebus = 1)

/datum/crafting_recipe/roguetown/leather/container/belt/twilight_holsterbelt
    name = "holster belt (2 leather, 2 fibers; APPRENTICE)"
    result = /obj/item/storage/belt/rogue/leather/twilight_holsterbelt
    reqs = list(/obj/item/natural/hide/cured = 2,
                /obj/item/natural/fibers = 2)
    craftdiff = 2

/datum/crafting_recipe/roguetown/leather/twilight_powderflask
	name = "powderflask (cured leather, 2 fibers, 1 ash; EXPERT)"
	result = /obj/item/twilight_powderflask
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/ash = 1) //1 brewed ash = 24 syrum
	sellprice = 15
	craftdiff = 4
