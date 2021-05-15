extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var turn = "X"
var win = ""
var replay = false
var restart= false
var size = Vector2()
var savesize = Vector2()
var back = 1
var board = 1
var score = 0
var buttonw = true
var end_screen = false

var time_song_damdum = 0 


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	size = OS.get_window_size()
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	elif Input.is_action_just_pressed("reset_SIZE"):
		OS.set_window_size(Vector2(850,480))
		OS.window_fullscreen = false
