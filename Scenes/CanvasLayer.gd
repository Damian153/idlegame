extends CanvasLayer

@onready var coins_text = $coins_text

func _process(delta):
	coins_text.text = str(Global.coins)
