//TRAIN STATION 13

//STRUCTURES

/obj/structure/alien/resin/wall/gangway //Not really a wall, or a turf, but it's made of resin, allright.
	name = "gangway"
	desc = "A flexible connector fitted to the end of a railway coach, enabling passengers to move from one coach to another without danger of falling from the train."
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "gangway_still" //Does not animate by default when spawned, but will animate if the train is moving.
	can_block_air = FALSE
	smooth = FALSE
	max_integrity = 70

//MACHINES

/obj/machinery/media/jukebox/trainjukebox
	name = "wall radio"
	desc = "A modern wall mounted radio with audio visualizer."
	icon = 'trainstation13/icons/trainstructures.dmi'
	density = 0
	playlist_id="train"
	// Must be defined on your server.
	playlists=list(
		"bar"  = "Bar Mix",
		"mogesfm84"  = "Moghes FM-84",
		"moges" = "Moghes Club Music",
		"club" = "Club Mix",
		"customs" = "Customs Music",
		"japan" = "Banzai Radio",
		"govnar" = "Soviet Radio",
		"classic" = "Classical Music",
		"ussr_disco" = "Disco USSR-89s",
		"topreptilian" = "Top Reptillian",
		"zvukbanok" = "Sounds of beer cans",
		"eurobeat" = "Eurobeat",
		"finland" = "Suomi wave",
		"dreamsofvenus" = "Dreams of Venus",
		"hiphop" = "Hip-Hop for Space Gangstas",
		"vaporfunk" = "Qerrbalak VaporFunkFM",
		"thematic" = "Side-Bursting Tunes",
		"lofi" = "Sadness/Longing/Loneliness",
	)

/obj/machinery/computer/security/wooden_tv/train
	name = "Spektr-88"
	desc = "An old color TV that is still able to receive few analog channels."
	icon_state = "security_det_miami"
	state_broken_preset = null
	state_nopower_preset = null
	light_color = "#f535aa"
	network = list("beach","boxing")
	pixel_y = 3

/obj/machinery/space_heater/potbellystove
	name = "potbelly stove"
	desc = "This little stove will keep you warm and cozy during cold winter."
	anchored = TRUE
	density = TRUE
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "sheater-off"

//FURNITURE

/obj/structure/rack/traintable //Sort of a table limited to a single tile
	name = "table"
	desc = "A wedge shaped piece of metal standing on single metal leg.<br>It can not move, but you can fold it." //Add table folding feature.
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "table" //Has 4 directions

/obj/structure/rack/trainshelf //Technically a rack, but really a wall shelf you can pass through because it's attached to a wall slightly above human height.
	name = "wall shelf"
	desc = "A sturdy cargo wall shelf attached to a wall with metal pipes."
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "shelf_metal" //Has 4 directions
	density = FALSE

/obj/structure/stool/bed/chair/wood/fancy //Why does vanilla wooden furniture look so terrible?
	name = "fancy wooden chair"
	desc = "Judging by its soft red velour seat, this chair is too expensive for you."
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "wooden_chair_fancy"

/obj/structure/stool/sofa //Technically a stool, until Tau Ceti gets sofas.
	name = "sofa"
	icon = 'trainstation13/icons/trainstructures.dmi'
	icon_state = "sofa"

/obj/structure/bedsheetbin/trainbedsheetbin
	name = "linen bin"
	desc = "A linen bin. Don't forget to turn in your bedsheet."
	icon = 'icons/obj/structures.dmi'
	amount = 5

//DECALS

/obj/structure/sign/moon
	name = "photo of astronauts"
	desc = "A group photo of legendary astronauts who became the first people on the Moon."
	icon = 'trainstation13/icons/traindecals.dmi'
	icon_state = "photo_moon"

/obj/structure/sign/secretary
	name = "portrait of a person"
	desc = "A formal portrait. Must be someone really important."
	icon = 'trainstation13/icons/traindecals.dmi'
	icon_state = "portrait"

/obj/structure/sign/train
	name = "railcar number"
	desc = "A metal sign with a railcar number on it."
	icon = 'trainstation13/icons/traindecals.dmi'
	icon_state = "zero"
	layer = 4.4

//CARS

/obj/structure/atomobile //Automobile becomes atomobile - by WalterJe
	name = "taxi"
	desc = "A yellow cab with electric engine powered by micro fusion reactor."
	icon = 'trainstation13/icons/96x96.dmi'
	icon_state = "taxi"
	density = TRUE
	anchored = TRUE
	pixel_x = -16

/obj/structure/atomobile/white
	name = "white car"
	desc = "A white car with electric engine powered by micro fusion reactor."
	icon_state = "white"

/obj/structure/atomobile/blue
	name = "blue car"
	desc = "A blue car with electric engine powered by micro fusion reactor."
	icon_state = "blue"

/obj/structure/atomobile/derelict
	name = "scrap car"
	desc = "A rusty automobile carcass.<br>This car is damaged beyond repair."
	icon = 'trainstation13/icons/64x64.dmi'
	icon_state = "derelict_1"
	density = TRUE
	anchored = FALSE
	pixel_x = -20

/obj/structure/atomobile/derelict/atom_init()
	. = ..()
	dir = rand(1, 4)
	icon_state = "derelict_[rand(1, 6)]"