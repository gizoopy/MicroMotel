extends CanvasLayer

@export var player: CharacterBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MoneyDisplay.text = player.player_money.money_string()
