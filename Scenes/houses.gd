extends Area2D
@onready var blue_car = $blue_car
@onready var coin = $Coin
@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("coin")
	
func _process(_delta):
	if blue_car.can_collect:
		coin.visible = true
	else: 
		coin.visible = false
