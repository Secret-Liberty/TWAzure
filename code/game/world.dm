#define RESTART_COUNTER_PATH "data/round_counter.txt"

GLOBAL_VAR(restart_counter)

//This runs before most anything else, for more info see:
//https://github.com/Cyberboss/tgstation/blob/1afa69d66adfc810ab68c45a4fa5985c780ba6ff/code/game/world.dm#L10
//But note that not all of this necessarily applies to us(particularly proccalls)

/world/proc/Genesis(tracy_initialized = FALSE)
	#ifdef USE_BYOND_TRACY
	#warn USE_BYOND_TRACY is enabled
	if(!tracy_initialized)
		init_byond_tracy()
		Genesis(tracy_initialized = TRUE)
		return
	#endif

	init_debugger()
	//Zirok was here

/**
  * World creation
  *
  * Here is where a round itself is actually begun and setup, lots of important config changes happen here
  * * db connection setup
  * * config loaded from files
  * * loads admins
  * * Sets up the dynamic menu system
  * * and most importantly, calls initialize on the master subsystem, starting the game loop that causes the rest of the game to begin processing and setting up
  *
  * Note this happens after the Master subsystem is created (as that is a global datum), this means all the subsystems exist,
  * but they have not been Initialized at this point, only their New proc has run
  *
  * Nothing happens until something moves. ~Albert Einstein
  *
  */

/world/New()

	log_world("World loaded at [time_stamp()]!")

	SetupExternalRSC()

	GLOB.config_error_log = GLOB.world_manifest_log = GLOB.world_pda_log = GLOB.world_job_debug_log = GLOB.sql_error_log = GLOB.world_href_log = GLOB.world_runtime_log = GLOB.world_attack_log = GLOB.world_game_log = "data/logs/config_error.[GUID()].log" //temporary file used to record errors with loading config, moved to log directory once logging is set bl

	make_datum_references_lists()	//initialises global lists for referencing frequently used datums (so that we only ever do it once)

	TgsNew(minimum_required_security_level = TGS_SECURITY_TRUSTED)

	GLOB.revdata = new

	config.Load(params[OVERRIDE_CONFIG_DIRECTORY_PARAMETER])

	load_admins()

	//SetupLogs depends on the RoundID, so lets check
	//DB schema and set RoundID if we can
//	SSdbcore.CheckSchemaVersion()
	SSdbcore.SetRoundID()
	var/timestamp = replacetext(time_stamp(), ":", ".")

	if(!GLOB.round_id) // we do not have a db connected, back to pointless random numbers
		GLOB.rogue_round_id = "[pick(GLOB.roundid)][rand(0,9)][rand(0,9)][rand(0,9)]-[timestamp]"
	else // We got a db connected, GLOB.round_id ticks up based on where its at on the db.
		GLOB.rogue_round_id = "[pick(GLOB.roundid)][GLOB.round_id]-[timestamp]"
	SetupLogs()
	load_poll_data()

	if(CONFIG_GET(string/channel_announce_new_game_message))
		send2chat(new /datum/tgs_message_content(CONFIG_GET(string/channel_announce_new_game_message)), CONFIG_GET(string/chat_announce_new_game))

	TgsAnnounceServerStart()

#ifndef USE_CUSTOM_ERROR_HANDLER
	world.log = file("[GLOB.log_directory]/dd.log")
#else
	if (TgsAvailable())
		world.log = file("[GLOB.log_directory]/dd.log") //not all runtimes trigger world/Error, so this is the only way to ensure we can see all of them.
#endif

	LoadVerbs(/datum/verbs/menu)

	load_blacklist()

	load_nameban()

	load_psychokiller()

	load_crownlist()

	load_bypassage()

	load_patreons()

//	GLOB.timezoneOffset = text2num(time2text(0,"hh")) * 36000

	GLOB.timezoneOffset = world.timezone * 36000

	if(fexists(RESTART_COUNTER_PATH))
		GLOB.restart_counter = text2num(trim(file2text(RESTART_COUNTER_PATH)))
		fdel(RESTART_COUNTER_PATH)

	if(NO_INIT_PARAMETER in params)
		return

	Master.Initialize(10, FALSE, TRUE)

	if(TEST_RUN_PARAMETER in params)
		HandleTestRun()

	update_status()


/world/proc/HandleTestRun()
	//trigger things to run the whole process
	Master.sleep_offline_after_initializations = FALSE
	SSticker.start_immediately = TRUE
	CONFIG_SET(number/round_end_countdown, 0)
	var/datum/callback/cb
#ifdef UNIT_TESTS
	cb = CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(RunUnitTests))
#else
	cb = VARSET_CALLBACK(SSticker, force_ending, TRUE)
#endif
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(addtimer), cb, 10 SECONDS))

/world/proc/SetupExternalRSC()
#if (PRELOAD_RSC == 0)
	GLOB.external_rsc_urls = world.file2list("[global.config.directory]/external_rsc_urls.txt","\n")
	var/i=1
	while(i<=GLOB.external_rsc_urls.len)
		if(GLOB.external_rsc_urls[i])
			i++
		else
			GLOB.external_rsc_urls.Cut(i,i+1)
#endif

/world/proc/SetupLogs()
	var/override_dir = params[OVERRIDE_LOG_DIRECTORY_PARAMETER]
	if(!override_dir)
		var/realtime = world.realtime
		var/texttime = time2text(realtime, "YYYY/MM/DD")
		GLOB.log_directory = "data/logs/[texttime]/round-"
		GLOB.picture_logging_prefix = "L_[time2text(realtime, "YYYYMMDD")]_"
		GLOB.picture_log_directory = "data/picture_logs/[texttime]/round-"
		if(GLOB.rogue_round_id)
			var/timestamp = replacetext(time_stamp(), ":", ".")
			GLOB.log_directory += "[timestamp]-"
			GLOB.picture_log_directory += "[timestamp]-"
			GLOB.picture_logging_prefix += "T_[timestamp]_"
			GLOB.log_directory += "[GLOB.rogue_round_id]"
			GLOB.picture_logging_prefix += "R_[GLOB.rogue_round_id]_"
			GLOB.picture_log_directory += "[GLOB.rogue_round_id]"
		else
			var/timestamp = replacetext(time_stamp(), ":", ".")
			GLOB.log_directory += "[timestamp]"
			GLOB.picture_log_directory += "[timestamp]"
			GLOB.picture_logging_prefix += "T_[timestamp]_"
	else
		GLOB.log_directory = "data/logs/[override_dir]"
		GLOB.picture_logging_prefix = "O_[override_dir]_"
		GLOB.picture_log_directory = "data/picture_logs/[override_dir]"

	GLOB.world_game_log = "[GLOB.log_directory]/game.log"
	GLOB.world_mecha_log = "[GLOB.log_directory]/mecha.log"
	GLOB.world_virus_log = "[GLOB.log_directory]/virus.log"
	GLOB.world_cloning_log = "[GLOB.log_directory]/cloning.log"
	GLOB.world_asset_log = "[GLOB.log_directory]/asset.log"
	GLOB.world_attack_log = "[GLOB.log_directory]/attack.log"
	GLOB.world_pda_log = "[GLOB.log_directory]/pda.log"
	GLOB.world_telecomms_log = "[GLOB.log_directory]/telecomms.log"
	GLOB.world_manifest_log = "[GLOB.log_directory]/manifest.log"
	GLOB.world_href_log = "[GLOB.log_directory]/hrefs.log"
	GLOB.sql_error_log = "[GLOB.log_directory]/sql.log"
	GLOB.world_qdel_log = "[GLOB.log_directory]/qdel.log"
	GLOB.world_map_error_log = "[GLOB.log_directory]/map_errors.log"
	GLOB.character_list_log = "[GLOB.log_directory]/character_list.log"
	GLOB.world_runtime_log = "[GLOB.log_directory]/runtime.log"
	GLOB.query_debug_log = "[GLOB.log_directory]/query_debug.log"
	GLOB.world_job_debug_log = "[GLOB.log_directory]/job_debug.log"
	GLOB.world_paper_log = "[GLOB.log_directory]/paper.log"
	GLOB.tgui_log = "[GLOB.log_directory]/tgui.log"

	start_log(GLOB.world_game_log)
	start_log(GLOB.world_attack_log)
	start_log(GLOB.world_pda_log)
	start_log(GLOB.world_telecomms_log)
	start_log(GLOB.world_manifest_log)
	start_log(GLOB.world_href_log)
	start_log(GLOB.world_qdel_log)
	start_log(GLOB.world_runtime_log)
	start_log(GLOB.world_job_debug_log)
	start_log(GLOB.tgui_log)
	start_log(GLOB.character_list_log)

	GLOB.changelog_hash = md5('html/changelog.html') //for telling if the changelog has changed recently
	if(fexists(GLOB.config_error_log))
		fcopy(GLOB.config_error_log, "[GLOB.log_directory]/config_error.log")
		fdel(GLOB.config_error_log)

	if(GLOB.round_id)
		log_game("Round ID: [GLOB.round_id]")

	// This was printed early in startup to the world log and config_error.log,
	// but those are both private, so let's put the commit info in the runtime
	// log which is ultimately public.
	log_runtime(GLOB.revdata.get_log_message())

/world/Topic(T, addr, master, key)
	TGS_TOPIC //redirect to server tools if necessary

	var/static/list/topic_handlers = TopicHandlers()

	var/list/input = params2list(T)
	var/datum/world_topic/handler
	for(var/I in topic_handlers)
		if(I in input)
			handler = topic_handlers[I]
			break

	if((!handler || initial(handler.log)) && config && CONFIG_GET(flag/log_world_topic))
		log_topic("\"[T]\", from:[addr], master:[master], key:[key]")

	if(!handler)
		return

	handler = new handler()
	return handler.TryRun(input)


/world/proc/AnnouncePR(announcement, list/payload)
	var/static/list/PRcounts = list()	//PR id -> number of times announced this round
	var/id = "[payload["pull_request"]["id"]]"
	if(!PRcounts[id])
		PRcounts[id] = 1
	else
		++PRcounts[id]
		if(PRcounts[id] > PR_ANNOUNCEMENTS_PER_ROUND)
			return

	var/final_composed = span_announce("PR: [announcement]")
	for(var/client/C in GLOB.clients)
		C.AnnouncePR(final_composed)

/world/proc/FinishTestRun()
	set waitfor = FALSE
	var/list/fail_reasons
	if(GLOB)
		if(GLOB.total_runtimes != 0)
			fail_reasons = list("Total runtimes: [GLOB.total_runtimes]")
#ifdef UNIT_TESTS
		if(GLOB.failed_any_test)
			LAZYADD(fail_reasons, "Unit Tests failed!")
#endif
		if(!GLOB.log_directory)
			LAZYADD(fail_reasons, "Missing GLOB.log_directory!")
	else
		fail_reasons = list("Missing GLOB!")
	if(!fail_reasons)
		text2file("Success!", "[GLOB.log_directory]/clean_run.lk")
	else
		log_world("Test run failed!\n[fail_reasons.Join("\n")]")
	sleep(0)	//yes, 0, this'll let Reboot finish and prevent byond memes
	qdel(src)	//shut it down

/world/Reboot(reason = 0, fast_track = FALSE)
//	if (reason || fast_track) //special reboot, do none of the normal stuff
//		if (usr)
//			log_admin("[key_name(usr)] Has requested an immediate world restart via client side debugging tools")
//			message_admins("[key_name_admin(usr)] Has requested an immediate world restart via client side debugging tools")
//		to_chat(world, span_boldannounce("Rebooting World immediately due to host request."))
//	else
//	to_chat(world, span_boldannounce("<b><u><a href='byond://winset?command=.reconnect'>CLICK TO RECONNECT</a></u></b>"))

	var/round_end_sound = pick(
		'sound/roundend/knave.ogg',
		'sound/roundend/twohours.ogg',
		'sound/roundend/rest.ogg',
		'sound/roundend/gather.ogg',
		'sound/roundend/dwarfs.ogg',
	)
	for(var/client/thing in GLOB.clients)
		if(!thing)
			continue
		thing << sound(round_end_sound)

	to_chat(world, "Please be patient as the server restarts. You will be automatically reconnected in about 60 seconds.")
	Master.Shutdown()	//run SS shutdowns? rtchange

	TgsReboot()

	if(TEST_RUN_PARAMETER in params)
		FinishTestRun()
		return

	if(TgsAvailable())
		send2chat(new /datum/tgs_message_content("Round ending!"), CONFIG_GET(string/chat_announce_new_game))
		testing("tgsavailable passed")
		var/do_hard_reboot
		// check the hard reboot counter
		var/ruhr = CONFIG_GET(number/rounds_until_hard_restart)
		switch(ruhr)
			if(-1)
				do_hard_reboot = FALSE
			if(0)
				do_hard_reboot = TRUE
			else
				if(GLOB.restart_counter >= ruhr)
					do_hard_reboot = TRUE
				else
					text2file("[++GLOB.restart_counter]", RESTART_COUNTER_PATH)
					do_hard_reboot = FALSE

		if(do_hard_reboot)
			log_world("World hard rebooted at [time_stamp()]")
			shutdown_logging() // See comment below.
			TgsEndProcess()
	else
		testing("tgsavailable [TgsAvailable()]")

	log_world("World rebooted at [time_stamp()]")
	shutdown_logging() // Past this point, no logging procs can be used, at risk of data loss.
	..()

/world/proc/update_status()
	var/list/features = list()

	var/new_status = ""
	var/hostedby
	if(config)
		var/server_name = CONFIG_GET(string/servername)
		if (server_name)
			new_status += "<b>[server_name]</b> &#8212; "
		hostedby = CONFIG_GET(string/hostedby)

	new_status += " ("
	new_status += "<a href=\"[CONFIG_GET(string/discordurl)]\">"
	new_status += "Discord"
	new_status += ")\]"
	new_status += "<br>[CONFIG_GET(string/servertagline)]"

	var/players = GLOB.clients.len

	if(SSticker.current_state <= GAME_STATE_PREGAME)
		new_status += "<br>GAME STATUS: <b>IN LOBBY</b><br>"
	else
		new_status += "<br>GAME STATUS: <b>PLAYING</b><br>"

	if (SSticker.HasRoundStarted())
		new_status += "Round Time: <b>[time2text(STATION_TIME_PASSED(), "hh:mm", 0)]</b>"
	else
		new_status += "Round Time: <b>NEW ROUND STARTING</b>"
	new_status += "<br>Player[players == 1 ? "": "s"]: <b>[players]</b>"
	new_status += "</a>"

	if (!host && hostedby)
		features += "hosted by <b>[hostedby]</b>"

	status = new_status
/*
/world/proc/update_status()

	var/list/features = list()

	if(GLOB.master_mode)
		features += GLOB.master_mode

	if (!GLOB.enter_allowed)
		features += "closed"

	var/s = ""
	var/hostedby
	if(config)
		var/server_name = CONFIG_GET(string/servername)
		if (server_name)
			s += "<b>[server_name]</b> &#8212; "
		features += "[CONFIG_GET(flag/norespawn) ? "no " : ""]respawn"
		if(CONFIG_GET(flag/allow_vote_mode))
			features += "vote"
		if(CONFIG_GET(flag/allow_ai))
			features += "AI allowed"
		hostedby = CONFIG_GET(string/hostedby)

	s += "<b>[station_name()]</b>";
	s += " ("
	s += "<a href=\"http://\">" //Change this to wherever you want the hub to link to.
	s += "Default"  //Replace this with something else. Or ever better, delete it and uncomment the game version.
	s += "</a>"
	s += ")"

	var/players = GLOB.clients.len

	var/popcaptext = ""
	var/popcap = max(CONFIG_GET(number/extreme_popcap), CONFIG_GET(number/hard_popcap), CONFIG_GET(number/soft_popcap))
	if (popcap)
		popcaptext = "/[popcap]"

	if (players > 1)
		features += "[players][popcaptext] players"
	else if (players > 0)
		features += "[players][popcaptext] player"

	game_state = (CONFIG_GET(number/extreme_popcap) && players >= CONFIG_GET(number/extreme_popcap)) //tells the hub if we are full

	if (!host && hostedby)
		features += "hosted by <b>[hostedby]</b>"

	if (features)
		s += ": [jointext(features, ", ")]"

	status = s
*/
/world/proc/update_hub_visibility(new_visibility)
	if(new_visibility == GLOB.hub_visibility)
		return
	GLOB.hub_visibility = new_visibility
	if(GLOB.hub_visibility)
		hub_password = "kMZy3U5jJHSiBQjr"
	else
		hub_password = "SORRYNOPASSWORD"

/world/proc/incrementMaxZ()
	maxz++
	SSmobs.MaxZChanged()
	SSidlenpcpool.MaxZChanged()


/*
#ifdef TESTING
/client/verb/maxzcdec()
	set category = "DEBUGTEST"
	set name = "decr"
	set desc = ""
	world.decrementMaxZ()
	to_chat(src, "\n<font color='purple'>Maxz [world.maxz]</font>")
#endif

/world/proc/decrementMaxZ()
	maxz = 1
//	SSmobs.MaxZDec()
//	SSidlenpcpool.MaxZdec()
*/
/world/proc/change_fps(new_value = 20)
	if(new_value <= 0)
		CRASH("change_fps() called with [new_value] new_value.")
	if(fps == new_value)
		return //No change required.

	fps = new_value
	on_tickrate_change()


/world/proc/change_tick_lag(new_value = 0.5)
	if(new_value <= 0)
		CRASH("change_tick_lag() called with [new_value] new_value.")
	if(tick_lag == new_value)
		return //No change required.

	tick_lag = new_value
	on_tickrate_change()


/world/proc/on_tickrate_change()
	SStimer?.reset_buckets()

/world/proc/init_byond_tracy()
	var/tracy_init = call_ext(world.system_type == MS_WINDOWS ? "prof.dll" : "./libprof.so", "init")() // Setup Tracy integration
	if(length(tracy_init) != 0 && tracy_init[1] == ".") // it returned the output file
		log_world("TRACY Enabled, streaming to [tracy_init].")
	else if(tracy_init != "0")
		CRASH("Tracy init error: [tracy_init]")

/world/proc/init_debugger()
	var/dll = GetConfig("env", "AUXTOOLS_DEBUG_DLL")
	if (dll)
		call_ext(dll, "auxtools_init")()
		enable_debugging()

/world/Del()
	var/dll = GetConfig("env", "AUXTOOLS_DEBUG_DLL")
	if (dll)
		call_ext(dll, "auxtools_shutdown")()

	. = ..()

/world/proc/TgsAnnounceServerStart()
	if(!TgsAvailable())
		return

	var/announce_channel = CONFIG_GET(string/chat_announce_new_game)

	if(!announce_channel)
		return

	var/datum/tgs_chat_embed/structure/embed = new()
	embed.title = "Сервер запущен!"
	embed.description = "История вот-вот начнется..."
	embed.colour = "#B9B28A"

	var/ping_role_id = CONFIG_GET(string/game_alert_role_id)
	var/datum/tgs_message_content/message = new(ping_role_id ? "<@&[ping_role_id]>": "")
	message.embed = embed

	send2chat(
		message,
		announce_channel
	)

/world/proc/TgsAnnounceRoundStart()
	if(!TgsAvailable())
		return

	var/announce_channel = CONFIG_GET(string/chat_announce_new_game)

	if(!announce_channel)
		return

	var/datum/tgs_chat_embed/structure/embed = new()
	embed.title = "История началась!"
	embed.description = GLOB.rogue_round_id
	embed.colour = "#79ac78"

	var/datum/tgs_message_content/message = new("")
	message.embed = embed

	send2chat(
		message,
		announce_channel
	)

/world/proc/TgsAnnounceVoteEndRound()
	if(!TgsAvailable())
		return

	var/announce_channel = CONFIG_GET(string/chat_announce_new_game)

	if(!announce_channel)
		return

	var/datum/tgs_chat_embed/structure/embed = new()
	embed.title = "Приближается конец истории!"
	embed.description = "Игроки проголосовали за конец раунда. До конца: [ROUND_END_TIME_VERBAL]"
	embed.colour = "#ac87c5"
	embed.footer = new(GLOB.rogue_round_id)

	var/datum/tgs_message_content/message = new("")
	message.embed = embed

	send2chat(
		message,
		announce_channel
	)

/world/proc/TgsAnnounceRoundEnd()
	if(!TgsAvailable())
		return

	var/announce_channel = CONFIG_GET(string/chat_announce_new_game)

	if(!announce_channel)
		return

	var/round_duration_timestamp = gameTimestamp("hh:mm:ss", world.time - SSticker.round_start_time)

	var/datum/tgs_chat_embed/structure/embed = new()
	embed.title = "Конец!"
	embed.description = "История длилась [round_duration_timestamp]."
	embed.colour = "#9f5255"
	embed.footer = new(GLOB.rogue_round_id)

	var/datum/tgs_message_content/message = new("")
	message.embed = embed

	send2chat(
		message,
		announce_channel
	)
