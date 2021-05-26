extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$save._load()
	$music/Timer.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	$music._save_song_time_damdum()
	get_tree().change_scene("res://src/game/game.tscn")


func _on_exit_pressed():
	$save._save()
	get_tree().quit()
	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		#
		$save._save()
		#
		get_tree().quit()



func _on_store_pressed():
	$save._save()
	get_tree().change_scene("res://src/other/store/store.tscn")


func _on_delete_all_pressed():
	get_tree().change_scene("res://src/other/delete/delete.tscn")


func _on_Timer_timeout():
	$music/Timer.stop()
	if Glovar.Volume_Music == true:
		$music/music/damdum.play(Glovar.time_song_damdum)
