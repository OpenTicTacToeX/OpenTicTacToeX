extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _savesize():
	var data = $text.get_data("size")
	data["sizex"] = Glovar.size.x
	data["sizey"] = Glovar.size.y
	data["fullscreen"] = OS.window_fullscreen
	$text.save_data("size")
func _loadsize():
	var data = $text.get_data("size")
	if data.empty():
		_savesize()
	else:
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
		$text.save_data("size")

func _savedeco():
	var data = $text.get_data("deco")
	data["back"] = Glovar.back
	data["board"] = Glovar.board
	$text.save_data("deco")
	
func _loaddeco():
	var data = $text.get_data("deco")
	if data.empty():
		_savesize()
	else:
		if data.has("back") == false:
			data["back"] = 1
		elif data.has("board") == false:
			data["board"] = 1
		Glovar.back = data["back"]
		Glovar.board = data["board"]
		$text.save_data("deco")
	
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
	data["volume_music"] = Glovar.Volume_Music
	data["volume_fx"] = Glovar.Volume_FX
	
	$text.save_data("settings")
func _loadsettings():
	var data = $text.get_data("settings")
	if data.empty():
		_savesettings()
	else:
		
		if data.has("volume_music") == false:
			data["volume_music"] = true
		if data.has("volume_fx") == false:
			data["volume_fx"] = true
		Glovar.Volume_FX = data["volume_fx"]
		Glovar.Volume_Music = data["volume_music"]
	$text.save_data("settings")

func _save():
	_savesize()
	_savedeco()
	_savescore()
	_savesettings()
func _load():
	_loadsize()
	_loaddeco()
	_loadscore()
	_loadsettings()
	

func _delete():
	$text.remove_profile("deco")
	$text.remove_profile("size")
	$text.remove_profile("settings")
	$encrypted.remove_profile("score")
	get_tree().quit()
