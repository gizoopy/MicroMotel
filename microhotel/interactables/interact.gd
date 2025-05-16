extends StaticBody3D



func _process(delta):
	var player = $"../Player"
	
	var player_position = player.position
	
	if (player_position.x < position.x + 20 && player_position.x > position.x - 20) && (player_position.z < position.z + 15 && player_position.z > position.z - 15):
		if Input.is_action_just_pressed("interact"):
			player.player_money.money_add(500)
			print("Interacted with: " + str(name))
