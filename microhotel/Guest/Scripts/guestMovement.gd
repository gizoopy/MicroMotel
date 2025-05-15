extends CharacterBody3D

@export var speed = 10

func _physics_process(delta: float):
	move_and_slide()

func initialize(start_position, door_position):
	look_at_from_position(start_position, door_position, Vector3.UP)
	rotate_y(randf_range(-PI / 4, PI / 4))
	velocity = Vector3.FORWARD * speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

#func _on_visible_on_screen_enabler_3d_screen_entered() -> void:
#Enter scene and go to the door

func _on_visible_on_screen_enabler_3d_screen_exited() -> void:
	queue_free()
