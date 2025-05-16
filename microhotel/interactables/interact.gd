extends StaticBody3D

func _process(delta):
	var player_position = $"../Player".position
	if (player_position.x < position.x + 20 && player_position.x > position.x - 20) && (player_position.z < position.z + 15 && player_position.z > position.z - 15):
		if Input.is_action_pressed("interact"):
			print("Interacted with: " + str(name))
