extends Marker3D

@export var camera_offset = Vector3(0,0,0)

func _physics_process(delta):
	var player = $"../Player"
	
	position.x = player.position.x + camera_offset.x
	position.y = player.position.y + camera_offset.y
	position.z = player.position.z + camera_offset.z
