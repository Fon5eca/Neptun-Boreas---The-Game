extends CharacterBody2D

var speed: int = 250
var rotate_speed: int = 5

func _ready() -> void:
	position = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		rotate(-rotate_speed*delta)
	if Input.is_action_pressed("Right"):
		rotate(rotate_speed*delta)
	
	if Input.is_action_pressed("Up"):
		velocity = -transform.y*speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
