extends Area2D

@onready var path_follow_2d = $Path2D/PathFollow2D
@export var speed = 230
@onready var animated_sprite_2d = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var texture_button = $"../TextureButton"
var direction = 1
var start_pos
var x
var y
var collected = false
var can_move : int = 0
func _ready():
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	start_pos = path_follow_2d.progress
	can_move = 1

func _process(delta):
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	
	path_follow_2d.progress += speed * delta * can_move
	
	if path_follow_2d.progress_ratio == 1:
		path_follow_2d.progress_ratio = 0
		can_move = 0
	if path_follow_2d.progress == start_pos and can_move:
		can_move = 1
	
	print (path_follow_2d.progress_ratio)
	
	if path_follow_2d.position.x - x:
		animated_sprite_2d.animation = "left"
	
	elif path_follow_2d.position.x > y:
		animated_sprite_2d.animation = "up"
	else:
		animated_sprite_2d.animation = "down"
	
	
	
	


func _on_texture_button_pressed():
	can_move = 1
