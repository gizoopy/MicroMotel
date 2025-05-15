class_name PlayerRespawn
extends Resource

func update(delta, player: CharacterBody3D):
	if player.position.y < player.respawn_height:
		player.position = player.spawn_point
