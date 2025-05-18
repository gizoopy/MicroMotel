extends CharacterBody3D

@export var speed = 20
@export var sprint_modifier = 2

@export var fall_acceleration = 75

@export var spawn_point = Vector3(0,0,0)
@export var respawn_height = -20

@onready var player_movement = PlayerMovement.new()
@onready var player_rotation = PlayerRotation.new()
@onready var player_respawn = PlayerRespawn.new()
@onready var player_money = PlayerMoney.new()

var interaction_areas: Array[Area3D] = []

func _physics_process(delta):
	player_movement.update(delta, self)
	player_rotation.update(delta, self)
	player_respawn.update(delta, self)

#func _process(delta):
	#if Input.is_action_pressed("interact") and interaction_areas.size() > 0:
		#var closest_area = get_closest_interaction_area()
		#if closest_area and closest_area._linked_object and closest_area._linked_object.has_method("_interact"):
			#closest_area._linked_object._interact(delta)
	#if Input.is_action_just_released("interact") and interaction_areas.size() > 0:
		#var closest_area = get_closest_interaction_area()
		#if closest_area and closest_area._linked_object and closest_area._linked_object.has_method("_end_interact"):
			#closest_area._linked_object._end_interact()

func set_current_interaction_area(area: Area3D):
	if area not in interaction_areas:
		interaction_areas.append(area)

func clear_current_interaction_area(area: Area3D):
	interaction_areas.erase(area)

func get_closest_interaction_area() -> Area3D:
	var closest_area: Area3D = null
	var closest_distance = INF
	for area in interaction_areas:
		var dist = global_position.distance_to(area.global_position)
		if dist < closest_distance:
			closest_distance = dist
			closest_area = area
	return closest_area
