extends CharacterBody3D

@export var speed = 20
@export var sprint_modifier = 2

@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	print("Speed: ", velocity.length())
	var direction = Vector3.ZERO
	var actual_speed = speed
	
	# Get inputs
	if Input.is_action_pressed("move_sprint"):
		actual_speed *= sprint_modifier
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	
	# Normailze speed
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	# Ground velocity
	target_velocity.x = direction.x * actual_speed
	target_velocity.z = direction.z * actual_speed
	
	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	# Move character
	velocity = target_velocity
	move_and_slide()

func _process(delta):
	look_at_cursor()

func look_at_cursor():
	var target_plane_mouse = Plane(Vector3(0,1,0), position.y)
	var ray_length = 1000
	var mouse_postion = get_viewport().get_mouse_position()
	var from = $"../CameraPivot/Camera3D".project_ray_origin(mouse_postion)
	var to = from + $"../CameraPivot/Camera3D".project_ray_normal(mouse_postion) * ray_length
	var cursor_position_on_plane = target_plane_mouse.intersects_ray(from,to)
	
	if cursor_position_on_plane != null:
		var look_dir = (cursor_position_on_plane - global_transform.origin)
		look_dir.y = 0
		look_dir = look_dir.normalized()
		
		var target_rotation = atan2(-look_dir.x, -look_dir.z)
		$Pivot.rotation.y = target_rotation
