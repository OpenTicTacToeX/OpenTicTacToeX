extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_exit_pressed():
	$save._save()
	get_tree().change_scene("res://src/other/menu/menu.tscn")


func _on_back1_pressed():
	Glovar.back = 1
func _on_back2_pressed():
	Glovar.back = 2
func _on_back3_pressed():
	Glovar.back = 3
func _on_back4_pressed():
	Glovar.back = 4
