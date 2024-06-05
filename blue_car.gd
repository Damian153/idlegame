extends Area2D

@onready var path_follow_2d = $Path2D/PathFollow2D
@export var speed = 230
@onready var animated_sprite_2d = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var texture_button = $"../TextureButton"
@onready var progressbar = $progressbar
@export var can_collect = false
var start_pos
var collecting_pos :Vector2 = Vector2.ZERO
var x
var y
var can_move : int = 0
var button_pressed
var coin_amount = 1
func _ready():
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	start_pos = path_follow_2d.progress
	can_move = 1
	progressbar.visible = false

func _process(delta):
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	
	path_follow_2d.progress += speed * delta * can_move
	
	if path_follow_2d.progress_ratio == 1:
		path_follow_2d.progress_ratio = 0
		can_move = 0
	
	if path_follow_2d.progress == start_pos:
		can_move = 0
		can_collect = true
	
	if can_collect == true and button_pressed:
		Global.coins += coin_amount
		button_pressed = false
		can_move = 1
		can_collect = false
		
	if float (path_follow_2d.progress_ratio) > 0.516 and collecting_pos == Vector2.ZERO:
		collecting_pos = path_follow_2d.position
	
	if path_follow_2d.position == collecting_pos:
		can_move = 0
		progressbar.visible = true
		progressbar.value +=  delta * 30
		if progressbar.value == 100:
			can_move = 1
			progressbar.visible = false
			progressbar.value = 0
		
	
	
	if path_follow_2d.position.x - x:
		animated_sprite_2d.animation = "left"
	
	elif path_follow_2d.position.x > y:
		animated_sprite_2d.animation = "up"
	else:
		animated_sprite_2d.animation = "down"
	
	


func _on_texture_button_pressed():
	button_pressed = true

