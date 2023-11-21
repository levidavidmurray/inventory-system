class_name HandItem3D
extends Node3D

@export var item : InventoryItem
@export var actions : Array[InteractAction]

var interactor : InventoryInteractor

func get_actions(_interactor : InventoryInteractor) -> Array[InteractAction]:
	return actions

func interact(interactor : InventoryInteractor, _action_index : int = 0):
	pass
