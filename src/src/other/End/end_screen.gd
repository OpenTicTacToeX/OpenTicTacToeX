extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var first = false
var f = false
var temptorestart = false
var temptorestart2 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -48


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if temptorestart == true and temptorestart2 == true:
		temptorestart = false
		temptorestart2 = false
		_on_replay_pressed()
		
	if Input.is_action_just_pressed("R"):
		first = false
		f = false
		Glovar.win == ""
		$anim.current_animation = "end"
	if Glovar.win != "" and first == false:
		$anim.current_animation = "start"
		first = true
		f = true
		


func _on_replay_pressed():
	if Glovar.buttonw == true:
		Glovar.replay = true
		first = false
		f = false
		Glovar.win == ""
		$anim.current_animation = "end"


func _on_anim_animation_finished(anim_name):
	if anim_name == "end":
		Glovar.replay = false
	if anim_name == "start" and Glovar.restart == true:
		_on_replay_pressed()
		Glovar.restart = false
		temptorestart = true
	Glovar.buttonw = true
	temptorestart2 = true


func _on_exit_pressed():
	if Glovar.buttonw == true:
		$save._save()
		get_tree().quit()


func _on_menu_pressed():
	if Glovar.buttonw == true:
		Glovar.end_screen = true
		$save._save()


func _on_anim_animation_started(anim_name):
	Glovar.buttonw = false
