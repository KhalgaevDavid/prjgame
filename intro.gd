extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var next_scene_l = preload("res://Main.tscn").instantiate()

func next_scene() -> void:
	get_tree().root.add_child(next_scene_l)
	get_node("/root/Intro").queue_free()
