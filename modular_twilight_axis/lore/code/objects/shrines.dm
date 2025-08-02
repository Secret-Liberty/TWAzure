/datum/crafting_recipe/roguetown/structure/zizo_shrine/graggar
	name = "Shrine of Blood"
	always_availible = FALSE	//Has unique assign for certain roles.
	reqs = list(
		/obj/item/bodypart = 2,
		/obj/item/organ/stomach = 1,
	)
	result = /obj/structure/fluff/psycross/zizocross/graggar
	verbage_simple = "construct"
	verbage = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'

/obj/structure/fluff/psycross/zizocross/graggar
	name = "shrine of blood"
	desc = "What a disgusting thing, what type of maniac would make this!?"
	icon = 'icons/roguetown/maniac/creations.dmi'
	icon_state = "creation1"
	divine = FALSE
