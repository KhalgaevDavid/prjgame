extends Node2D

var left_mass: float
var right_mass: float

var pane_mass: float
@onready var pane = $Pane

@onready var left_label = $Left/Mass
@onready var right_label = $Right/Mass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_labels() -> void:
	left_label.hide()
	right_label.hide()

func round_to_dec(num, digit) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func update_label() -> void:
	left_label.text = str(left_mass)
	right_label.text = str(right_mass)

func update_pane() -> void:
	pane_mass = right_mass - left_mass
	
	var pane_g: int = pane_mass * 1000
	if pane_g > 100:
		pane.rotation = PI / 2 + (PI / 18)
	elif pane_g < -100:
		pane.rotation = - (PI / 2 + (PI / 18))
	else:
		var og = (PI / 2) / 100 
		pane.rotation = og * pane_g

func left_body_entered(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	left_mass += mass
	left_mass = round_to_dec(left_mass, 3)
	update_label()
	update_pane()


func left_body_exited(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	left_mass -= mass
	left_mass = round_to_dec(left_mass, 3)
	update_label()
	update_pane()


func right_body_entered(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	right_mass += mass
	right_mass = round_to_dec(right_mass, 3)
	update_label()
	update_pane()


func right_body_excited(body: RigidBody2D) -> void:
	var mass = body.get_mass()
	right_mass -= mass
	right_mass = round_to_dec(right_mass, 3)
	update_label()
	update_pane()
