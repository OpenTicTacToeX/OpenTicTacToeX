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
	var data = $size.get_data("size")
	data["sizex"] = Glovar.size.x
	data["sizey"] = Glovar.size.y
	data["fullscreen"] = OS.window_fullscreen
	$size.save_data("size")
func _loadsize():
	var data = $size.get_data("size")
	if data.empty():
		_savesize()
	else:
		if data.has("sizex") == false:
			data["sizex"] = 850
			data["sizey"] = 480
			$size.save_data("size")
		Glovar.size.x = data["sizex"]
		Glovar.size.y = int(data["sizex"] / 16 * 9)
		OS.window_fullscreen = data["fullscreen"]
		OS.set_window_size(Glovar.size)

func _savedeco():
	var data = $deco.get_data("deco")
	data["back"] = Glovar.back
	data["board"] = Glovar.board
	$deco.save_data("deco")
	
func _loaddeco():
	var data = $deco.get_data("deco")
	if data.empty():
		_savesize()
	else:
		if data.has("back") == false:
			data["back"] = 1
		elif data.has("board") == false:
			data["board"] = 1
		Glovar.back = data["back"]
		Glovar.board = data["board"]
	
func _savescore():
	var data = $score.get_data("score")
	data["score"] = Glovar.score
	$score.save_data("score")

func _loadscore():
	var data = $score.get_data("score")
	if data.empty():
		_savescore()
	else:
		
		#al no tener "algo", se guarda ese "algo", con
		#un dato que tenga sentido
		if data.has("score") == false:
			data["score"] = 0
		
		Glovar.score = data["score"]

func _save():
	_savesize()
	_savedeco()
	_savescore()
func _load():
	_loadsize()
	_loaddeco()
	_loadscore()
	

