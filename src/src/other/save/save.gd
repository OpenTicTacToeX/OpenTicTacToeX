extends Node2D


func _savescore():
	var data = $encrypted.get_data("score")
	data["score"] = Glovar.score
	$encrypted.save_data("score")

func _loadscore():
	var data = $encrypted.get_data("score")
	if data.empty():
		_savescore()
	else:
		
		#al no tener "algo", se guarda ese "algo", con
		#un dato que tenga sentido
		if data.has("score") == false:
			data["score"] = 0
		
		Glovar.score = data["score"]
		$encrypted.save_data("score")

func _savesettings():
	var data = $text.get_data("settings")
	
	#size
	data["sizex"] = Glovar.size.x
	data["sizey"] = Glovar.size.y
	data["fullscreen"] = OS.window_fullscreen
	
	#deco
	data["back"] = Glovar.back
	data["board"] = Glovar.board
	
	#music
	data["volume_music"] = Glovar.Volume_Music
	data["volume_fx"] = Glovar.Volume_FX
	
	$text.save_data("settings")
func _loadsettings():
	var data = $text.get_data("settings")
	if data.empty():
		_savesettings()
	else:
		
		#size
		if data.has("sizex") == false:
			data["sizex"] = 850
			data["sizey"] = 480
		elif data["sizex"] == 0:
			data["sizex"] = 850
			data["sizey"] = 480
		Glovar.size.x = data["sizex"]
		Glovar.size.y = int(data["sizex"] / 16 * 9)
		OS.window_fullscreen = data["fullscreen"]
		OS.set_window_size(Glovar.size)
		
		#deco
		if data.has("back") == false:
			data["back"] = 1
		if data.has("board") == false:
			data["board"] = 1
		Glovar.back = data["back"]
		Glovar.board = data["board"]
		
		#music
		if data.has("volume_music") == false:
			data["volume_music"] = true
		if data.has("volume_fx") == false:
			data["volume_fx"] = true
		Glovar.Volume_FX = data["volume_fx"]
		Glovar.Volume_Music = data["volume_music"]
	$text.save_data("settings")
	
func _save():
	_savescore()
	_savesettings()
func _load():
	_loadscore()
	_loadsettings()
	

func _delete():
	$text.remove_profile("settings")
	$encrypted.remove_profile("score")
	get_tree().quit()
