extends StaticBody3D

@export var _interact_time = 5

var _duration_pressed = 0

var _percentage_calc = 0

var visibility = false

func _ready():
	_percentage_calc = 100 / _interact_time

func _interact(delta):
	$Sprite3D.visible = true
	if _interact_time <= _duration_pressed:
		delta = 0
	
	_duration_pressed += delta
	$SubViewport/ProgressBar.value = _duration_pressed * _percentage_calc
	
func _on_interactable_end_interact(interactor: Interactor) -> void:
	_end_interact()
	
func _end_interact():
	if _interact_time <= _duration_pressed:
		$Sprite3D.visible = false
		print("Interaction Complete")
		_duration_pressed = 0
		$SubViewport/ProgressBar.value = 0


func _on_interactable_interact(interactor: Interactor, delta: Variant) -> void:
	print("delta: " + str(delta))
	print("interactor : " + str(interactor.controller.name))
	_interact(delta)
