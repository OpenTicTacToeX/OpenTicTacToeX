extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Glovar.back == 1:
		animation = "back1"
	elif Glovar.back == 2:
		animation = "back2"
	elif Glovar.back == 3:
		animation = "back3"
	elif Glovar.back == 4:
		animation = "back4"
	else:
		Glovar.back = 1
