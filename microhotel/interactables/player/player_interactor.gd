extends Interactor

@export var player: CharacterBody3D

var cached_closest: Interactable

func _ready() -> void:
	controller = player
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and cached_closest.has_method("_end_interact"):
		print("node name: "+ str(cached_closest.name))
		cached_closest._interact(cached_closest,delta)
	if Input.is_action_just_released("interact") and cached_closest.has_method("_end_interact"):
		print("node name: "+ str(cached_closest.name))
		cached_closest._end_interact(cached_closest)

func _physics_process(delta: float) -> void:
	var new_closest: Interactable = get_closest_interactable()
	if new_closest != cached_closest:
		cached_closest = new_closest
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if cached_closest:
			interact(cached_closest, get_process_delta_time())
	#if event.is_action_just_released("interact"):
		#if cached_closest:
			
