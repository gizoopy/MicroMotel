extends Area3D

@export var _collision_size = Vector3(1,1,1)
@export var _linked_object = Node3D

func _ready():
	scale = _collision_size
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _interact_object(delta):
	_linked_object._interact(delta)

var player_in_area = false
var player_node = null

func _on_body_entered(body):
	if body.name == "Player":  # or body is in group("player")
		player_in_area = true
		player_node = body
		print("Player entered interaction area")
		body.set_current_interaction_area(self)

func _on_body_exited(body):
	if body == player_node:
		player_in_area = false
		player_node = null
		print("Player left interaction area")
		body.clear_current_interaction_area(self)
