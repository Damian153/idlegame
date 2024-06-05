extends Area2D

@onready var path_follow_2d = $Path2D/PathFollow2D
@export var speed = 300
@onready var animated_sprite_2d = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var texture_button = $"../TextureButton"
var direction = 1
var old_pos
var pos
var moving = false
var collected = false
func _ready():
	old_pos = global_position
	pos = global_position

func _process(delta):
	path_follow_2d.progress += speed * delta * direction
	
	if path_follow_2d.progress_ratio == 1:
		direction = -1
	elif path_follow_2d.progress_ratio == 0 and collected:
		direction = 1
		collected = false
	
	pos = global_position
	if pos - old_pos:
		moving = true
		print (pos - old_pos)
	else:
		moving = false
	old_pos = pos
	
	
	


func _on_texture_button_pressed():
	collected = true
