/datum/faith/inhumen
	name = "Ascendents"
	translated_name = "Вознесенные"
	desc = "Вознесенные, также известные среди последователей Десяти как <b>пантеон Презренных</b> — некогда смертные, что смогли получить божественные силы, выкрав осколки падшего <b>Всеотца</b> в неразберихе <b>Войны в Небесах</b>.\n\
		Идеологии Презренных различны и противоречивы, и хотя при смертной жизни они были товарищами, последователи Трёх могут как действовать сообща, так и против друг друга — их объединяет лишь ненависть к мировому порядку, поддерживаемому Десятью."
	worshippers = "Отвергнутые церковью Десяти, радикалы, нонкомформисты."
	godhead = /datum/patron/inhumen/baotha

/datum/patron/inhumen/zizo
	name = "Zizo"
	translated_name = "Зизо"
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
	translated_name = "Граггар"
	domain = "Власть, сила, превосходство, завоевание"
	desc = "Бог силы и власти, которая приходит с ней, а также покровитель жадности. Без желаний власти быть не может. «Смерть слабым» — отчеканил Граггар, казня ближайших из своих подданных, которые позволили себе дать слабину."
	undead_hater = TRUE
	crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine/graggar)
	worshippers = "Племенные народы, безумцы, маньяки, жестокий люд"
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"PEACE THROUGH POWER!",
		"THE GOD OF CONQUEST DEMANDS BLOOD!",
	)

/datum/patron/inhumen/matthios
	name = "Matthios"
	translated_name = "Маттиос"
	domain = "Анархия, свобода, революция, равенство и братство"
	desc = "Бог абсолютной свободы, анархии и восстания. «Через раздор к процветанию», обещает его главная заповедь, и его последователи пойдут на всё, чтобы претворить её в реальность, разрушив мировой порядок, каким мы его знаем."
	undead_hater = TRUE
	crafting_recipes = list()
	worshippers = "Разбойники, наёмники, революционеры, свободолюбивый люд"
	confess_lines = list(
		"ALL TYRANTS WILL DIE ALONE!",
		"PROSPERITY THROUGH DISCORD!",
		"WE WILL RAZE CHURCHES AND PRISONS TO THE GROUND!",
	)

/datum/patron/inhumen/baotha
	name = "Baotha"
	translated_name = "Баота"
	domain = "Гедонизм, мирские удовольствия, индивидуализм"
	desc = "Баота — богиня гедонизма, мирских наслаждений и страстей. «Живи, люби, смейся!» — говорила она, глядя на суету вокруг себя и усилия окружающих, стремящихся двигать куда-то мир."
	worshippers = "Избалованные богачи, маргиналы, эскаписты."
	undead_hater = TRUE
	crafting_recipes = list()
	confess_lines = list(
		"BAOTHA DEMANDS PLEASURE!",
		"LIVE, LAUGH, LOVE!",
		"BAOTHA IS MY JOY!",
	)

/////////////////////////////////
// Does God Hear Your Prayer ? //
/////////////////////////////////

/datum/patron/proc/can_pray_inhumen(mob/living/follower)
	// Allows death-bed prayers
	if(follower.has_status_effect(STATUS_EFFECT_UNCONSCIOUS))
		if(follower.has_status_effect(STATUS_EFFECT_SLEEPING))
			to_chat(follower, span_danger("I mustn't be sleeping to pray!"))
			return FALSE	//Stops praying just by sleeping.
	SHOULD_CALL_PARENT(TRUE)
	. = TRUE

// Graggar - When bleeding, near blood on ground, zchurch, bad-cross, or ritual chalk
/datum/patron/inhumen/graggar/can_pray_inhumen(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/indoors/shelter/mountains))
		return TRUE
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
	for(var/obj/structure/fluff/psycross/zizocross/graggar/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("This altar has been corrupted by the Ten! It blocks my prayers!"))
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
	to_chat(follower, span_danger("For Graggar to hear my prayers I must either be in the church of the abandoned, near an altar dedicated to Him, near fresh blood or draw blood of my own!"))
	return FALSE

// Matthios - Basically any way you'd like really, so long as there are comrades with you
/datum/patron/inhumen/matthios/can_pray_inhumen(mob/living/follower)
	. = ..()
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
	for(var/mob/living/carbon/human/comrade in view(4, get_turf(follower)))
		if(istype(comrade.patron, /datum/patron/inhumen/matthios))
			return TRUE
	to_chat(follower, span_danger("Matthios will hear any prayer I offer, so long as I have at least one comrade near me!"))
	return FALSE

// Baotha 
/datum/patron/inhumen/baotha/can_pray_inhumen(mob/living/follower)
	. = ..()
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That acursed cross interupts my prayers!"))
			return FALSE
	// Allows prayers in the bath house - whore.
	if(istype(get_area(follower), /area/rogue/indoors/town/bath))
		return TRUE
	// Allows prayers if actively high on drugs.
	if(follower.has_status_effect(/datum/status_effect/buff/ozium) || follower.has_status_effect(/datum/status_effect/buff/moondust) || follower.has_status_effect(/datum/status_effect/buff/moondust_purest) || follower.has_status_effect(/datum/status_effect/buff/druqks) || follower.has_status_effect(/datum/status_effect/buff/starsugar))
		return TRUE
	// Allows prayers if the user is drunk.
	if(follower.has_status_effect(/datum/status_effect/buff/drunk))
		return TRUE
	// Allows prayers if the user is generally happy.
	if(follower.has_status_effect(/datum/status_effect/mood/vgood))
		return TRUE
	// Allows prayers during sex
	if(follower.sexcon.arousal >= 10)
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/baotha in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Baotha to hear my prayers I must either be in the church of the abandoned, within the town's bathhouse, or actively enjoying myself, be that through drugs, sex, or whatever it is that gets my blood pumpin'!"))
	return FALSE
