extends Area3D

class_name Interactor

var controller: Node3D

func interact(interactable: Interactable, delta) -> void:
		interactable.interact.emit(self, delta)
	
func get_closest_interactable() -> Interactable:
	var list: Array[Area3D] = get_overlapping_areas()
	var distance: float
	var closest_disatance: float = INF
	var closest: Interactable = null
	
	for interactable in list:
		distance = interactable.global_position.distance_to(global_position)
		
		if distance < closest_disatance:
			closest = interactable as Interactable
			closest_disatance = distance
			
	return closest
