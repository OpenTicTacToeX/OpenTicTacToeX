extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Glovar.board == 1:
		animation = "1"
	elif Glovar.board == 2:
		animation = "2"
	elif Glovar.board == 3:
		animation = "3"
	elif Glovar.board == 4:
		animation = "4"
	else:
		Glovar.board = 1
