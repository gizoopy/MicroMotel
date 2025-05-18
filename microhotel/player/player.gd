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

func _physics_process(delta):
	player_movement.update(delta, self)
	player_rotation.update(delta, self)
	player_respawn.update(delta, self)
