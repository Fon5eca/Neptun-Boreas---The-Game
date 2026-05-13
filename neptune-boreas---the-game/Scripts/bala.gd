extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed: int = 650
	
func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		var hit = get_slide_collision(0).get_collider()
		if hit.is_in_group("asteroids"):
			hit.destroy()
		queue_free()
