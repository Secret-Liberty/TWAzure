/datum/faith/inhumen
	name = "Ascendents"
	desc = "Вознесенные, также известные среди последователей Десяти как <b>пантеон Презренных</b> — некогда смертные, что смогли получить божественные силы, выкрав осколки падшего <b>Всеотца</b> в неразберихе <b>Войны в Небесах</b>.\n\
		Идеологии Презренных различны и противоречивы, и хотя при смертной жизни они были товарищами, последователи Трёх могут как действовать сообща, так и против друг друга — их объединяет лишь ненависть к мировому порядку, поддерживаемому Десятью."
	worshippers = "Отвергнутые церковью Десяти, радикалы, нонкомформисты."
	godhead = /datum/patron/inhumen/baotha

/datum/patron/inhumen
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine)			//Allows construction of unique bad shrine.

/datum/patron/inhumen/zizo
	name = "Zizo"
	domain = "Бессмертие, кровь, тьма, запретные знания, амбиции"
	desc = "Богиня нежизни, возмездия, метаморфозы и тьмы. Убийца Псайдона, Архивраг пантеона Десяти, презираемая всеми, кроме своих последователей, сама Зизо не видит в смертных объект своей ненависти. Это прекрасно демонстрируется ее главной заповедью, что часто звучит в молитвенных песнопениях её культистов: «Последний же враг истребится — смерть»."
	associated_faith = /datum/faith/cult_of_salvation
	worshippers = "Дроу-лоялисты, некроманты, практиканты тёмных аспектов магии, некоторые кланы высших вампиров."
	confess_lines = list(
		"PRAISE ZIZO!",
		"LONG LIVE ZIZO!",
		"ZIZO WILL SAVE US FROM OUR SUFFERING!",
	)

/datum/patron/inhumen/graggar
	name = "Graggar"
	domain = "Власть, сила, превосходство, завоевание"
	desc = "Бог силы и власти, которая приходит с ней, а также покровитель жадности. Без желаний власти быть не может. «Смерть слабым» — отчеканил Граггар, казня ближайших из своих подданных, которые позволили себе дать слабину."
	undead_hater = TRUE
	//crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine/graggar)
	worshippers = "Племенные народы, безумцы, маньяки, жестокий люд"
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"PEACE THROUGH POWER!",
		"THE GOD OF CONQUEST DEMANDS BLOOD!",
	)

/datum/patron/inhumen/matthios
	name = "Matthios"
	domain = "Анархия, свобода, революция, равенство и братство"
	desc = "Бог абсолютной свободы, анархии и восстания. «Через раздор к процветанию», обещает его главная заповедь, и его последователи пойдут на всё, чтобы претворить её в реальность, разрушив мировой порядок, каким мы его знаем."
	undead_hater = TRUE
	//crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine/matthios)
	worshippers = "Разбойники, наёмники, революционеры, свободолюбивый люд"
	confess_lines = list(
		"ALL TYRANTS WILL DIE ALONE!",
		"PROSPERITY THROUGH DISCORD!",
		"WE WILL RAZE CHURCHES AND PRISONS TO THE GROUND!",
	)

/datum/patron/inhumen/baotha
	name = "Baotha"
	domain = "Гедонизм, мирские удовольствия, индивидуализм"
	desc = "Баота — богиня гедонизма, мирских наслаждений и страстей. «Живи, люби, смейся!» — говорила она, глядя на суету вокруг себя и усилия окружающих, стремящихся двигать куда-то мир."
	worshippers = "Избалованные богачи, маргиналы, эскаписты."
	undead_hater = TRUE
	//crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine/baotha)
	confess_lines = list(
		"BAOTHA DEMANDS PLEASURE!",
		"LIVE, LAUGH, LOVE!",
		"BAOTHA IS MY JOY!",
	)

/////////////////////////////////
// Does God Hear Your Prayer ? //
/////////////////////////////////

// Zizo - When the sun is blotted out, zchurch, bad-cross, or ritual chalk
/datum/patron/inhumen/zizo/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/indoors/shelter/mountains))
		return TRUE
	// Allows prayer near EEEVIL psycross
	for(var/obj/structure/fluff/psycross/zizocross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer near a grave.
	for(var/obj/structure/closet/dirthole/grave/G in view(4, get_turf(follower)))
		return TRUE
	// Allows prayer during the sun being blotted from the sky.
	if(hasomen(OMEN_SUNSTEAL))
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/zizo in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Zizo to hear my prayers I must either be in the church of the abandoned, near an inverted psycross, atop a drawn Zizite symbol, or while the sun is blotted from the sky!"))
	return FALSE


// Graggar - When bleeding, near blood on ground, zchurch, bad-cross, or ritual chalk
/datum/patron/inhumen/graggar/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/indoors/shelter/mountains))
		return TRUE
	// Allows prayer near EEEVIL psycross
	for(var/obj/structure/fluff/psycross/zizocross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer if actively bleeding.
	if(follower.bleed_rate > 0)
		return TRUE
	// Allows prayer near blood.
	for(var/obj/effect/decal/cleanable/blood in view(3, get_turf(follower)))
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/graggar in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Graggar to hear my prayers I must either be in the church of the abandoned, near an inverted psycross, near fresh blood or draw blood of my own!"))
	return FALSE

// Matthios - When near coin of at least 100 mammon, zchurch, bad-cross, or ritual talk
/datum/patron/inhumen/matthios/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/indoors/shelter/mountains))
		return TRUE
	// Allows prayer near EEEVIL psycross
	for(var/obj/structure/fluff/psycross/zizocross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer if the user has more than 100 mammon on them.
	var/mammon_count = get_mammons_in_atom(follower)
	if(mammon_count >= 100)
		return TRUE
	// Spend 5/10 mammon to pray. Megachurch pastors be like.....
	var/obj/item/held_item = follower.get_active_held_item()
	var/helditemvalue = held_item.get_real_price()
	if(istype(held_item, /obj/item/roguecoin) && helditemvalue >= 5)
		qdel(held_item)
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/matthios in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Matthios to hear my prayers I must either be in the church of the abandoned, near an inverted psycross, flaunting wealth upon me of at least 100 mammon, or offer a coin of at least five mammon up to him!"))
	return FALSE

// Baotha 
/datum/patron/inhumen/baotha/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/indoors/shelter/mountains))
		return TRUE
	// Allows prayer near EEEVIL psycross
	for(var/obj/structure/fluff/psycross/zizocross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayers in the bath house - whore.
	if(istype(get_area(follower), /area/rogue/indoors/town/bath))
		return TRUE
	// Allows prayers if actively high on drugs.
	if(follower.has_status_effect(/datum/status_effect/buff/ozium) || follower.has_status_effect(/datum/status_effect/buff/moondust) || follower.has_status_effect(/datum/status_effect/buff/moondust_purest) || follower.has_status_effect(/datum/status_effect/buff/druqks) || follower.has_status_effect(/datum/status_effect/buff/starsugar))
		return TRUE
	// Allows prayers if the user is drunk.
	if(follower.has_status_effect(/datum/status_effect/buff/drunk))
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/baotha in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Baotha to hear my prayers I must either be in the church of the abandoned, near an inverted psycross, within the town's bathhouse, or actively partaking in one of various types of nose-candy!"))
	return FALSE
