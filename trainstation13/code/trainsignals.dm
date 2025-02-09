//TRAIN STATION 13

//This module is responsible for railway signals system.

/obj/structure/trainstation/trainsignal
	name = "railway signal"
	desc = "A visual display device that conveys instructions or provides warning of instructions regarding the driver�s authority to proceed."
	icon = 'trainstation13/icons/32x64.dmi'
	icon_state = "signal_red"
	density = TRUE
	light_power = 1
	light_range = 4
	light_color = "#f47a7a"


//SIGNAL SPAWNER AND SWITCH

//SIGNALS

var/list/signal_spawner = list()

/obj/effect/signalspawner
	name = "railway signal spawner"
	desc = "Spawns a signal along the rail tracks for train driver."
	icon = 'trainstation13/icons/trainareas.dmi'
	icon_state = "signal"
	anchored = TRUE
	layer = TURF_LAYER
	plane = GAME_PLANE
	unacidable = TRUE
	invisibility = INVISIBILITY_ABSTRACT

	var/list/spawntypes = list(/obj/structure/trainstation/trainsignal)

/obj/effect/signalspawner/atom_init()
	signal_spawner += src

/obj/effect/signalspawner/proc/do_spawn()
	for(var/spawntype in spawntypes)
		new spawntype(loc)

/client/proc/spawn_signal()
	set category = "Event"
	set name = "TS13 Signals - Spawn Signal"

	log_admin("[usr.key] has spawned railway signal.")
	message_admins("[key_name_admin(usr)] has spawned railway signal.")

	for(var/obj/effect/signalspawner/T in signal_spawner)
		if(T.anchored)
			T.do_spawn()

var/railway_signal_state = 1 //1 - red, 2 - green, 3 - off, 4 - blue, 5 - white

var/list/railway_signals = list()

/proc/set_railway_signal_state(value)
	railway_signal_state = value

	for(var/obj/structure/trainstation/trainsignal/red in railway_signals)
		red.update_icon()

/obj/structure/trainstation/trainsignal/atom_init()
	. = ..()
	railway_signals += src
	update_icon()

/obj/structure/trainstation/trainsignal/update_icon()
	switch(railway_signal_state)
		if(1)
			icon_state = "signal_red"
			light_color = "#f47a7a"
			light_power = 1
			light_range = 4
		if(2)
			icon_state = "signal_green"
			light_color = "#c0ff9e"
			light_power = 1
			light_range = 4
		if(3)
			icon_state = "signal_off"
			light_color = "#ffffff"
			light_power = 0
			light_range = 0
		if(4)
			icon_state = "signal_blue"
			light_color = "#7db3f6"
			light_power = 1
			light_range = 4
		if(5)
			icon_state = "signal_white"
			light_color = "#fff1ce"
			light_power = 1
			light_range = 4
	update_light()

/client/proc/toggle_signals()
	set category = "Event"
	set name = "TS13 Signals - Toggle Signal Lights"

	var/msg
	if(railway_signal_state==1)
		railway_signal_state=2
		msg = "ALL railway SIGNALS are GREEN!"
	else if(railway_signal_state==2)
		railway_signal_state=3
		msg = "ALL railway SIGNALS are OFF!"
	else if(railway_signal_state==3)
		railway_signal_state=4
		msg = "ALL railway SIGNALS are BLUE!"
	else if(railway_signal_state==4)
		railway_signal_state=5
		msg = "ALL railway SIGNALS are WHITE!"
	else if(railway_signal_state==5)
		railway_signal_state=1
		msg = "ALL railway SIGNALS are RED!"

	log_admin("[usr.key] has toggled railway signals, now [msg].")
	message_admins("[key_name_admin(usr)] has toggled railway signals, now [msg].")

	for(var/obj/structure/trainstation/trainsignal/red in railway_signals)
		red.update_icon()