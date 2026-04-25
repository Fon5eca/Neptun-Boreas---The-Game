extends CharacterBody2D

var speed: int = 250
var rotate_speed: int = 5
var bala = preload("res://Scenes/Bala.tscn")

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

	if Input.is_action_just_pressed("Disparar"):
		shoot()
		
func shoot():
	var nBala = bala.instantiate()
	nBala.direction = -transform.y
	nBala.rotation = rotation
	nBala.global_position = $Bala_SP.global_position
	get_parent().add_child(nBala)
	$AudioStreamPlayer2D.play()
