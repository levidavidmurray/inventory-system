@tool
extends Hotbar
class_name NetworkedHotbar

var _selection_index_last_frame = -1


func _process(_delta):
	if multiplayer.is_server():
		return
	if is_multiplayer_authority():
		return

	# Handle initial state of remote peers
	if _selection_index_last_frame != selection_index:
		_selection_index_last_frame = selection_index
		slot_changed.emit(selection_index)


func set_selection_index(new_index: int):
	if not multiplayer.is_server():
		set_selection_index_rpc.rpc_id(1, new_index)
	else:
		set_selection_index_rpc(new_index)


@rpc("any_peer")
func set_selection_index_rpc(new_index: int):
	if not multiplayer.is_server():
		return
	set_selection_index_response_rpc.rpc(new_index)


@rpc("call_local")
func set_selection_index_response_rpc(new_index: int):
	super.set_selection_index(new_index)
	_selection_index_last_frame = new_index
