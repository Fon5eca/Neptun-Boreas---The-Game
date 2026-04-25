extends Sprite2D

@export var speed=0
@export var dir=0:
	set(value):
		dir=clamp(value, 0, 360)

var posx = 0
var posy = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position=Vector2(posx, posy)
	posx+=cos(deg_to_rad(dir))*speed*delta
	posy+=sin(deg_to_rad(dir))*speed*delta
	
