extends Node

# Reference to the container where dynamic scenes will be loaded
@onready var scene_holder = $SceneHolder

# Track the currently loaded scene
var current_scene_node = null

func _ready():
	# If you placed a default scene inside SceneHolder in the editor,
	# grab a reference to it
	if scene_holder.get_child_count() > 0:
		current_scene_node = scene_holder.get_child(0)

## Replace whatever scene is currently in SceneHolder with a new one
## @param path: String - the resource path to the .tscn file you want to load
func replace_scene(path: String) -> void:
	# Defer to avoid freeing a node that's still executing code
	_deferred_replace_scene.call_deferred(path)

func _deferred_replace_scene(path: String) -> void:
	# Remove the current scene if one exists
	if current_scene_node != null:
		current_scene_node.free()
		current_scene_node = null
	
	# Load and instantiate the new scene
	var new_scene = load(path)
	if new_scene == null:
		push_error("Failed to load scene at path: %s" % path)
		return
	
	current_scene_node = new_scene.instantiate()
	
	# Add it as a child of SceneHolder, NOT root
	scene_holder.add_child(current_scene_node)
	
	print("Scene replaced successfully with: %s" % path)

## Remove the current scene without loading a new one
func clear_scene() -> void:
	if current_scene_node != null:
		current_scene_node.free()
		current_scene_node = null
