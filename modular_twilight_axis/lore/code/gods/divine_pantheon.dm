/datum/faith
	var/translated_name

/datum/patron
	var/translated_name

/datum/faith/divine
	name = "Divine Pantheon"
	translated_name = "Пантеон Десяти"
	desc = "Самая распространённая религия Гримории, сконцентрированная вокруг <b>Десяти</b> божеств, что унаследовали мир у <b>Всеотца</b>, погибшего от рук <b>Архиврага</b>. \n\
		Полчища Архиврага, да останется её имя забытым, подбираются все ближе; пантеон <b>Презренных</b> грозится разрушить наш мир; и даже сам Архитектор Вселенной больше не может нам помочь. Лишь только искренняя, абсолютная вера в Пантеон может спасти нас от <b>Конца Времён</b>."
	worshippers = "Большая часть жителей Великого Герцогства Азурия и многих других государств Гримории."

/datum/patron/divine/astrata
	name = "Astrata"
	translated_name = "Астрата"
	domain = "Солнце, порядок, правосудие, вера, тактика и стратегия, плодородие."
	desc = "Лучезарная Богиня Солнца, Его любящая дочь и та, кто приняла на себя тяжёлое бремя следить за Гриморией в отсутствие Отца и борющаяся с силами, что пытаются свергнуть мир во мрак и хаос."
	worshippers = "Верховные жрецы Десяти, дворяне, фанатики, офицеры, крестьяне и земледельцы."
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"ASTRATA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)

/datum/patron/divine/noc
	name = "Noc"
	translated_name = "Нок"
	domain = "Луна, знания, сумерки, аркана, контроль, сны."
	desc = "Богиня знаний, ночи, Луны, и тайн. Первая владыка Арканы. Нок сестра-близнец перворожденной Астраты. Увидав впервые Луну, она нарекла её своим владением, и каждый раз возносит ее в небеса над Гриморией, чтобы осветить темную ночь для тех кто следует ей."
	worshippers = "Маги, ученые, писцы, амбициозные личности, исследователи, зибантийцы, люпиане, лунатики."
	confess_lines = list(
		"NOC IS NIGHT!",
		"NOC SEES ALL!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)

/datum/patron/divine/dendor
	name = "Dendor"
	translated_name = "Дендор"
	domain = "Природа, звери, охота, плодородие, безумие, преображение."
	desc = "Младший сын Псайдона, тот, кому любящий Отец отмерил во владения зелёные заросли, могущественных зверей и дубравы. Со временем он обезумел от жестокости этого мира и его влияние ослабло, и тем не менее… чем дальше от цивилизации, в чёрных от зарослей лесах, влажных джунглях и горах… ты поймёшь насколько его влияние велико."
	worshippers = "Друиды, шаманы, звери, безумцы, охотники, скотоводцы, собиратели."
	confess_lines = list(
		"DENDOR PROVIDES!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssor
	name = "Abyssor"
	translated_name = "Абиссор"
	domain = "Море, ветер, стихия, торговля, плавания, природная магия, кошмары, тайны."
	desc = "Гневливый морской бог, бушующая морская стихия, что посылает штормы в моря и ветра не земли. Сын Псайдона, которому не удалось унаследовать престол отца, и тем не менее люди боятся и уважают его необузданную стихию."
	worshippers = "Мореплаватели, пираты, рыболовы, торговцы."
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)

/datum/patron/divine/ravox
	name = "Ravox"
	translated_name = "Равокс"
	domain = "Война, мужество, справедливость, сила, гордость."
	desc = "Смертный, что своей непоколебимой волей, решимостью, честным словом и мужество по праву удостоился места в Пантеоне. Герой божественной войны и тот, кто в час нужды встал на защиту смертных."
	worshippers = "Воины, солдаты, наёмники, странствующие рыцари, судьи."
	confess_lines = list(
		"RAVOX IS JUSTICE!",
		"THROUGH STRIFE, GRACE!",
		"THROUGH PERSISTENCE, GLORY!",
	)

/datum/patron/divine/necra
	name = "Necra"
	translated_name = "Некра"
	domain = "Смерть, жизнь, цикл, судьба."
	desc = "Госпожа загробного мира, та-что-знает-всё, что было и что предстоит, средняя дочь Псайдона, что всегда оставалась в тени, без устали неся возложенное на неё отцом бремя."
	worshippers = "Скорбящие, могильщики, мертвецы, философы."
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"THE UNDERMAIDEN IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, MY LADY AWAITS ME!",
	)

/datum/patron/divine/xylix
	name = "Xylix"
	translated_name = "Ксайликс"
	domain = "Хитрость, движение, смех, озорство, красноречие, удача."
	desc = "Многоликий бог хитрости и озорства, единственный из Десяти, что заполучил свою божественность лишь благодаря собственным трюкам, про него ходит множество легенд и слухов и столь же множество из них правдивы, столь же множество из них ложны."
	worshippers = "Шуты, актёры, менестрели, шулеры, пройдохи, воры, везунчики, дети."
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"NOC IS NIGHT!",
		"DENDOR PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"RAVOX IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!",
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY MUSE!",
		"EORA BRINGS US TOGETHER!",
		"REBUKE THE HERETICAL- PSYDON ENDURES!",
	)

/datum/patron/divine/pestra
	name = "Pestra"
	translated_name = "Пестра"
	domain = "Болезни, мучение, исцеление, милосердие, превозмогание, очищение, покой"
	desc = "Покровительница болезней, медицины и нуждающихся, чья милосердная рука старается избавить мир от порождения тьмы, заражения и мучений."
	worshippers = "Врачи, хирурги, больные, мученики, колдуны, апотекарии."
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)

/datum/patron/divine/malum
	name = "Malum"
	translated_name = "Малум"
	domain = "Огонь, сталь, труд, ремесло, терпение, упорство."
	desc = "Огненный Бог-Кузнец, первый из вознесённых смертных, покровитель трудящихся, тот, что несет ремесло и создание наравне с закалкой своей души. «Труд - уже награда». Малум известен как своим равнодушием, так и строгостью к последователям, куда более его радуют их творения."
	worshippers = "Кузнецы, строители, рабочие."
	confess_lines = list(
		"MALUM IS MY MUSE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)


/datum/patron/divine/eora
	name = "Eora"
	translated_name = "Эора"
	domain = "Жизнь, семья, мир, красота, сострадани."
	desc = "Самая младшая из богов, та что принесла конец распрям между богами и между смертными, объединив их под знаком любви."
	worshippers = "Художники, скульпторы, писатели, дипломаты, ораторы, супруги и любовники."
	confess_lines = list(
		"EORA BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"I LOVE YOU, EVEN AS YOU TRESPASS AGAINST ME!",
	)
