extends Node2D

var SpawnPoint = null
@export var enemy = PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	SpawnPoint = $Spawn
	enemy = preload("res://enemy.tscn")


func get_spawn():
	var point = SpawnPoint.get_children()
	point.shuffle()
	return point[0].global_position
	
func spawn_enemy():
	var spawn = get_spawn()
	var enemies = enemy.instantiate()
	var main = get_tree().current_scene
	main.add_child(enemies)
	enemies.global_position = spawn


func _on_timer_timeout():
	spawn_enemy()
