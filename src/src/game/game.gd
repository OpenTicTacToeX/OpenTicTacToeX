extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a = 0
var b = 0
var button = [["","",""],["","",""],["","",""]]



# Called when the node enters the scene tree for the first time.
func _ready():
	Glovar.win = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	button[0][0] = $board/d/aa.state
	button[0][1] = $board/d/ab.state
	button[0][2] = $board/d/ac.state
	button[1][0] = $board/d/ba.state
	button[1][1] = $board/d/bb.state
	button[1][2] = $board/d/bc.state
	button[2][0] = $board/d/ca.state
	button[2][1] = $board/d/cb.state
	button[2][2] = $board/d/cc.state
	if Glovar.turn == "X":
		$menu/turn.animation = "x"
		$menu/aturn.animation = "x"
	elif Glovar.turn == "O":
		$menu/turn.animation = "o"
		$menu/aturn.animation = "o"
		
	for a in range(3): #I know that this is bad #don't see!
		for b in range(3):
			if (b == 0 and a == 0):
				if button[a][b] == "X" and button[a][b+1] == "X" and button[a][b+2] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a-1][b-1] == "X" and button[a-2][b-2] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a+1][b] == "X" and button[a+2][b] == "X":
					Glovar.win = "X"
				if button[a][b] == "O" and button[a][b+1] == "O" and button[a][b+2] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a-1][b-1] == "O" and button[a-2][b-2] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a+1][b] == "O" and button[a+2][b] == "O":
					Glovar.win = "O"
			elif b == 1 and a == 1:
				if button[a][b] == "X" and button[a][b+1] == "X" and button[a][b-1] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a+1][b] == "X" and button[a-1][b] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a+1][b-1] == "X" and button[a-1][b+1] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a+1][b+1] == "X" and button[a-1][b-1] == "X":
					Glovar.win = "X"
				if button[a][b] == "O" and button[a][b+1] == "O" and button[a][b-1] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a+1][b] == "O" and button[a-1][b] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a+1][b+1] == "O" and button[a-1][b-1] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a+1][b-1] == "O" and button[a-1][b+1] == "O":
					Glovar.win = "O"
			elif (b == 2 and a == 2):
				if button[a][b] == "X" and button[a][b-1] == "X" and button[a][b-2] == "X":
					Glovar.win = "X"
				elif button[a][b] == "X" and button[a-1][b] == "X" and button[a-2][b] == "X":
					Glovar.win = "X"
				if button[a][b] == "O" and button[a][b-1] == "O" and button[a][b-2] == "O":
					Glovar.win = "O"
				elif button[a][b] == "O" and button[a-1][b] == "O" and button[a-2][b] == "O":
					Glovar.win = "O"
	
	if Glovar.win == "X":
		pass
	elif Glovar.win == "O":
		pass
	
	if Glovar.replay == true:
		Glovar.win = ""
		
	
	if $board/d/aa.state != "" and $board/d/ab.state != "" and $board/d/ac.state != "" :
		pass
	


func _on_replay_pressed():
	Glovar.restart = true
	$end_screen/anim.current_animation = "start"
	#$end_screen._on_replay_pressed()


func _on_menu_pressed():
	if get_tree().paused == false:
		$pause/view.show()
		get_tree().paused = true
	elif get_tree().paused == true:
		$pause/view.hide()
		get_tree().paused = false
		


func _on_view_pressed():
	$end_screen/timetoview.start()
	$end_screen.hide()
	get_tree().paused = true


func _on_timetoview_timeout():
	get_tree().paused = false
	$end_screen.show()