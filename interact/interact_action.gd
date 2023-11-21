class_name InteractAction
extends Resource

enum INPUT_EVENT { PRESSED, RELEASED }

@export var input : String = "interact"
@export var input_event : INPUT_EVENT = INPUT_EVENT.PRESSED
@export var description : String = "to Interact"
@export var code : int = 0
