extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed: int = 555
	
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		queue_free()
