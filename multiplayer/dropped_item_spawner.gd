class_name DropItemSpawner
extends MultiplayerSpawner

## Class that customizes the way the spawner generates objects on the network,
## placing information on the [PackedScene] of the dropped item, position and rotation.


func _init():
	spawn_function = _spawn_custom


func _spawn_custom(data: Array):
	# if (
	# 	data.size() != 3
	# 	or typeof(data[0]) != TYPE_VECTOR3
	# 	or typeof(data[1]) != TYPE_VECTOR3
	# 	or typeof(data[2]) != TYPE_STRING
	# ):
	# 	print("data error!")
	# 	return null
	var obj = load(data[2]).instantiate()
	obj.top_level = true
	obj.position = data[0]
	obj.rotation = data[1]
	if obj is PlacedItem and data.size() > 3:
		obj.freeze = data[3]
	return obj
