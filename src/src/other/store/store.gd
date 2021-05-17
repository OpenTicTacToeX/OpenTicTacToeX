extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PRICEback2 = 20
const PRICEback3 = 50
const PRICEback4 = 100
const PRICEboard2 = 150
const PRICEboard3 = 300
const PRICEboard4 = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	Glovar.time_song_damdum = 0
	$back_images/back2/price.text = str(PRICEback2)
	$back_images/back3/price.text = str(PRICEback3)
	$back_images/back4/price.text = str(PRICEback4)
	$board_images/board2/price.text = str(PRICEboard2)
	$board_images/board3/price.text = str(PRICEboard3)
	$board_images/board4/price.text = str(PRICEboard4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	if Glovar.score >= PRICEback2:
		$back_images/back2/price.hide()
	if Glovar.score >= PRICEback3:
		$back_images/back3/price.hide()
	if Glovar.score >= PRICEback4:
		$back_images/back4/price.hide()
	if Glovar.score >= PRICEboard2:
		$board_images/board2/price.hide()
	if Glovar.score >= PRICEboard3:
		$board_images/board3/price.hide()
	if Glovar.score >= PRICEboard4:
		$board_images/board4/price.hide()
	
	$score.text = str(Glovar.score)

func _on_exit_pressed():
	$save._save()
	get_tree().change_scene("res://src/other/menu/menu.tscn")

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		#
		$save._save()
		#
		get_tree().quit()


func _on_back1_pressed():
	Glovar.back = 1
func _on_back2_pressed():
	if Glovar.score >= PRICEback2:
		Glovar.back = 2
func _on_back3_pressed():
	if Glovar.score >= PRICEback3:
		Glovar.back = 3
func _on_back4_pressed():
	if Glovar.score >= PRICEback4:
		Glovar.back = 4


func _on_board1_pressed():
	Glovar.board = 1
func _on_board2_pressed():
	if Glovar.score >= PRICEboard2:
		Glovar.board = 2
func _on_board3_pressed():
	if Glovar.score >= PRICEboard3:
		Glovar.board = 3
func _on_board4_pressed():
	if Glovar.score >= PRICEboard4:
		Glovar.board = 4
