extends Area2D

var speed = 150
var health = 3
@export var bullet_scene = PackedScene
func _ready():
	bullet_scene = preload("res://bullet.tscn")
	add_to_group("player")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()
	
	position = position.clamp(Vector2.ZERO, get_viewport().size)

func _on_area_entered(area):
	area.queue_free()
	health -= 1
	var main = get_node("/root/World")
	main.player_hp(1)
	if health == 0:
		queue_free()
		get_tree().change_scene_to_file("res://game_over.tscn")

func fire_bullet():
	var bullet = bullet_scene.instantiate()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position

func add_health(hp_points: int):
	health += hp_points
	print("Health: " + str(health))
	if health > 3:
		health = 3
