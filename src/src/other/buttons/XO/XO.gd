extends TouchScreenButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = ""
var tempstate = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Glovar.replay == true:
		state = ""
	if state == "":
		$O.hide()
		$X.hide()
	if state == "X":
		$O.hide()
		$X.show()
	if state == "O":
		$X.hide()
		$O.show()


func _on_XO_pressed():
	tempstate = state
	if state == "" and Glovar.turn == "X":
		state = "X"
	if state == "" and Glovar.turn == "O":
		state = "O"
	if Glovar.turn == "X" and tempstate == "":
		Glovar.turn = "O"
	elif Glovar.turn == "O" and tempstate == "":
		Glovar.turn = "X"
