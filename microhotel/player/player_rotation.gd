class_name PlayerRotation
extends Resource

func update(delta, player: CharacterBody3D):
	var camera = player.get_node("../CameraPivot/Camera3D")
	var pivot = player.get_node("Pivot")
	
	var target_plane_mouse = Plane(Vector3(0,1,0), player.position.y)
	var ray_length = 1000
	var mouse_postion = player.get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_postion)
	var to = from + camera.project_ray_normal(mouse_postion) * ray_length
	var cursor_position_on_plane = target_plane_mouse.intersects_ray(from,to)
	
	if cursor_position_on_plane != null:
		var look_dir = (cursor_position_on_plane - player.global_transform.origin)
		look_dir.y = 0
		look_dir = look_dir.normalized()
		
		var target_rotation = atan2(-look_dir.x, -look_dir.z)
		pivot.rotation.y = target_rotation
