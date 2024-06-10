extends CanvasLayer

@onready var coins_text = $PanelContainer/HBoxContainer/coins_text
@onready var houses = $"../houses"

func _process(delta):
	coins_text.text = str(Global.coins)

func _on_upgrade_income_pressed():
	if Global.coins >= 4:
		houses.blue_car.coin_amount += 1
		Global.coins -= 4
