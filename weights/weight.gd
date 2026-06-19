extends RigidBody2D

signal clicked
@export var active: bool
var captured: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if captured:
		global_transform.origin = get_viewport().get_mouse_position()

func _input_event(viewport, event, idx) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			emit_signal("clicked")


func pick():
	if active:
		captured = true

func drop():
	captured = false
