extends Area2D

var speed = randf_range(20, 50)
var armor = 3
@export var explosion = PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	add_to_group("enemy")
	explosion = preload("res://explosion.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta



func _on_body_entered(body):
	armor -= 1
	body.queue_free()
	if armor == 0:
		queue_free()
		var main = get_node("/root/World")
		main.increase_point(10)
		
		var explode = explosion.instantiate()
		var explosions = get_tree().current_scene
		explosions.add_child(explode)
		explode.global_position = global_position
