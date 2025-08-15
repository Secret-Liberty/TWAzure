GLOBAL_LIST_EMPTY(loadout_items)
GLOBAL_LIST_EMPTY(loadout_items_by_name)

/datum/loadout_item
	var/name = "Parent loadout datum"
	var/desc
	var/path
	var/donoritem			//autoset on new if null
	var/donatitem = FALSE
	var/list/ckeywhitelist

/datum/loadout_item/New()
	if(isnull(donoritem))
		if(ckeywhitelist)
			donoritem = TRUE

/datum/loadout_item/proc/donator_ckey_check(key)
	if(ckeywhitelist && ckeywhitelist.Find(key))
		return TRUE
	return

//Miscellaneous

/datum/loadout_item/card_deck
	name = "Card Deck"
	path = /obj/item/toy/cards/deck

/datum/loadout_item/farkle_dice
	name = "Farkle Dice Container"
	path = /obj/item/storage/pill_bottle/dice/farkle

/datum/loadout_item/tarot_deck
	name = "Tarot Deck"
	path = /obj/item/toy/cards/deck/tarot

//HATS
/datum/loadout_item/shalal
	name = "Keffiyeh"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal

/datum/loadout_item/tricorn
	name = "Tricorn Hat"
	path = /obj/item/clothing/head/roguetown/helmet/tricorn

/datum/loadout_item/archercap
	name = "Archer cap"
	path = /obj/item/clothing/head/roguetown/archercap

/datum/loadout_item/strawhat
	name = "Straw Hat"
	path = /obj/item/clothing/head/roguetown/strawhat

/datum/loadout_item/witchhat
	name = "Witch Hat"
	path = /obj/item/clothing/head/roguetown/witchhat

/datum/loadout_item/bardhat
	name = "Bard Hat"
	path = /obj/item/clothing/head/roguetown/bardhat

/datum/loadout_item/fancyhat
	name = "Fancy Hat"
	path = /obj/item/clothing/head/roguetown/fancyhat

/datum/loadout_item/furhat
	name = "Fur Hat"
	path = /obj/item/clothing/head/roguetown/hatfur

/datum/loadout_item/smokingcap
	name = "Smoking Cap"
	path = /obj/item/clothing/head/roguetown/smokingcap

/datum/loadout_item/headband
	name = "Headband"
	path = /obj/item/clothing/head/roguetown/headband

/datum/loadout_item/buckled_hat
	name = "Buckled Hat"
	path = /obj/item/clothing/head/roguetown/puritan

/datum/loadout_item/folded_hat
	name = "Folded Hat"
	path = /obj/item/clothing/head/roguetown/bucklehat

/datum/loadout_item/duelist_hat
	name = "Duelist Hat"
	path = /obj/item/clothing/head/roguetown/duelhat

/datum/loadout_item/hood
	name = "Hood"
	path = /obj/item/clothing/head/roguetown/roguehood

/datum/loadout_item/hijab
	name = "Hijab"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab

/datum/loadout_item/heavyhood
	name = "Heavy Hood"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal/heavyhood

/datum/loadout_item/nunveil
	name = "Nun Veil"
	path = /obj/item/clothing/head/roguetown/nun

/datum/loadout_item/papakha
	name = "Papakha"
	path = /obj/item/clothing/head/roguetown/papakha

//CLOAKS
/datum/loadout_item/tabard
	name = "Tabard"
	path = /obj/item/clothing/cloak/tabard

/datum/loadout_item/surcoat
	name = "Surcoat"
	path = /obj/item/clothing/cloak/stabard

/datum/loadout_item/jupon
	name = "Jupon"
	path = /obj/item/clothing/cloak/stabard/surcoat

/datum/loadout_item/cape
	name = "Cape"
	path = /obj/item/clothing/cloak/cape

/datum/loadout_item/halfcloak
	name = "Halfcloak"
	path = /obj/item/clothing/cloak/half

/datum/loadout_item/ridercloak
	name = "Rider Cloak"
	path = /obj/item/clothing/cloak/half/rider

/datum/loadout_item/raincloak
	name = "Rain Cloak"
	path = /obj/item/clothing/cloak/raincloak

/datum/loadout_item/furcloak
	name = "Fur Cloak"
	path = /obj/item/clothing/cloak/raincloak/furcloak

/datum/loadout_item/direcloak
	name = "direbear cloak"
	path = /obj/item/clothing/cloak/darkcloak/bear

/datum/loadout_item/lightdirecloak
	name = "light direbear cloak"
	path = /obj/item/clothing/cloak/darkcloak/bear/light

/datum/loadout_item/volfmantle
	name = "Volf Mantle"
	path = /obj/item/clothing/cloak/volfmantle

/datum/loadout_item/eastcloak2
	name = "Leather Cloak"
	path = /obj/item/clothing/cloak/eastcloak2

/datum/loadout_item/thief_cloak
	name = "Rapscallion Shawl"
	path = /obj/item/clothing/cloak/thief_cloak

//SHOES
/datum/loadout_item/darkboots
	name = "Dark Boots"
	path = /obj/item/clothing/shoes/roguetown/boots

/datum/loadout_item/babouche
	name = "Babouche"
	path = /obj/item/clothing/shoes/roguetown/shalal

/datum/loadout_item/nobleboots
	name = "Noble Boots"
	path = /obj/item/clothing/shoes/roguetown/boots/nobleboot

/datum/loadout_item/sandals
	name = "Sandals"
	path = /obj/item/clothing/shoes/roguetown/sandals

/datum/loadout_item/shortboots
	name = "Short Boots"
	path = /obj/item/clothing/shoes/roguetown/shortboots

/datum/loadout_item/gladsandals
	name = "Gladiatorial Sandals"
	path = /obj/item/clothing/shoes/roguetown/gladiator

/datum/loadout_item/ridingboots
	name = "Riding Boots"
	path = /obj/item/clothing/shoes/roguetown/ridingboots

/datum/loadout_item/ankletscloth
	name = "Cloth Anklets"
	path = /obj/item/clothing/shoes/roguetown/boots/clothlinedanklets

/datum/loadout_item/ankletsfur
	name = "Fur Anklets"
	path = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets

/datum/loadout_item/exoticanklets
	name = "Exotic Anklets"
	path = /obj/item/clothing/shoes/roguetown/anklets

/datum/loadout_item/rumaclanshoes
	name = "Raised Sandals"
	path = /obj/item/clothing/shoes/roguetown/armor/rumaclan

//SHIRTS
/datum/loadout_item/longcoat
	name = "Longcoat"
	path = /obj/item/clothing/suit/roguetown/armor/longcoat

/datum/loadout_item/robe
	name = "Robe"
	path = /obj/item/clothing/suit/roguetown/shirt/robe

/datum/loadout_item/formalsilks
	name = "Formal Silks"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan

/datum/loadout_item/longshirt
	name = "Shirt"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/black

/datum/loadout_item/shortshirt
	name = "Short-sleeved Shirt"
	path = /obj/item/clothing/suit/roguetown/shirt/shortshirt

/datum/loadout_item/sailorshirt
	name = "Striped Shirt"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor

/datum/loadout_item/sailorjacket
	name = "Leather Jacket"
	path = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor

/datum/loadout_item/priestrobe
	name = "Undervestments"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest

/datum/loadout_item/exoticsilkbra
	name = "Exotic Silk Bra"
	path = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra

/datum/loadout_item/bottomtunic
	name = "Low-cut Tunic"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut

/datum/loadout_item/tunic
	name = "Tunic"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic

/datum/loadout_item/stripedtunic
	name = "Striped Tunic"
	path = /obj/item/clothing/suit/roguetown/armor/workervest

/datum/loadout_item/dress
	name = "Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen

/datum/loadout_item/bardress
	name = "Bar Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress

/datum/loadout_item/chemise
	name = "Chemise"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress

/datum/loadout_item/sexydress
	name = "Sexy Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy

/datum/loadout_item/straplessdress
	name = "Strapless Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless

/datum/loadout_item/straplessdress/alt
	name = "Strapless Dress, alt"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/alt

/datum/loadout_item/gown
	name = "Spring Gown"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gown

/datum/loadout_item/gown/summer
	name = "Summer Gown"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gown/summergown

/datum/loadout_item/gown/fall
	name = "Fall Gown"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gown/fallgown

/datum/loadout_item/gown/winter
	name = "Winter Gown"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gown/wintergown

/datum/loadout_item/gown/silkydress
	name = "Silky Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/silkydress

/datum/loadout_item/noblecoat
	name = "Fancy Coat"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat

/datum/loadout_item/leathervest
	name = "Leather Vest"
	path = /obj/item/clothing/suit/roguetown/armor/leather/vest

/datum/loadout_item/nun_habit
	name = "Nun Habit"
	path = /obj/item/clothing/suit/roguetown/shirt/robe/nun

/datum/loadout_item/eastshirt1
	name = "Black Foreign Shirt"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1

/datum/loadout_item/eastshirt2
	name = "White Foreign Shirt"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt2
//PANTS
/datum/loadout_item/tights
	name = "Cloth Tights"
	path = /obj/item/clothing/under/roguetown/tights/black

/datum/loadout_item/leathertights
	name = "Leather Tights"
	path = /obj/item/clothing/under/roguetown/trou/leathertights

/datum/loadout_item/trou
	name = "Work Trousers"
	path = /obj/item/clothing/under/roguetown/trou

/datum/loadout_item/leathertrou
	name = "Leather Trousers"
	path = /obj/item/clothing/under/roguetown/trou/leather

/datum/loadout_item/sailorpants
	name = "Seafaring Pants"
	path = /obj/item/clothing/under/roguetown/tights/sailor

/datum/loadout_item/skirt
	name = "Skirt"
	path = /obj/item/clothing/under/roguetown/skirt

//ACCESSORIES

/datum/loadout_item/wrappings
	name = "Handwraps"
	path = /obj/item/clothing/wrists/roguetown/wrappings

/datum/loadout_item/loincloth
	name = "Loincloth"
	path = /obj/item/clothing/under/roguetown/loincloth

/datum/loadout_item/spectacles
	name = "Spectacles"
	path = /obj/item/clothing/mask/rogue/spectacles

/datum/loadout_item/fingerless
	name = "Fingerless Gloves"
	path = /obj/item/clothing/gloves/roguetown/fingerless

/datum/loadout_item/exoticsilkbelt
	name = "Exotic Silk Belt"
	path = /obj/item/storage/belt/rogue/leather/exoticsilkbelt

/datum/loadout_item/ragmask
	name = "Rag Mask"
	path = /obj/item/clothing/mask/rogue/ragmask

/datum/loadout_item/halfmask
	name = "Halfmask"
	path = /obj/item/clothing/mask/rogue/shepherd

/datum/loadout_item/dendormask
	name = "Briar Mask"
	path = /obj/item/clothing/head/roguetown/dendormask

/datum/loadout_item/exoticsilkmask
	name = "Exotic Silk Mask"
	path = /obj/item/clothing/mask/rogue/exoticsilkmask

/datum/loadout_item/duelmask
	name = "Duelist Mask"
	path = /obj/item/clothing/mask/rogue/duelmask

/datum/loadout_item/pipe
	name = "Pipe"
	path = /obj/item/clothing/mask/cigarette/pipe

/datum/loadout_item/pipewestman
	name = "Westman Pipe"
	path = /obj/item/clothing/mask/cigarette/pipe/westman

/datum/loadout_item/feather
	name = "Feather"
	path = /obj/item/natural/feather

/datum/loadout_item/collar
	name = "Collar"
	path = /obj/item/clothing/neck/roguetown/collar

/datum/loadout_item/forlon_collar
	name = "Light Forlorn Collar"
	path = /obj/item/clothing/neck/roguetown/collar/forlorn

/datum/loadout_item/bell_collar
	name = "Bell Collar"
	path = /obj/item/clothing/neck/roguetown/collar/bell_collar

/datum/loadout_item/cursed_collar
	name = "Cursed Collar"
	path = /obj/item/clothing/neck/roguetown/gorget/cursed_collar

/datum/loadout_item/cloth_blindfold
	name = "Cloth Blindfold"
	path = /obj/item/clothing/mask/rogue/blindfold

/datum/loadout_item/psicross
	name = "Psydonian Cross"
	path = /obj/item/clothing/neck/roguetown/psicross

/datum/loadout_item/psicross/astrata
	name = "Amulet of Astrata"
	path = /obj/item/clothing/neck/roguetown/psicross/astrata

/datum/loadout_item/psicross/noc
	name = "Amulet of Noc"
	path = /obj/item/clothing/neck/roguetown/psicross/noc

/datum/loadout_item/psicross/abyssor
	name = "Amulet of Abyssor"
	path = /obj/item/clothing/neck/roguetown/psicross/abyssor

/datum/loadout_item/psicross/dendor
	name = "Amulet of Dendor"
	path = /obj/item/clothing/neck/roguetown/psicross/dendor

/datum/loadout_item/psicross/necra
	name = "Amulet of Necra"
	path = /obj/item/clothing/neck/roguetown/psicross/necra

/datum/loadout_item/psicross/pestra
	name = "Amulet of Pestra"
	path = /obj/item/clothing/neck/roguetown/psicross/pestra

/datum/loadout_item/psicross/ravox
	name = "Amulet of Ravox"
	path = /obj/item/clothing/neck/roguetown/psicross/ravox

/datum/loadout_item/psicross/malum
	name = "Amulet of Malum"
	path = /obj/item/clothing/neck/roguetown/psicross/malum

/datum/loadout_item/psicross/eora
	name = "Amulet of Eora"
	path = /obj/item/clothing/neck/roguetown/psicross/eora

/datum/loadout_item/wedding_band
	name = "silver wedding band"
	path = /obj/item/clothing/ring/band

/datum/loadout_item/chaperon
    name = "Chaperon (Normal)"
    path = /obj/item/clothing/head/roguetown/chaperon

/datum/loadout_item/chaperon/alt
    name = "Chaperon (Alt)"
    path = /obj/item/clothing/head/roguetown/chaperon/greyscale

/datum/loadout_item/chaperon/burgher
    name = "Noble Chaperon"
    path = /obj/item/clothing/head/roguetown/chaperon/noble

/datum/loadout_item/jesterhat
    name = "Jester Hat"
    path = /obj/item/clothing/head/roguetown/jester

/datum/loadout_item/jestertunick
    name = "Jester Tunick"
    path = /obj/item/clothing/suit/roguetown/shirt/jester

/datum/loadout_item/jestershoes
    name = "Jester Shoes"
    path = /obj/item/clothing/shoes/roguetown/jester

/datum/loadout_item/cotehardie
	name = "Fitted Coat"
	path = /obj/item/clothing/cloak/cotehardie

//Donator Section
//All these items are stored in the donator_fluff.dm in the azure modular folder for simplicity.
//All should be subtypes of existing weapons/clothes/armor/gear, whatever, to avoid balance issues I guess. Idk, I'm not your boss.

// Энчант киты
/datum/loadout_item/donator_plex
	name = "Donator Kit - Rapier di Aliseo - Required: Rapier"
	path = /obj/item/enchantingkit/plexiant
	donatitem = TRUE

/datum/loadout_item/donator_sru
	name = "Donator Kit - Emerald Dress - Required: Dress"
	path = /obj/item/enchantingkit/srusu
	donatitem = TRUE

/datum/loadout_item/donator_strudel
	name = "Donator Kit - Grenzelhoftian Mage Vest - Required: Robe"
	path = /obj/item/enchantingkit/strudle
	donatitem = TRUE

/datum/loadout_item/donator_bat
	name = "Donator Kit - Handcarved Harp - Required: Harp"
	path = /obj/item/enchantingkit/bat
	donatitem = TRUE

/datum/loadout_item/donator_mansa
	name = "Donator Kit - Wortträger - Required: Estoc"
	path = /obj/item/enchantingkit/ryebread
	donatitem = TRUE

/datum/loadout_item/donator_rebel
	name = "Donator Kit - Gilded Sallet - Required: Visored Sallet"
	path = /obj/item/enchantingkit/rebel
	donatitem = TRUE

/datum/loadout_item/donator_zydras
	name = "Donator Kit - Padded silky dress - Required: Silky Dress"
	path = /obj/item/enchantingkit/zydras
	donatitem = TRUE

// Разное
/datum/loadout_item/donat
	name = "Музыкальная коробка"
	path = /obj/item/dmusicbox
	donatitem = TRUE

/datum/loadout_item/donat/lute
	name = "Музыкальный инструмент: Лютня"
	path = /obj/item/rogue/instrument/lute
	donatitem = TRUE

/datum/loadout_item/donat/accord
	name = "Музыкальный инструмент: Аккордеон"
	path = /obj/item/rogue/instrument/accord
	donatitem = TRUE

/datum/loadout_item/donat/guitar
	name = "Музыкальный инструмент: Гитара"
	path = /obj/item/rogue/instrument/guitar
	donatitem = TRUE

/datum/loadout_item/donat/harp
	name = "Музыкальный инструмент: Арфа"
	path = /obj/item/rogue/instrument/harp
	donatitem = TRUE

/datum/loadout_item/donat/flute
	name = "Музыкальный инструмент: Флейта"
	path = /obj/item/rogue/instrument/flute
	donatitem = TRUE

/datum/loadout_item/donat/drum
	name = "Музыкальный инструмент: Барабан"
	path = /obj/item/rogue/instrument/drum
	donatitem = TRUE

/datum/loadout_item/donat/shamisen
	name = "Музыкальный инструмент: Сямисэн"
	path = /obj/item/rogue/instrument/shamisen
	donatitem = TRUE

// Одежда для донатеров
/datum/loadout_item/donat/corset
	name = "Корсет"
	path = /obj/item/clothing/suit/roguetown/armor/corset
	donatitem = TRUE

// Табарды и плащи

/datum/loadout_item/donat/matron
	name = "Плащ матроны"
	path = /obj/item/clothing/cloak/matron
	donatitem = TRUE

/datum/loadout_item/donat/capeblkknight
	name = "Кровавая мантия"
	path = /obj/item/clothing/cloak/cape/blkknight
	donatitem = TRUE

/datum/loadout_item/donat/xylixiancloak
	name = "Ксайликситский плащ"
	path = /obj/item/clothing/cloak/templar/xylixian
	donatitem = TRUE

/datum/loadout_item/donat/furcloak
	name = "Меховой плащ"
	path = /obj/item/clothing/cloak/raincloak/furcloak
	donatitem = TRUE

/datum/loadout_item/donat/battleskirt
	name = "Боевая юбка"
	path = /obj/item/clothing/cloak/fauld/battleskirt
	donatitem = TRUE

/datum/loadout_item/donat/faulds
	name = "Фольд"
	path = /obj/item/clothing/cloak/fauld
	donatitem = TRUE

/datum/loadout_item/donat/tabard/astata
	name = "Табард-плащ Астраты"
	path = /obj/item/clothing/cloak/templar/astratan
	donatitem = TRUE

/datum/loadout_item/donat/tabard/crusader/noc
	name = "Табард-плащ Нок"
	path = /obj/item/clothing/cloak/tabard/crusader/noc
	donatitem = TRUE

/datum/loadout_item/donat/tabard/crusader/dendor
	name = "Табард-плащ Дендора"
	path = /obj/item/clothing/cloak/tabard/crusader/dendor
	donatitem = TRUE

/datum/loadout_item/donat/tabard/pestra
	name = "Табард-плащ Пестры"
	path = /obj/item/clothing/cloak/templar/pestran
	donatitem = TRUE

/datum/loadout_item/donat/tabard/malum
	name = "Табард-плащ Малума"
	path = /obj/item/clothing/cloak/templar/malumite
	donatitem = TRUE

/datum/loadout_item/donat/tabard/abyssor
	name = "Табард-плащ Абиссора"
	path = /obj/item/clothing/cloak/abyssortabard
	donatitem = TRUE

/datum/loadout_item/donat/tabard/crusader/ravox
	name = "Табард-плащ Равокса"
	path = /obj/item/clothing/cloak/tabard/crusader/ravox
	donatitem = TRUE

/datum/loadout_item/donat/tabard/crusader/eora
	name = "Табард-плащ Эоры(старый)"
	path = /obj/item/clothing/cloak/tabard/crusader/eora
	donatitem = TRUE

/datum/loadout_item/donat/tabard/eora
	name = "Табард-плащ Эоры"
	path = /obj/item/clothing/cloak/templar/eoran
	donatitem = TRUE

/datum/loadout_item/donat/tabard/crusader/necra
	name = "Табард Некры"
	path = /obj/item/clothing/cloak/templar/necran
	donatitem = TRUE
	
/datum/loadout_item/donat/tabard/crusader/psydon
	name = "Табард Псайдона"
	path = /obj/item/clothing/cloak/psydontabard
	donatitem = TRUE

// Маски

/datum/loadout_item/donat/naledimask
	name = "Маска Наледи"
	path = /obj/item/clothing/mask/rogue/lordmask/naledi/decorated
	donatitem = TRUE

/datum/loadout_item/donat/eoramask
	name = "Эоранская маска"
	path = /obj/item/clothing/head/roguetown/eoramask
	donatitem = TRUE
