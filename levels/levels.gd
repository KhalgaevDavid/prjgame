extends Node

@onready var GameController = $"../../"

var captured_body = null
@export var next_level: String

@onready var ns_button = $NextSceneBtn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Скрытие labels
	$Scales.hide_labels()
	ns_button.hide()
	
	# Соединение объектов Pickable к _on_pickable_clicked
	for node in get_tree().get_nodes_in_group("Pickable"):
		node.connect("clicked", _on_pickable_clicked.bind(node))
		print(node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pane_g = round($Scales.pane_mass * 1000)
	pane_g = abs(pane_g)
	if pane_g < 0.9:
		ns_button.show()
	else:
		ns_button.hide()
 

func _on_pickable_clicked(body):
	if !captured_body:
		captured_body = body
		captured_body.pick()
		print("pick ", body)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if captured_body && !event.pressed:
			captured_body.drop()
			captured_body = null


func next_scene() -> void:
	GameController.replace_scene(next_level)
