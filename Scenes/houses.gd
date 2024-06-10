extends Area2D
@onready var blue_car = $blue_car
@onready var coin = $Coin
@onready var animation_player = $AnimationPlayer
@onready var start = $"../start"

func _ready():
	animation_player.play("coin")


func _on_start_pressed():
	blue_car.can_move = 1
	start.queue_free()

