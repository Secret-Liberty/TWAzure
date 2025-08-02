/obj/item/storage/belt/rogue/leather/twilight_holsterbelt
	name = "holster belt"
	desc = "Ремень с кобурой. Пришлось пожертвовать местом на поясе ради возможности удобно носить пистоль."
	icon = 'modular_twilight_axis/firearms/icons/obj_belts.dmi'
	mob_overlay_icon = 'modular_twilight_axis/firearms/icons/onmob_belts.dmi'
	icon_state = "holsterbelt"
	item_state = "holsterbelt"
	strip_delay = 20
	var/max_storage = 1
	var/list/pistol = list()
	sewrepair = TRUE
	component_type = /datum/component/storage/concrete/roguetown/belt/holster_belt

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/proc/eatpistol(obj/A)
	if((A.type in typesof(/obj/item/gun/ballistic/revolver/grenadelauncher/twilight_runelock)) || (A.type in typesof(/obj/item/gun/ballistic/twilight_firearm/arquebus_pistol)))
		if(pistol.len < max_storage)
			A.forceMove(src)
			pistol += A
			icon_state = "holsterbelt_full"
			update_icon()
			return TRUE
		else
			return FALSE

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/attackby(obj/A, loc, params)
	if((A.type in typesof(/obj/item/gun/ballistic/revolver/grenadelauncher/twilight_runelock)) || (A.type in typesof(/obj/item/gun/ballistic/twilight_firearm/arquebus_pistol)))
		if(pistol.len < max_storage)
			if(ismob(loc))
				var/mob/M = loc
				M.doUnEquip(A, TRUE, src, TRUE, silent = TRUE)
			else
				A.forceMove(src)
			pistol += A
			icon_state = "holsterbelt_full"
			update_icon()
			to_chat(usr, span_notice("Я засовываю пистоль в [src.name]."))
		else
			to_chat(loc, span_warning("Уже есть пистоль."))
		return
	..()

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/attack_right(mob/user)
	if(pistol.len)
		var/obj/O = pistol[pistol.len]
		pistol -= O
		O.forceMove(user.loc)
		user.put_in_hands(O)
		icon_state = "holsterbelt"
		update_icon()
		return TRUE

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/examine(mob/user)
	. = ..()
	if(pistol.len == 1)
		. += span_notice("Пистоль внутри.")
	else
		. += span_notice("Кобура пустая.")

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/lord
	name = "plaque holster belt"
	desc = "Пояс с позолоченными металлическими вставками, демонстрирующими богатство и статус. Оснащен кобурой для удобного размещения пистоля."
	sellprice = 50
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	icon = 'modular_twilight_axis/firearms/icons/obj_belts_royal.dmi'
	mob_overlay_icon = 'modular_twilight_axis/firearms/icons/onmob_belts_royal.dmi'

/obj/item/storage/belt/rogue/leather/twilight_holsterbelt/lord/New()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/gun/ballistic/twilight_firearm/arquebus_pistol/A = new()
		pistol += A
	icon_state = "holsterbelt_full"
	update_icon()
