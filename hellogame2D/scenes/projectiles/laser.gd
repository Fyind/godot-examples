extends Area2D

@export var speed : int = 1000
var direction = Vector2.UP
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position + speed * direction * delta
