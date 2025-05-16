extends Marker3D

@export var camera_offset = Vector3(0,0,0)

func _physics_process(delta):
	position.x = $"../Player".position.x + camera_offset.x
	position.y = $"../Player".position.y + camera_offset.y
	position.z = $"../Player".position.z + camera_offset.z
