extends Node

var captured_body = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Pickable"):
		node.connect("clicked", _on_pickable_clicked.bind(node))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 
func _on_pickable_clicked(body):
	if !captured_body:
		captured_body = body
		captured_body.pick()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if captured_body && !event.pressed:
			captured_body.drop()
			captured_body = null
