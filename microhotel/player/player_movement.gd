class_name PlayerMovement
extends Resource

var target_velocity = Vector3.ZERO


func update(delta, player: CharacterBody3D):
	var direction = Vector3.ZERO
	var actual_speed = player.speed
	
	# Get inputs
	if Input.is_action_pressed("move_sprint"):
		actual_speed = player.speed * player.sprint_modifier
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
	if not player.is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (player.fall_acceleration * delta)
	
	# Move character
	player.velocity = target_velocity
	player.move_and_slide()
