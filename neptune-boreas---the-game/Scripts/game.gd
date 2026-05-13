extends Node2D

@export var asteroid_scene: PackedScene

@export var ship: CharacterBody2D

@onready var spawn_timer = $SpawnTimer  # Timer node en la escena

# Agrupá tus markers en un array
@onready var spawn_points: Array[Marker2D] = [
	$SpawnPoints/SpawnPoint1,$SpawnPoints/SpawnPoint2,$SpawnPoints/SpawnPoint3,$SpawnPoints/SpawnPoint4
]

const INITIAL_INTERVAL := 3.0
const MIN_INTERVAL     := 0.4
const INTERVAL_STEP    := 0.1  # cuánto se reduce por cada spawn

func _ready() -> void:
	
	
	spawn_timer.wait_time = INITIAL_INTERVAL
	spawn_timer.one_shot = true  # lo reiniciamos manualmente para poder ajustar el intervalo
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
	_spawn_asteroid()

	# Reducir el intervalo para el próximo spawn
	var next_interval = max(MIN_INTERVAL, spawn_timer.wait_time - INTERVAL_STEP)
	spawn_timer.wait_time = next_interval
	spawn_timer.start()

func _spawn_asteroid() -> void:
	if asteroid_scene == null:
		push_error("asteroid_scene no está asignada en el inspector.")
		return

	var asteroid = asteroid_scene.instantiate()

	# Elegir posición al azar entre los 4 markers
	var marker: Marker2D = spawn_points[randi() % spawn_points.size()]
	asteroid.global_position = marker.global_position

	add_child(asteroid)

	# Pasarle la posición actual de la nave (no la sigue, solo apunta ahí)
	asteroid.init(ship.global_position)
