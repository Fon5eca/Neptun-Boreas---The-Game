extends CharacterBody2D

var speed := 160.0
var rotation_speed := 2.5


func _ready() -> void:
	add_to_group("asteroids")

func init(target_pos: Vector2) -> void:
	var direction = (target_pos - global_position).normalized()
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	rotation += rotation_speed * delta
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collider = get_slide_collision(i).get_collider()
		if collider.is_in_group("player"):
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menu.tscn")
			return
		if collider.is_in_group("bounds"):
			queue_free()

func destroy() -> void:
	queue_free()
