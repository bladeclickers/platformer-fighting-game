extends Camera2D

@export var p1: CharacterBody2D
@export var p2: CharacterBody2D

@export var min_zoom = 0.1
@export var max_zoom = 1000
@export var zoom_margin = 200.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	global_position.x = (p1.global_position.x + p2.global_position.x) / 2 + 90

	var dist = p1.global_position.distance_to(p2.global_position)

	var zoom_factor = clamp(1000.0 / (dist + zoom_margin), min_zoom, max_zoom)
	var target_zoom = Vector2(zoom_factor, zoom_factor)
	zoom = zoom.lerp(target_zoom, 5.0 * delta)
