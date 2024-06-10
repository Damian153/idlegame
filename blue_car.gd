extends Area2D

@onready var path_follow_2d = $Path2D/PathFollow2D
@export var speed = 500
@onready var animated_sprite_2d = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var texture_button = $"../TextureButton"
@onready var progressbar = $Path2D/PathFollow2D/AnimatedSprite2D/progressbar
@export var can_collect = false
@onready var coin = $"../Coin"
@export var coin_amount = 1
var start_pos
var collecting_pos :Vector2 = Vector2.ZERO
var x
var y
var can_move : int = 0
var button_pressed = false
func _ready():
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	start_pos = path_follow_2d.position
	#progressbar.visible = false

func _process(delta):
	x = path_follow_2d.position.x
	y = path_follow_2d.position.y
	
	
	path_follow_2d.progress += speed * delta * can_move
	
	if float (path_follow_2d.progress_ratio) >= 0.516 and !can_collect:
		can_move = 0
		progressbar.visible = true
		progressbar.value +=  delta * 100
		if progressbar.value == 100:
			can_move = 1
			progressbar.visible = false
			progressbar.value = 0
			can_collect = true
	
	if path_follow_2d.progress_ratio == 1:
		can_move = 0
		path_follow_2d.progress_ratio = 0
		coin.visible = true
	
	if can_collect and button_pressed and path_follow_2d.progress_ratio == 0 :
		Global.coins += coin_amount
		can_move = 1
		can_collect = false
		coin.visible = false
	
	
	if path_follow_2d.position.x - x:
		animated_sprite_2d.animation = "left"
	
	elif path_follow_2d.position.x > y:
		animated_sprite_2d.animation = "up"
	else:
		animated_sprite_2d.animation = "down"
	
	

func _on_texture_button_button_down():
	button_pressed = true


func _on_texture_button_button_up():
	button_pressed = false
