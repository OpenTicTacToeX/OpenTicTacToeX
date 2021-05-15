extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$view.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		#
		$save._save()
		#
		get_tree().quit()


func _on_exit_pressed():
	$save._save()
	get_tree().paused = false
	Glovar.end_screen = true


func _on_volume_pressed():
	if Glovar.Volume_Music == true:
		Glovar.Volume_Music = false
	else:
		Glovar.Volume_Music = true
