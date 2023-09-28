extends Node

var points = 0
var health = 3
var Score = 0
var HP = 0
func _ready():
	Score = $Score
	HP = $Life


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_point(score: int):
	points += score
	Score.text = "Score" + str(points)

func player_hp(hp: int):
	health -= hp
	HP.text = "Health: " + str(health)
	
	
	
