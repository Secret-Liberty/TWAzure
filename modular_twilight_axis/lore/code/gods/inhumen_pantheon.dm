/datum/faith/inhumen
	name = "Ascendents"
	translated_name = "Вознесенные"
	desc = "<b>Святая Экклезиархия</b>, также известая среди последователей Десяти как <b>пантеон Презренных</b> — совокупность из трёх религиозных течений, сосредоточенных вокруг идеологий тех, кого называют <b>Вознесёнными</b>. Некогда бывшие смертными, Вознесённые овладели божественными силами, выкрав осколки падшего <b>Всеотца</b> в неразберихе <b>Войны в Небесах</b>.\n\
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
	//crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/zizo_shrine/graggar)
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
