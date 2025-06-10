extends Node2D

signal lazer_from_level
signal grenade_from_level

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_grenade_from_level() -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = $'Player/Projectiles'.get_child(1).global_position
	grenade.linear_velocity = \
		(get_global_mouse_position() - $Player.position).normalized() * grenade.speed
	$Projectiles.add_child(grenade)
	print("grenade from level")
	


func _on_lazer_from_level() -> void:
	var laser = laser_scene.instantiate() as Area2D
	var laser_positions = $'Player/Projectiles'.get_children()
	laser.position = laser_positions[randi() % laser_positions.size()].global_position
	laser.direction = (get_global_mouse_position() - $Player.position).normalized()
	laser.rotation_degrees = rad_to_deg(laser.direction.angle()) + 90
	$Projectiles.add_child(laser)
	print("lazer from level")
