extends CharacterBody2D


# Called when the   	node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var can_shoot : bool = true
var can_grenade : bool = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_shoot:
		print("shoot laser")
		can_shoot = false
		$Timer_shoot.start()
		$"..".lazer_from_level.emit()
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("shoot gl")	
		can_grenade = false
		$Timer_grenade.start()
		$"..".grenade_from_level.emit()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered")


func _on_timer_grenade_timeout() -> void:
	can_grenade = true


func _on_timer_shoot_timeout() -> void:
	can_shoot = true


func _on_level_lazer_from_level() -> void:
	print("lazer_from level")
