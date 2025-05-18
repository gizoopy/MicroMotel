extends StaticBody3D

func _on_interactable_interact(interactor: Interactor, delta) -> void:
	print("interacted with: " + str(name))
