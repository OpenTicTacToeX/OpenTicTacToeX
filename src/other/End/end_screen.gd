extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var first = false
var f = false


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -48


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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


func _on_exit_pressed():
	get_tree().quit()


func _on_menu_pressed():
	get_tree().change_scene("res://src/other/menu/menu.tscn")
